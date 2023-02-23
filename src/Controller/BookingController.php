<?php

namespace App\Controller;

use DateTime;
// use App\Entity\User;
use App\Entity\Company;
use App\Entity\Position;
use App\Entity\Type;
use App\Entity\Booking;
use App\Entity\Customer;
use App\Repository\PositionRepository;
use App\Repository\TypeRepository;
use App\Form\RegistrationFormType;
use App\Form\PositionFilterType;
use App\Form\BookingType;
use App\Form\CustomerType;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Form\Extension\Core\Type\DateType;
use Symfony\Component\Form\Extension\Core\Type\IntegerType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Session\SessionInterface;
use Symfony\Component\Security\Http\Authentication\AuthenticationUtils;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;
use Symfony\Component\Routing\Annotation\Route;
// use Symfony\Contracts\Translation\TranslatorInterface;
use Doctrine\ORM\EntityManagerInterface;

class BookingController extends AbstractController
{
  #[Route('/booking/{type}/{slug}', name: 'booking_place')]
  public function booking_place(string $type, string $slug, Request $request, PositionRepository $positionRepository, TypeRepository $typeRepository, EntityManagerInterface $entityManager): Response
  {
      // Récupère la position en fonction du slug et du type
      $position = $positionRepository->findOneBy([
          'slug' => $slug,
          'type' => $typeRepository->findOneBy(['slug' => $type])
      ]);

      // Envoi une erreur 404 si la position n'existe pas
      if (!$position) {
          throw $this->createNotFoundException('Aucune position trouvée');
      }

      // Crée un nouveau formulaire de recherche de disponibilité
      $availabilityForm = $this->createFormBuilder()
          ->add('checkin', DateType::class, [
              'label' => 'Date d\'arrivée',
              'widget' => 'single_text',
          ])
          ->add('checkout', DateType::class, [
              'label' => 'Date de départ',
              'widget' => 'single_text',
          ])
          ->add('adults', IntegerType::class, [
              'label' => 'Nombre d\'adultes',
          ])
          ->add('children', IntegerType::class, [
              'label' => 'Nombre d\'enfants',
          ])
          ->add('submit', SubmitType::class, ['label' => 'Vérifier la disponibilité'])
          ->getForm();

      // Gère la soumission du formulaire de recherche de disponibilité
      $availabilityForm->handleRequest($request);

      // Si le formulaire a été soumis et est valide
      if ($availabilityForm->isSubmitted() && $availabilityForm->isValid()) {
          // Récupère les données de réservation à partir du formulaire
          $data = $availabilityForm->getData();
          $checkin = $data['checkin'];
          $checkout = $data['checkout'];
          $adults = $data['adults'];
          $children = $data['children'];

          // Vérifie si la position est disponible pour les dates sélectionnées
          if (!$this->checkAvailability($position, $checkin, $checkout)) {
              // Si la position n'est pas disponible, afficher un message d'erreur
              $this->addFlash('error', sprintf('Désolé : "%s" n\'est pas disponible aux dates choisies', $position->getName()));
          } else {
              // Si la position est disponible : enregistre les données de réservation dans la session
              $session = $request->getSession();
              $session->set('booking', [
                  'position_id' => $position->getId(),
                  'checkin' => $checkin->format('Y-m-d'),
                  'checkout' => $checkout->format('Y-m-d'),
                  'adults' => $adults,
                  'children' => $children,
                  'adult_pool' => $request->request->get('adult_pool'),
                  'child_pool' => $request->request->get('child_pool')
              ]);

              // Affiche un message de confirmation
              $this->addFlash('success', sprintf('"%s" est disponible aux dates choisies', $position->getName()));

              // Crée le formulaire de détail de la réservation
              $booking = new Booking();
              $booking->setPosition($entityManager->getReference(Position::class, $position->getId()));
              $booking->setCheckin(new \DateTime($checkin));
              $booking->setCheckout(new \DateTime($checkout));
              $booking->setAdults($adults);
              $booking->setChildren($children);
              $booking->setAdultPool($request->request->get('adult_pool'));
              $booking->setChildPool($request->request->get('child_pool'));
              $bookingForm = $this->createForm(BookingType::class, $booking);

              // Affiche le formulaire de détail de la réservation
              return $this->render('booking/details.html.twig', [
                  'position' => $position,
                  'bookingForm' => $bookingForm->createView(),
                ]);
            }
        }

        // Affiche le formulaire de recherche de disponibilité
        return $this->render('booking/search.html.twig', [
            'position' => $position,
            'availabilityForm' => $availabilityForm->createView(),
        ]);

    }

