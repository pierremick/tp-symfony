<?php

namespace App\Controller;

use DateTime;
use App\Entity\Booking;
use App\Entity\Company;
use App\Entity\Contact;
use App\Entity\Position;
use App\Entity\User;
use App\Entity\Type;
use App\Repository\PositionRepository;
use App\Repository\TypeRepository;
use App\Form\BookingType;
use App\Form\ContactType;
use App\Form\PositionFilterType;
use App\Form\RegistrationFormType;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Security\Http\Authentication\AuthenticationUtils;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Contracts\Translation\TranslatorInterface;
use Doctrine\ORM\EntityManagerInterface;


class CompanyController extends AbstractController
{

    #[Route('/', name: 'homepage')]
    public function company_homepage(): Response
    {
        return $this->render('front/homepage.html.twig', [
            'page_title' => "l’Espadrille Volante",
            'meta_description' => "Le Camping de l'Espadrille Volante, un lieu idéal pour passer des vacances natures mémorables en famille ou entre amis !"
        ]);
    }

    #[Route('/a-propos-du-camping', name: 'about')]
    public function company_about(): Response
    {
        return $this->render('front/about.html.twig', [
            'page_title' => "le camping",
            'meta_description' => "à propos du camping de l'Espadrille volante"
        ]);
    }

//    #[Route('/contacter-le-camping', name: 'contact')]
//    public function company_contact(): Response
//    {
//        return $this->render('front/contact.html.twig', [
//            'page_title' => "contacter le camping",
//            'meta_description' => "contacter le camping de l'Espadrille volante"
//        ]);
//    }


    #[Route('/contacter-le-camping', name: 'contact')]
    public function contact(Request $request)
    {
        $contact = new Contact();
        $form = $this->createForm(ContactType::class, $contact);

        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {
            $contact->setCreatedAt(new \DateTime());
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->persist($contact);
            $entityManager->flush();

            $this->addFlash('success', 'Votre message a bien été envoyé.');

            return $this->redirectToRoute('contact');
        }

        return $this->render('front/contact.html.twig', [
            'form' => $form->createView(),
        ]);
    }


    // LA CONNNEXION
    #[Route('/connexion', name: 'login')]
    public function login(AuthenticationUtils $authenticationUtils): Response
    {
        // Récupère l'erreur de connexion s'il y en a une
        $error = $authenticationUtils->getLastAuthenticationError();

        // Récupère la dernière email nom renseignée par l'utilisateur
        $lastUsername = $authenticationUtils->getLastUsername();

        return $this->render('front/connexion.html.twig', [
            'page_title' => 'Connexion',
            'last_username' => $lastUsername,
            'error'         => $error,
        ]);
    }

    // LA DECONNEXION
    #[Route('/deconnexion', name: 'logout', methods: ['GET'])]
    public function logout()
    {
        // controller can be blank: it will never be called!
        throw new \Exception('Don\'t forget to activate logout in security.yaml');
    }

    // L'INSCRIPTION
    #[Route('/inscription', name: 'register')]
    public function register(Request $request, UserPasswordHasherInterface $userPasswordHasher, EntityManagerInterface $entityManager): Response
    {
        $user = new User();
        $form = $this->createForm(RegistrationFormType::class, $user);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            // encode the plain password
            $user->setPassword(
                $userPasswordHasher->hashPassword(
                    $user,
                    $form->get('password')->getData()
                )
            );

            $entityManager->persist($user);
            $entityManager->flush();
            // do anything else you need here, like send an email

            return $this->redirectToRoute('homepage');
        }

        return $this->render('front/inscription.html.twig', [
            'page_title' => "Inscription",
            'registrationForm' => $form->createView(),
        ]);
    }
}
