
construire pas à pas un formulaire de contact



// la function méthode dans le Controller


`#[Route('/contacter-le-camping', name: 'contact')]
public function company_contact(Request $request, \Swift_Mailer $mailer, EntityManagerInterface $entityManager): Response
{
    $contact = new Contact();

    // Vérifier si l'utilisateur est authentifié et pré-remplir les champs
    if ($security->isGranted('IS_AUTHENTICATED_FULLY')) {
        $user = $security->getUser();
        $contact->setFullname($user->getFullname());
        $contact->setEmail($user->getEmail());
        $contact->setPhone($user->getPhone());
    }

    $form = $this->createForm(ContactType::class, $contact);

    $form->handleRequest($request);
    if ($form->isSubmitted() && $form->isValid()) {
        $contact = $form->getData();

        // Envoi de l'e-mail
        $message = (new \Swift_Message($contact->getSubject()))
            ->setFrom($contact->getEmail())
            ->setTo($contact->getRecipient())
            ->setBody(
                $this->renderView(
                    'emails/contact.html.twig',
                    ['contact' => $contact]
                ),
                'text/html'
            );

        $mailer->send($message);

        // Enregistrement de la soumission dans la base de données
        $contact->setCreatedAt(new \DateTime());
        $entityManager->persist($contact);
        $entityManager->flush();

        $this->addFlash('success', 'Votre message a bien été envoyé');

        return $this->redirectToRoute('contact');
    }

    return $this->render('front/contact.html.twig', [
        'page_title' => "contacter le camping",
        'meta_description' => "contacter le camping de l'Espadrille volante",
        'form' => $form->createView()
    ]);
}`

// pour créer un champ de type select qui affiche les valeurs d'un champ de type enum : utiliser le type de champ ChoiceType de Symfony.
// créer un champ de type select dans le formulaire ContactType, basé sur le champ recipient de type enum :
// Modifiez le champ recipient pour qu'il soit de type ChoiceType et qu'il utilise les valeurs de l'énumération :

`use App\Entity\Contact;

// ...

class ContactType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('fullname')
            ->add('email')
            ->add('phone')
            ->add('subject')
            ->add('message')
            ->add('createdAt')
            ->add('recipient', ChoiceType::class, [
                'choices' => Contact::RECIPIENT_CHOICES
            ])
            ->add('status');
    }

    // ...
}`

Modification du champ recipient pour qu'il utilise le type de champ ChoiceType.
Nous avons également utilisé la constante RECIPIENT_CHOICES de la classe Contact pour définir les choix possibles pour le champ.
Cette constante est définie dans votre l'Entity Contact

`class Contact
{
    // ...

    public const RECIPIENT_CHOICES = [
        'Service comptable' => 'Service comptable',
        'Service commercial' => 'Service commercial',
        'Service technique' => 'Service technique',
        // ...
    ];

    // ...
}`

// Dans votre modèle Twig, vous pouvez afficher le champ recipient en utilisant la méthode form_widget(). Le type de champ ChoiceType de Symfony génère automatiquement un champ select pour afficher les choix possibles.

`{{ form_label(form.recipient) }}
{{ form_widget(form.recipient, { 'attr': {'class': 'form-control'} }) }}`

// Dans ce code, nous utilisons la méthode form_widget() pour afficher le champ recipient. Nous avons également utilisé l'option attr pour ajouter une classe CSS personnalisée au champ.
// Dans votre contrôleur, vous pouvez traiter le formulaire comme d'habitude. Les données soumises par l'utilisateur seront récupérées dans l'objet Contact et enregistrées dans la base de données.

`public function company_contact(Request $request, \Swift_Mailer $mailer, EntityManagerInterface $entityManager): Response
{
    $contact = new Contact();
    $form = $this->createForm(ContactType::class, $contact);

    $form->handleRequest($request);
    if ($form->isSubmitted() && $form->isValid()) {
        $contact = $form->getData();

        // Envoi de l'e-mail
        // ...

        // Enregistrement de la soumission dans la base de données
        $entityManager->persist($contact);
        $entityManager->flush();

        $this->addFlash('success', 'Votre message a bien été envoyé');

        return $this->redirectToRoute('contact');
    }

    return $this->render('front/contact.html.twig', [
        'page_title' => "contacter le camping",
        'meta_description' => "contacter le camping de l'Espadrille volante",
        'form' => $form->createView()
    ]);
}`




