# Le système de réservation

## L'entité : Booking.php

La classe Booking est l'entité qui représente une réservation pour une position (un emplacement, un mobil-home, un hébergement plus globalement) précis. Elle contient plusieurs propriétés qui représentent les informations nécessaires à une réservation :

- la date d'arrivée (checkin)
- la date de départ (checkout)
- le nombre d'adultes
- le nombre d'enfants
- le nombre de tickets piscine pour adulte
- le nombre de tickets piscine pour adulte
- les informations sur le client
- la position à laquelle elle est liée
- un statut (en attente, annulée, confirmée, arrivée, départ, clôturée)

Le prix d'une réservation est calculé en fonction du nombre de jours réservés, du type de la position (emplacement) et de la saison (haute ou basse).

La classe contient donc les méthodes associées qui permettent de calculer le prix d'une réservation en fonction de ces différents facteurs. D'autres méthodes dans la classe permettent de calculer la taxe de séjour et le montant d'une éventuelle remise à appliquer, le cas échéant (dans ce cas, pour un séjour de minimum 7 jours consécutif, une remise de 5% par tranche de 7 jours).

Les différentes méthodes de la classe peuvent faire appel à des constantes qui permettent de définir en un seul endroit, les prix des options (tickets piscine), les taux de TVA (10% pour les hébergements, 20% pour les services tels que l'accès à la piscine), les taxes de séjour, etc. Ces constantes sont essentielles pour les calculs du prix total à payer par le clients ou de la rétribution à payer au propriétaire d'un mobilehome.

La classe Booking utilise l'ORM Doctrine pour la persistance des données.

Les annotations #[ORM\Entity], #[ORM\Id], #[ORM\Column], #[ORM\ManyToOne], et #[ORM\JoinColumn] sont utilisées pour définir les propriétés de la classe et les relations avec d'autres entités telles que Position. La classe utilise également le Repository BookingRepository pour l'accès aux données.

### Constantes pour les prix, taux de TVA, taxes, etc.

- const RETRIBUTION = 0.35; // 35% (pour le calcul de la rétribution au propriétaire)
- const DISCOUNT_RATE = 0.05; // 5% (pour le calcul de la remise à effectuer)
- const HS_RATE = 1.15; // 15% - Haute Saison (Hs)
- const VAT_RATE_10 = 1.10; // 10% (pour le calcul des prix HT et montant de TVA)
- const VAT_RATE_20 = 1.20; // 20% (pour le calcul des prix HT et montant de TVA)
- const POOL_ADULT_PRICE = 1.50; (le prix du ticket piscine adulte)
- const POOL_CHILD_PRICE = 1.00; (le prix du ticket piscine enfant)
- const TAX_ADULT_PRICE = 0.60; (le prix de la taxe de séjour adulte)
- const TAX_CHILD_PRICE = 0.35; (le prix de la taxe de séjour enfant)

### Propriétés de la classe :

- $id : identifiant unique de la réservation.
- $checkin et $checkout : date d'arrivée et date de départ.
- $adult : nombre d'adultes.
- $child : le nombre d'enfants.
- $adultPool et $childPool : le nombre de tickets piscine pour adultes et enfants.
- $position : emplacement concerné par la réservation.
- $createdAt et $updatedAt : date de création de la réservation date de dernière modification de.
- $status : statut de la réservation (pending, confirmed, cancelled, checkin, checkout, closed, invoiced).
- $customer : client qui a effectué la réservation.

### Les méthodes de la classe : Getters et setters pour toutes les propriétés.

- getPersons() : retourne le nombre total de personnes (adultes + enfants) pour la réservation.
- getDays() : retourne le nombre de jours de la réservation.
- getHsDays() : retourne le nombre de jours en haute saison.
- getBsDays() : retourne le nombre de jours en basse saison.
- getNormalPrice() : retourne le prix normal de l'emplacement.
- getHsPrice() : retourne le prix de l'emplacement en haute saison.
- getTotalPriceBsDays() : calcule le prix total pour les jours en basse saison.
- getTotalPriceHsDays() : calcule le prix total pour les jours en haute saison.
- getBsCash() : retourne le montant de la rétribution pour les jours en basse saison.
- getHsCash() : retourne le montant de la rétribution pour les jours en haute saison.
- getPoolAdultPrice() et getPoolChildPrice() : retournent le prix des billets d'accès à la piscine.
- getTotalPoolAdultPrice() et getTotalPoolChildPrice() : retournent les prix total des tickets piscine.
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
- La méthode booking_customer_info : Elle permet de saisir les données client pour la réservation en cours. Elle récupère les données de réservation stockées dans la session, crée un nouveau formulaire de données client et gère la soumission de ce formulaire. Si le formulaire est valide, les données client sont stockées dans la session et l'utilisateur est redirigé vers la page de récapitulatif de la réservation.
- La méthode booking_summary : Elle affiche un récapitulatif de la réservation en cours en récupérant les données de réservation et de client stockées dans la session. Si ces données ne sont pas présentes en session, la méthode envoie une erreur 404.
- La méthode booking_confirmation : Elle affiche une confirmation de la réservation en cours en récupérant les données de réservation et de client stockées dans la session. Si ces données ne sont pas présentes en session, la méthode envoie une erreur 404.

## Templates : templates/booking

- booking.html.twig
- booking_confirmation.html.twig
- booking_customer.html.twig
- booking_detail.html.twig
- booking_index.html.twig
- booking_place.html.twig
- booking_search_availability.html.twig
- booking_summary.html.twig