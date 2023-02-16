<?php

namespace App\Controller;

use App\Repository\PositionRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class AccountController extends AbstractController
{
    #[Route('/account', name: 'app_account')]
    public function account_positions(PositionRepository $positionRepository): Response
    {
        $user = $this->getUser(); // Récupère l'utilisateur connecté
        $positions = $positionRepository->findByOwner($user);

        return $this->render('account/index.html.twig', [
            'page_title' => 'Mon compte',
            'positions' => $positions,
        ]);
    }

    #[Route('/account/change-password', name: 'account_change_password')]
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

            return $this->redirectToRoute('app_home');
        }

        return $this->render('account/change_password.html.twig', [
            'form' => $form->createView(),
        ]);
    }
}
