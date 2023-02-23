#[Route('/hebergement/{type}/{slug}', name: 'camping_place')]
public function camping_place(string $type, string $slug, Request $request, PositionRepository $positionRepository, TypeRepository $typeRepository): Response
{
    // Récupère la position en fonction du slug et du type
    $position = $positionRepository->findOneBy([
        'slug' => $slug,
        'type' => $typeRepository->findOneBy(['slug' => $type])
    ]);

    // Envoi une erreur 404 si la position n'existe pas
    if (!$position) {
        throw $this->createNotFoundException('Aucune position trouvée');
    }

    // Crée un nouveau formulaire de réservation
    $booking = new Booking();
    $form = $this->createForm(BookingType::class, $booking);

    // Gère la soumission du formulaire
    $form->handleRequest($request);

    // Si le formulaire a été soumis et est valide
    if ($form->isSubmitted() && $form->isValid()) {
        // Récupérer les dates de réservation à partir du formulaire
        $checkin = $booking->getCheckin();
        $checkout = $booking->getCheckout();

        // Vérifie si la position est disponible pour les dates sélectionnées
        if (!$this->checkAvailability($position, $checkin, $checkout)) {
            // Si la position n'est pas disponible, afficher un message d'erreur
            $this->addFlash('error', sprintf('Désolé : "%s" n\'est pas disponible aux dates choisies', $position->getName()));
        } else {
            // Si la position est disponible : enregistre les données de réservation dans la session
            $session = $request->getSession();
            $session->set('booking', [
                'position_id' => $position->getId(),
                'checkin' => $checkin->format('Y-m-d'),
                'checkout' => $checkout->format('Y-m-d'),
            ]);

            // Affiche un message de confirmation
            $this->addFlash('success', sprintf('Super : "%s" est disponible aux dates choisies', $position->getName()));
            // Rediriger l'utilisateur vers la page de réservation
            //return $this->redirectToRoute('app_booking');
        }
    }

    // Affiche la page détail de la position avec le formulaire de réservation
    return $this->render('camping/camping_place.html.twig', [
        'position' => $position,
        'form' => $form->createView(),
    ]);
}

private function checkAvailability(Position $position, DateTime $checkin, DateTime $checkout): bool
{
    // Récupère la liste des réservations pour cette position
    $bookings = $position->getBookings();

    // Parcourt toutes les réservations pour vérifier s'il y a des conflits de dates
    foreach ($bookings as $booking) {
        // Si les dates de réservation chevauchent une réservation existante, la position n'est pas disponible
        if (($checkin < $booking->getCheckout()) && ($checkout > $booking->getCheckin())) {
            return false;
        }
    }
    // Si aucune réservation n'a été trouvée pour les dates sélectionnées, la position est disponible
    return true;
}
