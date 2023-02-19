<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class BookingController extends AbstractController
{
    #[Route('/booking', name: 'booking')]
    public function booking(): Response
    {
        return $this->render('front/booking.html.twig', [
            'controller_name' => 'BookingController',
        ]);
    }
}
