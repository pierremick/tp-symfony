<?php

namespace App\Controller;

use DateTime;
use App\Entity\User;
use App\Entity\Company;
use App\Entity\Position;
use App\Entity\Type;
use App\Entity\Booking;
use App\Repository\PositionRepository;
use App\Repository\TypeRepository;
use App\Repository\UserRepository;
use App\Form\RegistrationFormType;
use App\Form\PositionFilterType;
use App\Form\BookingType;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Security\Http\Authentication\AuthenticationUtils;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordEncoderInterface;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Contracts\Translation\TranslatorInterface;
use Doctrine\ORM\EntityManagerInterface;

class AccountController extends AbstractController
{
    #[Route('/account', name: 'account')]
    public function account_positions(PositionRepository $positionRepository): Response
    {
        $user = $this->getUser(); // Récupère l'utilisateur connecté
        $positions = $positionRepository->findByOwner($user);

        return $this->render('account/index.html.twig', [
            'page_title' => 'Mon compte',
            'positions' => $positions,
        ]);
    }

    #[Route('/account/information', name: 'account_info')]
    public function account_info(UserRepository $userRepository): Response
    {
        $user = $this->getUser(); // Récupère l'utilisateur connecté

        return $this->render('account/account_information.html.twig', [
            'page_title' => 'Mon compte',
        ]);
    }

    #[Route('/account/change-password', name: 'change_password')]
    public function changePassword(Request $request, UserPasswordEncoderInterface $passwordEncoder): Response
    {
        $user = $this->getUser();
        $form = $this->createForm(ChangePasswordType::class, null, [
            'action' => $this->generateUrl('account_change_password'),
        ]);

        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $data = $form->getData();

            $newEncodedPassword = $passwordEncoder->encodePassword($user, $data['newPassword']);

            $user->setPassword($newEncodedPassword);
            $this->getDoctrine()->getManager()->flush();

            $this->addFlash('success', 'Your password has been updated.');

            return $this->redirectToRoute('homepage');
        }

        return $this->render('account/change_password.html.twig', [
            'form' => $form->createView(),
        ]);
    }
}
