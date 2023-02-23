# documentation

## Booking (Entity)

La classe Booking est l'entité qui représente une réservation pour une position (emplacements ou hébergements) donnée. Elle contient plusieurs propriétés qui représentent les informations associées à une réservation, telles que les dates d'arrivée et de départ, le nombre d'adultes et d'enfants, le nombre de billets pour la piscine, etc.

Le prix d'une réservation est calculé en fonction du nombre de jours réservés, du type de la position (emplacements ou hébergements) et de la saison (haute ou basse). La classe contient donc des méthodes qui permettent de calculer le prix total en fonction de ces facteurs. Il y a également des méthodes qui permettent de calculer la taxe de séjour et le montant de la remise appliquée, le cas échéant.

La classe utilise également des constantes pour définir les prix, taux de TVA, taxes, etc. Ces constantes sont utilisées dans les méthodes pour calculer le prix total.

La classe utilise l'ORM Doctrine pour la persistance des données. Les annotations #[ORM\Entity], #[ORM\Id], #[ORM\Column], #[ORM\ManyToOne], et #[ORM\JoinColumn] sont utilisées pour définir les propriétés de la classe et les relations avec d'autres entités. La classe utilise également le Repository BookingRepository pour l'accès aux données.

Ce code définit une classe Booking appartenant au namespace App\Entity. La classe représente une réservation effectuée par un client pour un emplacement de camping. Voici une description de la signification et de l'utilisation de chacune des parties du code :

La section suivante définit les constantes de la classe pour les prix, les taux de TVA, les taxes, etc.

### Constantes pour les prix, taux de TVA, taxes, etc.
const RETRIBUTION = 0.35; // 35%
const DISCOUNT_RATE = 0.05; // Remise 5%
const HS_RATE = 1.15; // +15%
const VAT_RATE_10 = 1.10;
const VAT_RATE_20 = 1.20;
const POOL_ADULT_PRICE = 1.50;
const POOL_CHILD_PRICE = 1.00;
const TAX_ADULT_PRICE = 60;
const TAX_CHILD_PRICE = 35;

### Propriétés de la classe :

- $id : l'identifiant unique de la réservation.
- $checkin et $checkout : la date d'arrivée et la date de départ de la réservation.
- $adult : le nombre d'adultes réservant l'emplacement.
- $child : le nombre d'enfants réservant l'emplacement.
- $adultPool et $childPool : le nombre de billets d'accès à la piscine réservés pour les adultes et les enfants.
- $position : l'emplacement réservé (associé à une position de camping).
- $createdAt et $updatedAt : la date de création et la date de dernière modification de la réservation.
- $status : le statut de la réservation (par exemple "En attente", "Confirmé", "Annulé", etc.).
- $customer : le client qui a effectué la réservation.

### Les méthodes de la classe : Getters et setters pour toutes les propriétés.

