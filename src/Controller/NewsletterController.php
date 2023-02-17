<?php

namespace App\Controller;

use DateTime;
use App\Form\NewsletterType;
use App\Entity\Newsletter;
use App\Entity\User;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Doctrine\ORM\EntityManagerInterface;

class NewsletterController extends AbstractController
{
    private $entityManager;

    public function __construct(EntityManagerInterface $entityManager)
    {
        $this->entityManager = $entityManager;
    }

    #[Route('/newsletter', name: 'app_newsletter')]
    public function app_newsletter(Request $request): Response
    {
      // Vérifier si l'utilisateur est authentifié
      $user = $this->getUser();

      // Vérifier si l'utilisateur est déjà inscrit à la newsletter
      $entityManager = $this->getDoctrine()->getManager();
      $newsletter = $entityManager->getRepository(Newsletter::class)->findOneBy([
          'email' => $user->getEmail(),
      ]);

      // Si l'utilisateur est déjà inscrit, afficher une citation aléatoire
      if ($newsletter) {
          $quotes = [
              'Le camping, c\'est l\'occasion de se déconnecter de la technologie et de se reconnecter aux moustiques.',
              'Le camping, c\'est une occasion de partager des moments inoubliables avec les gens que vous aimez. Et les araignées.',
              'Le camping, c\'est l\'endroit où le silence est brisé par le chant des oiseaux, ou par les ronflements de votre voisin de tente.',
              // ...
          ];
          $quote = $quotes[array_rand($quotes)];

          return $this->render('_partials/_newsletter_quote.html.twig', [
              'quote' => $quote,
          ]);
      }

      // Sinon, affiche le formulaire d'inscription à la newsletter
      $newsletter = new Newsletter();

      // Pré-rempli les champs email et name avec les informations de l'utilisateur
      if ($user) {
          $newsletter->setEmail($user->getEmail());
          $newsletter->setName($user->getFirstName().' '.$user->getLastName());
      }

      $form = $this->createForm(NewsletterType::class, $newsletter);
      $form->handleRequest($request);

      if ($form->isSubmitted() && $form->isValid()) {
          // Enregistre l'objet Newsletter en base de données
          $entityManager = $this->getDoctrine()->getManager();
          $entityManager->persist($newsletter);
          $entityManager->flush();

          // Ajoute un message de confirmation
          $this->addFlash('success', 'Inscription à la newsletter réussie !');
      }

      return $this->render('_partials/_newsletter.html.twig', [
          'form' => $form->createView(),
      ]);
    }
}
