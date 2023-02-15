<?php

namespace App\Controller;

use App\Entity\User;
use App\Entity\Type;
use App\Form\PositionFilterType;
use App\Repository\PositionRepository;
use App\Form\RegistrationFormType;
use App\Repository\TypeRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Security\Http\Authentication\AuthenticationUtils;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Contracts\Translation\TranslatorInterface;

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

    #[Route('/nos-hebergements', name: 'app_positions')]
    public function positions(Request $request, PositionRepository $positionRepository): Response
    {
        $positions = $positionRepository->findByActive();

        $form = $this->createForm(PositionFilterType::class);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $data = $form->getData();

            $positions = $positionRepository->findByFilters(
                $data['type'],
                $data['capacity'],
                $data['price']
            );
        }

        return $this->render('front/positions.html.twig', [
            'page_title' => 'Les hébergements',
            'positions' => $positions,
            'form' => $form->createView(),
        ]);
    }

    #[Route('/positions/{slug}', name: 'app_position')]
    public function position(string $slug, PositionRepository $positionRepository): Response
    {
        $position = $positionRepository->findOneBySlug($slug);

        if (!$position) {
            throw $this->createNotFoundException('Aucune position trouvée');
        }

        return $this->render('front/position.html.twig', [
            'position' => $position,
        ]);
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
