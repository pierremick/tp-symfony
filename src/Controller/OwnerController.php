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
    public function account_owner(Request $request, UserRepository $userRepository, PositionRepository $positionRepository): Response
    {
        $user = $this->getUser();
        $positions = $positionRepository->findByOwner($user);

        // Débogage
        foreach ($positions as $position) {
            dump($position->getBookings());
        }

        return $this->render('account/index.html.twig', [
            'page_title' => 'Mon compte',
            'positions' => $positions,
        ]);
    }
}
