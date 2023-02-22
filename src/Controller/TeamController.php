<?php

namespace App\Controller;

use App\Entity\User;
use App\Entity\Booking;
use App\Entity\Customer;
use App\Entity\Position;
use App\Repository\BookingRepository;
use App\Repository\CustomerRepository;
use App\Repository\PositionRepository;
use App\Repository\UserRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class TeamController extends AbstractController
{
    #[Route('/account/team/team', name: 'team')]
    public function team(Request $request, UserRepository $userRepository): Response
    {
        // Récupère les positions actives à afficher
        $users = $userRepository->findBy(['isTeam' => true]);

        // Envoi la réponse à la vue dans le template twig 'front/archive_position.html.twig'
        return $this->render('account/team/index.html.twig', [
            'page_name' => 'Team',
            'page_title' => "L'équipe",
            'users' => $users,
        ]);
    }

    #[Route('/account/team/positions', name: 'team_positions')]
    public function team_positions(PositionRepository $positionRepository, Request $request): Response
    {
        // Récupérer les paramètres de tri dans l'URL
        $sortColumn = $request->query->get('sortColumn', 'id');
        $sortOrder = $request->query->get('sortOrder', 'asc');

        $positions = $positionRepository->findAllSorted($sortColumn, $sortOrder);

        return $this->render('account/team/team_positions.html.twig', [
            'positions' => $positions,
            'sortColumn' => $sortColumn,
            'sortOrder' => $sortOrder,
            'page_name' => 'emplacements',
            'page_title' => 'Emplacements',
        ]);
    }

    #[Route('/account/team/{order}', name: 'team_booking', requirements: ['order' => 'asc|desc'], defaults: ['order' => 'desc'])]
    public function team_booking(BookingRepository $bookingRepository, Request $request, $order): Response
    {
        $bookings = $bookingRepository->findBy([], [
            'createdAt' => $order,
            'checkin' => $order,
            'checkout' => $order,
            'position' => $order,
            'status' => $order,
        ]);

        $nextOrder = $order == 'asc' ? 'desc' : 'asc';

        return $this->render('account/team/team_booking.html.twig', [
            'page_name' => 'Bookings',
            'page_title' => 'Bookings',
            'bookings' => $bookings,
            'order' => $order,
            'nextOrder' => $nextOrder,
        ]);
    }

    #[Route('/account/team/booking/{id}', name: 'team_booking_show')]
    public function team_booking_show(Booking $booking): Response
    {
        return $this->render('account/team/team_booking_show.html.twig', [
            'booking' => $booking,
            'page_name' => "détail d'une réservation",
            'page_title' => "Détail d'une réservation",
        ]);
    }

    #[Route('/account/team/owner', name: 'team_owner')]
    public function team_owner(UserRepository $userRepository): Response
    {
        $users = $userRepository->findOwnersWithPositions();

        return $this->render('account/team/team_owner.html.twig', [
            'page_name' => 'Propriétaires',
            'page_title' => 'Propriétaires',
            'users' => $users,
        ]);
    }

    #[Route('/account/team/customers', name: 'team_customers')]
    public function team_customers(CustomerRepository $customerRepository, Request $request): Response
    {
        // Récupérer les paramètres de tri dans l'URL
        $sortColumn = $request->query->get('sortColumn', 'id');
        $sortOrder = $request->query->get('sortOrder', 'asc');

        $customers = $customerRepository->findAllSorted($sortColumn, $sortOrder);

        return $this->render('account/team/team_customers.html.twig', [
            'customers' => $customers,
            'sortColumn' => $sortColumn,
            'sortOrder' => $sortOrder,
            'page_name' => 'Clients',
            'page_title' => 'Clients',
        ]);
    }









    #[Route('/account/team/invoice', name: 'team_invoice')]
    public function team_invoice(): Response
    {
        return $this->render('account/team/team_invoice.html.twig', [
            'page_name' => 'Factures',
            'page_title' => 'Factures',
        ]);
    }
}