- getPersons() : retourne le nombre total de personnes (adultes + enfants) pour la réservation.
- getDays() : retourne le nombre de jours de la réservation.
- getHsDays() : retourne le nombre de jours en haute saison (déterminé en fonction des dates de la réservation).
- getNormalPrice() : retourne le prix normal de l'emplacement.
- getHsPrice() : retourne le prix de l'emplacement en haute saison.
- getTotalPriceHsDays() : calcule le prix total pour les jours en haute saison.
- getHsCash() : calcule la commission de l'entreprise pour les jours en haute saison.
- getBsDays() : retourne le nombre de jours en basse saison.
- getTotalPriceBsDays() : calcule le prix total pour les jours en basse saison.
- getBsCash() : calcule la commission de l'entreprise pour les jours en basse saison.
- getPoolAdultPrice() et getPoolChildPrice() : retournent les prix des billets d'accès à la piscine pour les adultes et les enfants.
- getTotalPoolAdultPrice() et getTotalPoolChildPrice() : calculent le prix total pour les billets d'accès à la piscine pour les adultes et les enfants.
- getTaxAdultQty() : retourne le nombre de taxe de séjour pour les adultes.
- getTotalTaxAdultPrice() : Cette méthode calcule le montant total de la taxe de séjour pour les adultes. Elle utilise la méthode getTaxAdultQty() pour récupérer le nombre total de nuits réservées par les adultes, multiplie ce nombre par le prix de la taxe de séjour pour les adultes (défini dans les constantes de la classe) et retourne le résultat en euros.
- getTaxChildQty() : Cette méthode calcule le nombre total de nuits réservées par les enfants en multipliant le nombre total de nuits réservées par le nombre d'enfants. Elle est utilisée pour le calcul du montant total de la taxe de séjour pour les enfants dans la méthode getTotalTaxChildPrice().
- getTotalTaxChildPrice() : Cette méthode calcule le montant total de la taxe de séjour pour les enfants. Elle utilise la méthode getTaxChildQty() pour récupérer le nombre total de nuits réservées par les enfants, multiplie ce nombre par le prix de la taxe de séjour pour les enfants (défini dans les constantes de la classe) et retourne le résultat en euros.
- getTotalTtc() : Cette méthode calcule le montant total de la réservation toutes taxes comprises (TTC). Elle utilise les méthodes getTotalPriceBsDays(), getTotalPriceHsDays(), getTotalPoolAdultPrice() et getTotalPoolChildPrice() pour calculer le prix total de la location, le prix total de l'accès à la piscine pour les adultes et pour les enfants. Ces prix sont ensuite additionnés pour obtenir le prix total TTC.
- getVat10() : Cette méthode calcule le montant de la TVA à 10% pour la réservation. Elle utilise les méthodes getTotalPriceBsDays() et getTotalPriceHsDays() pour calculer le montant total HT de la location en basse et haute saison. Elle calcule ensuite le montant HT total (en additionnant les montants HT de la location et de l'accès à la piscine pour les adultes), et calcule le montant de la TVA à 10% en appliquant le taux de 10% à ce montant HT.
- getVat20() : Cette méthode calcule le montant de la TVA à 20% pour la réservation. Elle utilise les méthodes getTotalPoolAdultPrice() et getTotalPoolChildPrice() pour calculer le montant HT total de l'accès à la piscine pour les adultes et pour les enfants, et calcule ensuite le montant de la TVA à 20% en appliquant le taux de 20% à ce montant HT.
- getTotalHt() : Cette méthode calcule le montant total HT de la réservation. Elle utilise les méthodes - getTotalTtc(), getVat10() et getVat20() pour calculer le montant HT total (en soustrayant la TVA à 10% et en ajoutant la TVA à 20% au prix TTC total).
- getDiscountedPrice() : Cette méthode calcule le montant total de la réservation après application d'une remise. Elle utilise les méthodes getNormalPrice(), getDays(), getHsDays() et getBsDays() pour calculer le prix total de...

## BookingController

- La méthode booking_place : Elle permet de rechercher une position disponible pour les dates sélectionnées par l'utilisateur. Si une position est disponible, les données de réservation sont stockées dans la session et l'utilisateur est redirigé vers la page de détails de la réservation. Si la position n'est pas disponible, un message d'erreur est affiché.

- La méthode checkAvailability : Elle permet de vérifier si une position est disponible pour les dates sélectionnées par l'utilisateur. Elle parcourt les réservations existantes pour cette position et vérifie si les dates sélectionnées sont en conflit avec les dates de ces réservations. Si une réservation en conflit est trouvée, la méthode renvoie false. Sinon, elle renvoie true.

- La méthode customer_info : Elle permet de saisir les données client pour la réservation en cours. Elle récupère les données de réservation stockées dans la session, crée un nouveau formulaire de données client et gère la soumission de ce formulaire. Si le formulaire est valide, les données client sont stockées dans la session et l'utilisateur est redirigé vers la page de récapitulatif de la réservation.

- La méthode booking_summary : Elle affiche un récapitulatif de la réservation en cours en récupérant les données de réservation et de client stockées dans la session. Si ces données ne sont pas présentes en session, la méthode envoie une erreur 404.

- La méthode booking_summary_confirmation : Elle affiche une confirmation de la réservation en cours en récupérant les données de réservation et de client stockées dans la session. Si ces données ne sont pas présentes en session, la méthode envoie une erreur 404.
