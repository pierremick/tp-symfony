<?php

namespace App\Controller;

use App\Entity\User;
use App\Repository\UserRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class TeamController extends AbstractController
{
    #[Route('/account/team', name: 'team')]
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

    #[Route('/account/team/booking', name: 'team_booking')]
    public function team_booking(): Response
    {
        return $this->render('account/team/team_booking.html.twig', [
            'page_name' => 'Booking',
            'page_title' => 'Booking',
        ]);
    }

    #[Route('/account/team/customer', name: 'team_customer')]
    public function team_customer(): Response
    {
        return $this->render('account/team/team_customer.html.twig', [
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
