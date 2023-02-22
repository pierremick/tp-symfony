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

class OwnerController extends AbstractController
{
    #[Route('/account/owner', name: 'account_owner')]
    public function account_owner(Request $request, UserRepository $userRepository): Response
    {
        // Récupère les positions actives à afficher
        $users = $userRepository->findOwnersWithPositions();

        // Envoi la réponse à la vue dans le template twig 'front/archive_position.html.twig'
        return $this->render('account/owner/index.html.twig', [
            'page_name' => 'proprietaire',
            'page_title' => "Propriétaire",
            'users' => $users,
        ]);
    }
}