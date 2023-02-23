# documentation

## BookingController

- La méthode booking_place : Elle permet de rechercher une position disponible pour les dates sélectionnées par l'utilisateur. Si une position est disponible, les données de réservation sont stockées dans la session et l'utilisateur est redirigé vers la page de détails de la réservation. Si la position n'est pas disponible, un message d'erreur est affiché.

- La méthode checkAvailability : Elle permet de vérifier si une position est disponible pour les dates sélectionnées par l'utilisateur. Elle parcourt les réservations existantes pour cette position et vérifie si les dates sélectionnées sont en conflit avec les dates de ces réservations. Si une réservation en conflit est trouvée, la méthode renvoie false. Sinon, elle renvoie true.

- La méthode customer_info : Elle permet de saisir les données client pour la réservation en cours. Elle récupère les données de réservation stockées dans la session, crée un nouveau formulaire de données client et gère la soumission de ce formulaire. Si le formulaire est valide, les données client sont stockées dans la session et l'utilisateur est redirigé vers la page de récapitulatif de la réservation.

- La méthode booking_summary : Elle affiche un récapitulatif de la réservation en cours en récupérant les données de réservation et de client stockées dans la session. Si ces données ne sont pas présentes en session, la méthode envoie une erreur 404.

- La méthode booking_summary_confirmation : Elle affiche une confirmation de la réservation en cours en récupérant les données de réservation et de client stockées dans la session. Si ces données ne sont pas présentes en session, la méthode envoie une erreur 404.