    private function checkAvailability(Position $position, DateTime $checkin, DateTime $checkout): bool
    {
        $bookings = $position->getBookings();

        foreach ($bookings as $booking) {
            // Vérifie si les dates de réservation sont en conflit avec les dates sélectionnées
            if (($checkin >= $booking->getCheckin() && $checkin <= $booking->getCheckout()) || ($checkout >= $booking->getCheckin() && $checkout <= $booking->getCheckout())) {
                return false;
            }
        }

        return true;
    }


    #[Route('/informations-client', name: 'customer_info')]
    public function customer_info(Request $request, SessionInterface $session): Response
    {
        // Récupère les données de réservation stockées en session
        $booking = $session->get('booking');
        if (!$booking) {
            throw $this->createNotFoundException('Aucune réservation trouvée');
        }

        // Crée un nouveau formulaire de données client
        $customer = new Customer();
        $customer->setBooking($booking);
        $customerForm = $this->createForm(CustomerType::class, $customer);

        // Gère la soumission du formulaire de données client
        $customerForm->handleRequest($request);

        // Si le formulaire a été soumis et est valide
        if ($customerForm->isSubmitted() && $customerForm->isValid()) {
            // Enregistre les données client dans la session
            $session->set('customer', $customerForm->getData());

            // Redirige vers la page de récapitulatif de réservation
            return $this->redirectToRoute('booking_summary');
        }

        // Affiche le formulaire de données client avec les erreurs s'il y en a
        return $this->render('booking/customer.html.twig', [
            'booking' => $booking,
            'customerForm' => $customerForm->createView(),
        ]);
    }

    #[Route('/reservation/recapitulatif', name: 'booking_summary')]
    public function booking_summary(SessionInterface $session): Response
    {
        // Récupère les données de réservation et de client stockées en session
        $booking = $session->get('booking');
        $customer = $session->get('customer');

        // Envoie une erreur 404 si les données ne sont pas présentes en session
        if (!$booking || !$customer) {
            throw $this->createNotFoundException('Aucune réservation trouvée');
        }

        // Crée une nouvelle instance de l'entité Booking
        $bookingEntity = new Booking();
        $bookingEntity->setPosition($booking['position_id']);
        $bookingEntity->setCheckin(new DateTime($booking['checkin']));
        $bookingEntity->setCheckout(new DateTime($booking['checkout']));
        $bookingEntity->setAdults($booking['adults']);
        $bookingEntity->setChildren($booking['children']);
        $bookingEntity->setAdultPool($booking['adult_pool']);
        $bookingEntity->setChildPool($booking['child_pool']);
        $bookingEntity->setCustomer($customer);

        // Affiche un récapitulatif de la réservation
        return $this->render('booking/summary.html.twig', [
            'booking' => $booking,
            'customer' => $customer,
        ]);
    }

    #[Route('/reservation/confirmation', name: 'booking_summary_confirmation')]
    public function booking_summary_confirmation(SessionInterface $session): Response
    {
        // Récupère les données de réservation et de client stockées en session
        $booking = $session->get('booking');
        $customer = $session->get('customer');

        // Envoie une erreur 404 si les données ne sont pas présentes en session
        if (!$booking || !$customer) {
            throw $this->createNotFoundException('Aucune réservation trouvée');
        }

        // Crée une nouvelle instance de l'entité Booking à partir des données de session
        $bookingEntity = new Booking();
        $bookingEntity->setPosition($booking['position_id']);
        $bookingEntity->setCheckin(new DateTime($booking['checkin']));
        $bookingEntity->setCheckout(new DateTime($booking['checkout']));
        $bookingEntity->setAdults($booking['adults']);
        $bookingEntity->setChildren($booking['children']);
        $bookingEntity->setAdultPool($booking['adult_pool']);
        $bookingEntity->setChildPool($booking['child_pool']);
        $bookingEntity->setCustomer($customer);

        // Affiche un récapitulatif de la réservation
        return $this->render('booking/confirmation.html.twig', [
            'booking' => $bookingEntity,
            'customer' => $customer,
        ]);
    }

}