// Pour créer un champ de type select qui affiche les données provenant de la base de données utiliser le type de champ EntityType de Symfony.

// champ de type select dans le formulaire ContactType, basé sur une liste d'utilisateurs :
// modification du champ 'recipient' pour qu'il soit de type EntityType permettant d'utiliser les données de la base de données

`public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('fullname')
            ->add('email')
            ->add('phone')
            ->add('subject')
            ->add('message')
            ->add('createdAt')
            ->add('recipient', EntityType::class, [
                'class' => User::class,
                'choice_label' => function (User $user) {
                    return $user->getFirstname() . ' ' . $user->getLastname();
                },
                'choices' => $this->entityManager->getRepository(User::class)->findAll(),
                'placeholder' => 'Sélectionner un destinataire'
            ])
            ->add('status');
    }`

Modification du champ recipient pour qu'il utilise le type de champ EntityType.

Utilisation de la méthode getRepository() de l'objet EntityManager pour récupérer la liste des utilisateurs à partir de la base de données.
Définition d'une fonction anonyme pour la propriété choice_label qui retourne la concaténation des champs firstname et lastname de chaque utilisateur.
Ajout du placeholder pour afficher un texte par défaut dans le champ select.
Dans le modèle Twig, afficher le champ recipient avec la méthode form_widget().
Le type de champ EntityType de Symfony génère automatiquement un champ select pour afficher les choix possibles.

`{{ form_label(form.recipient) }}
{{ form_widget(form.recipient, { 'attr': {'class': 'form-control'} }) }}`

// La méthode form_widget() est utilisée pour afficher le champ recipient.
// L'option attr est utilisé pour ajouter une classe CSS personnalisée au champ.
// Dans le contrôleur, le formulaire est traité comme d'habitude.
// Les données soumises par l'utilisateur seront récupérées dans l'objet Contact
// et enregistrées dans la base de données.

`public function company_contact(Request $request, \Swift_Mailer $mailer, EntityManagerInterface $entityManager): Response
{
    $contact = new Contact();
    $form = $this->createForm(ContactType::class, $contact, ['entityManager' => $entityManager]);

    $form->handleRequest($request);
    if ($form->isSubmitted() && $form->isValid()) {
        $contact = $form->getData();

        // Envoi de l'e-mail
        // ...

        // Enregistrement de la soumission dans la base de données
        $entityManager->persist($contact);
        $entityManager->flush();

        $this->addFlash('success', 'Votre message a bien été envoyé');

        return $this->redirectToRoute('contact');
    }

    return`


Ajouter des messages d'aide dans FormType avec form_help

`use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\Extension\Core\Type\EmailType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormEvent;
use Symfony\Component\Form\FormEvents;

class ContactType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('fullname', TextType::class, [
                'label' => 'Nom complet',
                'help' => 'Entrez votre nom et prénom'
            ])
            ->add('email', EmailType::class, [
                'label' => 'Adresse e-mail',
                'help' => 'Entrez votre adresse e-mail'
            ])
            ->add('phone', TextType::class, [
                'label' => 'Numéro de téléphone',
                'help' => 'Entrez votre numéro de téléphone'
            ])
            ->add('subject', TextType::class, [
                'label' => 'Sujet',
                'help' => 'Entrez le sujet de votre message'
            ])
            ->add('message', TextareaType::class, [
                'label' => 'Message',
                'help' => 'Entrez votre message'
            ])
            ->add('createdAt')
            ->add('recipient', ChoiceType::class, [
                'label' => 'Destinataire',
                'help' => 'Sélectionnez le destinataire de votre message',
                'choices' => Contact::RECIPIENT_CHOICES,
                'placeholder' => 'Sélectionner un destinataire'
            ])
            ->add('status');
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Contact::class,
        ]);
    }
}`

Afficher les textes d'aide dans un modèle Twig en utilisant la méthode form_help() de la classe FormView.

`{{ form_start(form) }}
    {{ form_row(form.fullname) }}
    {{ form_help(form.fullname) }}
    {{ form_row(form.email) }}
    {{ form_help(form.email) }}
    {{ form_row(form.phone) }}
    {{ form_help(form.phone) }}
    {{ form_row(form.subject) }}
    {{ form_help(form.subject) }}
    {{ form_row(form.message) }}
    {{ form_help(form.message) }}
    {{ form_row(form.recipient) }}
    {{ form_help(form.recipient) }}
    {{ form_row(form.status) }}
{{ form_end(form) }}`
