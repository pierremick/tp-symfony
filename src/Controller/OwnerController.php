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

class OwnerController extends AbstractController
{
    #[Route('/account/owner', name: 'account_owner')]
    public function account_owner(PositionRepository $positionRepository): Response
    {
        $user = $this->getUser(); // Récupère l'utilisateur connecté
        $positions = $positionRepository->findByOwner($user);

        return $this->render('account/owner/index.html.twig', [
            'page_name' => 'propriétaire',
            'page_title' => 'Propriétaire',
            'positions' => $positions,
        ]);
    }
}
