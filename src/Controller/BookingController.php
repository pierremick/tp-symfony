<?php

namespace App\Controller;

use App\Entity\Booking;
use App\Entity\Position;
use App\Form\BookingType;
use App\Repository\BookingRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class BookingController extends AbstractController
{
    public function checkAvailability(Request $request, Position $position): Response
    {
        $form = $this->createFormBuilder()
            ->add('checkin', DateType::class, [
                'label' => 'Date d\'arrivée',
                'widget' => 'single_text',
                'html5' => false,
                'format' => 'dd/MM/yyyy',
                'attr' => [
                    'class' => 'datepicker'
                ]
            ])
            ->add('checkout', DateType::class, [
                'label' => 'Date de départ',
                'widget' => 'single_text',
                'html5' => false,
                'format' => 'dd/MM/yyyy',
                'attr' => [
                    'class' => 'datepicker'
                ]
            ])
            ->getForm();

        $bookingForm = $this->createForm(BookingType::class);

        $form->handleRequest($request);

        $is_available = null;
        if ($form->isSubmitted() && $form->isValid()) {
            $checkin = $form->get('checkin')->getData();
            $checkout = $form->get('checkout')->getData();

            $bookingRepository = $this->getDoctrine()->getRepository(Booking::class);
            $bookings = $bookingRepository->findByPositionAndDates($position, $checkin, $checkout);

            $is_available = count($bookings) == 0;

            if ($is_available) {
                $booking = new Booking();
                $booking->setPosition($position);
                $booking->setCheckin($checkin);
                $booking->setCheckout($checkout);

                $bookingForm = $this->createForm(BookingType::class, $booking);
            }
        }

        return $this->render('front/position.html.twig', [
            'position' => $position,
            'form' => $form->createView(),
            'bookingForm' => $bookingForm->createView(),
            'is_available' => $is_available,
        ]);
    }

    public function create(Request $request, Position $position): Response
    {
        $booking = new Booking();
        $booking->setPosition($position);

        $form = $this->createForm(BookingType::class, $booking);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $booking = $form->getData();
            $booking->setCreatedAt(new \DateTime());
            $booking->setUpdatedAt(new \DateTime());

            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->persist($booking);
            $entityManager->flush();

            return $this->redirectToRoute('app_booking_confirmation', ['id' => $booking->getId()]);
        }

        return $this->render('front/position.html.twig', [
            'position' => $position,
            'bookingForm' => $form->createView(),
        ]);
    }
}
