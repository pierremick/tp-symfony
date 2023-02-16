<?php

namespace App\Controller;

use DateTime;
use App\Entity\Position;
use App\Entity\Type;
use App\Entity\Booking;
use App\Repository\PositionRepository;
use App\Repository\TypeRepository;
use App\Form\RegistrationFormType;
use App\Form\PositionFilterType;
use App\Form\BookingType;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Security\Http\Authentication\AuthenticationUtils;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Contracts\Translation\TranslatorInterface;
use Doctrine\ORM\EntityManagerInterface;


class FrontController extends AbstractController
{

    #[Route('/', name: 'app_home')]
    public function index(): Response
    {
        return $this->render('front/index.html.twig', [
            'page_title' => "l’Espadrille Volante",
            'site_slogan' => "Camping Coopératif"
        ]);
    }

    #[Route('/position', name: 'app_positions')]
    public function positions(Request $request, PositionRepository $positionRepository): Response
    {
        $positions = $positionRepository->findByActive();

        $form = $this->createForm(PositionFilterType::class);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $data = $form->getData();

            $positions = $positionRepository->findByFilters(
                $data['type'],
                $data['capacity']
            );
        }

        return $this->render('front/archive_position.html.twig', [
            'page_title' => 'emplacements',
            'positions' => $positions,
            'form' => $form->createView(),
        ]);
    }

    #[Route('/positions/{slug}', name: 'app_position')]
    public function position(string $slug, Request $request, PositionRepository $positionRepository): Response
    {
        // Récupérer la position en fonction du slug
        $position = $positionRepository->findOneBySlug($slug);

        // Si la position n'existe pas, renvoyer une erreur 404
        if (!$position) {
            throw $this->createNotFoundException('Aucune position trouvée');
        }

        // Créer un nouveau formulaire de réservation
        $booking = new Booking();
        $form = $this->createForm(BookingType::class, $booking);

        // Gérer la soumission du formulaire
        $form->handleRequest($request);

        // Si le formulaire a été soumis et est valide
        if ($form->isSubmitted() && $form->isValid()) {
            // Récupérer les dates de réservation à partir du formulaire
            $checkin = $booking->getCheckin();
            $checkout = $booking->getCheckout();

            // Vérifier si la position est disponible pour les dates sélectionnées
            if (!$this->checkAvailability($position, $checkin, $checkout)) {
                // Si la position n'est pas disponible, afficher un message d'erreur
                $this->addFlash('error', sprintf('Désolé : "%s" n\'est pas disponible aux dates choisies', $position->getName()));
            } else {
                // Si la position est disponible, enregistrer les données de réservation dans la session
                $session = $request->getSession();
                $session->set('booking', [
                    'position_id' => $position->getId(),
                    'checkin' => $checkin->format('Y-m-d'),
                    'checkout' => $checkout->format('Y-m-d'),
                ]);

                // Afficher un message de confirmation
                $this->addFlash('success', sprintf('Super : "%s" est disponible aux dates choisies', $position->getName()));
                // Rediriger l'utilisateur vers la page de réservation
                //return $this->redirectToRoute('app_booking');
            }
        }

        // Afficher la page de détails de la position avec le formulaire de réservation
        return $this->render('front/detail_position.html.twig', [
            'position' => $position,
            'form' => $form->createView(),
        ]);
    }

    private function checkAvailability(Position $position, DateTime $checkin, DateTime $checkout): bool
    {
        // Récupérer la liste des réservations pour cette position
        $bookings = $position->getBookings();

        // Parcourir toutes les réservations pour vérifier s'il y a des conflits de dates
        foreach ($bookings as $booking) {
            // Si les dates de réservation chevauchent une réservation existante, la position n'est pas disponible
            if (($checkin < $booking->getCheckout()) && ($checkout > $booking->getCheckin())) {
                return false;
            }
        }

        // Si aucune réservation n'a été trouvée pour les dates sélectionnées, la position est disponible
        return true;
    }


    #[Route('/type/{slug}', name: 'app_positions_type')]
    public function positionsType($slug, TypeRepository $typeRepository): Response
    {
        $type = $typeRepository->findOneBySlug($slug);

        if (!$type) {
            throw $this->createNotFoundException('Type not found');
        }

        $positions = $type->getPositions();

        return $this->render('front/positions_type.html.twig', [
            'type' => $type,
            'positions' => $positions,
        ]);
    }

    #[Route('/camping-cooperatif', name: 'app_features')]
    public function features(): Response
    {
        return $this->render('front/services.html.twig', [
            'page_title' => 'Services et infrastructure',
        ]);
    }

    #[Route('/contact', name: 'app_contact')]
    public function contact(): Response
    {
        return $this->render('front/contact.html.twig', [
            'page_title' => 'Nous contacter',
        ]);
    }

    #[Route('/connexion', name: 'app_login')]
    public function login(AuthenticationUtils $authenticationUtils): Response
    {
        // get the login error if there is one
        $error = $authenticationUtils->getLastAuthenticationError();

        // last username entered by the user
        $lastUsername = $authenticationUtils->getLastUsername();

        return $this->render('front/connexion.html.twig', [
            'page_title' => 'Connexion',
            'last_username' => $lastUsername,
            'error'         => $error,
        ]);
    }

    #[Route('/logout', name: 'app_logout', methods: ['GET'])]
    public function logout()
    {
        // controller can be blank: it will never be called!
        throw new \Exception('Don\'t forget to activate logout in security.yaml');
    }

    #[Route('/register', name: 'app_register')]
    public function register(Request $request, UserPasswordHasherInterface $userPasswordHasher, EntityManagerInterface $entityManager): Response
    {
        $user = new User();
        $form = $this->createForm(RegistrationFormType::class, $user);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            // encode the plain password
            $user->setPassword(
                $userPasswordHasher->hashPassword(
                    $user,
                    $form->get('plainPassword')->getData()
                )
            );

            $entityManager->persist($user);
            $entityManager->flush();
            // do anything else you need here, like send an email

            return $this->redirectToRoute('app_home');
        }

        return $this->render('front/inscription.html.twig', [
            'page_title' => "Investir dans un camping",
            'registrationForm' => $form->createView(),
        ]);
    }
}
