<?php

namespace App\Entity;

use App\Repository\BookingRepository;
use DateTime;
use DateTimeImmutable;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\DBAL\Types\Types;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: BookingRepository::class)]
class Booking
{
    // Constantes pour les prix, taux de TVA, taxes, etc.
    const DISCOUNT_RATE = 0.05;
    const HS_RATE = 1.15;
    const VAT_RATE_10 = 1.10;
    const VAT_RATE_20 = 1.20;
    const POOL_ADULT_PRICE = 1.50;
    const POOL_CHILD_PRICE = 1.00;
    const TAX_ADULT_PRICE = 60;
    const TAX_CHILD_PRICE = 35;
    const HS_START_MONTH = 6;  // Juin
    const HS_START_DAY = 21;   // 21 juin
    const HS_END_MONTH = 8;    // Août
    const HS_END_DAY = 31;     // 31 août
    const RETRIBUTION = 0.15;  // 15%

    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(type: Types::DATE_MUTABLE)]
    private ?\DateTimeInterface $checkin = null;

    #[ORM\Column(type: Types::DATE_MUTABLE)]
    private ?\DateTimeInterface $checkout = null;

    #[ORM\Column]
    private ?int $adult = null;

    #[ORM\Column(nullable: true)]
    private ?int $child = null;

    #[ORM\Column(nullable: true)]
    private ?int $adultPool = null;

    #[ORM\Column(nullable: true)]
    private ?int $childPool = null;

    #[ORM\ManyToOne(inversedBy: 'bookings')]
    #[ORM\JoinColumn(nullable: false)]
    private ?Position $position = null;

    #[ORM\Column]
    private ?\DateTimeImmutable $createdAt = null;

    #[ORM\Column(nullable: true)]
    private ?\DateTimeImmutable $updatedAt = null;

    #[ORM\Column(length: 20, nullable: true)]
    private ?string $status = null;

    #[ORM\ManyToOne(inversedBy: 'bookings')]
    private ?Customer $customer = null;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getCheckin(): ?\DateTimeInterface
    {
        return $this->checkin;
    }

    public function setCheckin(\DateTimeInterface $checkin): self
    {
        $this->checkin = $checkin;

        return $this;
    }

    public function getCheckout(): ?\DateTimeInterface
    {
        return $this->checkout;
    }

    public function setCheckout(\DateTimeInterface $checkout): self
    {
        $this->checkout = $checkout;

        return $this;
    }

    public function getAdult(): ?int
    {
        return $this->adult;
    }

    public function setAdult(int $adult): self
    {
        $this->adult = $adult;

        return $this;
    }

    public function getChild(): ?int
    {
        return $this->child;
    }

    public function setChild(?int $child): self
    {
        $this->child = $child;

        return $this;
    }

    public function getAdultPool(): ?int
    {
        return $this->adultPool;
    }

    public function setAdultPool(?int $adultPool): self
    {
        $this->adultPool = $adultPool;

        return $this;
    }

    public function getChildPool(): ?int
    {
        return $this->childPool;
    }

    public function setChildPool(?int $childPool): self
    {
        $this->childPool = $childPool;

        return $this;
    }

    public function getPosition(): ?Position
    {
        return $this->position;
    }

    public function setPosition(?Position $position): self
    {
        $this->position = $position;

        return $this;
    }

    public function getCreatedAt(): ?\DateTimeImmutable
    {
        return $this->createdAt;
    }

    public function setCreatedAt(\DateTimeImmutable $createdAt): self
    {
        $this->createdAt = $createdAt;

        return $this;
    }

    public function getUpdatedAt(): ?\DateTimeImmutable
    {
        return $this->updatedAt;
    }

    public function setUpdatedAt(?\DateTimeImmutable $updatedAt): self
    {
        $this->updatedAt = $updatedAt;

        return $this;
    }

    public function getStatus(): ?string
    {
        return $this->status;
    }

    public function setStatus(string $status): self
    {
        $this->status = $status;

        return $this;
    }

    // Retourne le nombre total de personnes (adultes + enfants)
    public function getPersons(): int
    {
        return $this->getAdult() + $this->getChild();
    }

    // Retourne le nombre de jours total de la réservation
    public function getDays(): int
    {
        $interval = $this->getCheckin()->diff($this->getCheckout());

        return $interval->days;
    }

    // Retourne le nombre de jours en haute saison
    public function getHsDays(): int
    {
        $startDate = new DateTime('2023-06-21');
        $endDate = new DateTime('2023-08-31');

        $hsDays = 0;
        $currentDate = clone $this->getCheckin();
        while ($currentDate <= $this->getCheckout()) {
            if ($currentDate >= $startDate && $currentDate <= $endDate) {
                $hsDays++;
            }
            $currentDate->modify('+1 day');
        }

        return $hsDays;
    }

    public function getNormalPrice(): float
    {
        $price = $this->getPosition()->getType()->getPrice();
        return $price / 100;
    }

    public function getHsPrice(): float
    {
        $price = $this->getNormalPrice();
        return $price * self::HS_RATE;
    }

    // Calcul du prix total Haute Saison
    public function getTotalPriceHsDays(): float
    {
        $hsDays = $this->getHsDays();
        $price = $this->getNormalPrice() * self::HS_RATE;

        return $hsDays * $price;
    }

    public function getBsDays(): int
    {
        $totalDays = $this->getDays();
        $hsDays = $this->getHsDays();

        return $totalDays - $hsDays;
    }

    // Calcul du prix total Basse Saison
    public function getTotalPriceBsDays(): float
    {
        $bsDays = $this->getBsDays();
        $price = $this->getNormalPrice();

        return $bsDays * $price;
    }

    public function getPoolAdultPrice(): float
    {
      return self::POOL_ADULT_PRICE;
    }

    public function getPoolChildPrice(): float
    {
      return self::POOL_CHILD_PRICE;
    }

    public function getTotalPoolAdultPrice(): float
    {
        $totalTickets = $this->getAdultPool();

        return $totalTickets * self::POOL_ADULT_PRICE;
    }

    public function getTotalPoolChildPrice(): float
    {
        $totalTickets = $this->getChildPool();

        return $totalTickets * self::POOL_CHILD_PRICE;
    }

    public function getTaxAdultQty(): int
    {
        $totalAdult = $this->getAdult();
        $totalDaysAdult = $this->getDays();
        return $totalAdult * $totalDaysAdult;
    }

    public function getTotalTaxAdultPrice(): int
    {
      $qty = $this->getTaxAdultQty();
      $total = $qty * self::TAX_ADULT_PRICE;

      return $total / 100;
    }

    // Nombre de taxe de séjour (enfant)
    public function getTaxChildQty(): int
    {
        $totalChild = $this->getChild();
        $totalDaysChild = $this->getDays();
        return $totalChild * $totalDaysChild;
    }

    // Calcul du montant total de la taxe de séjour (enfant)
    public function getTotalTaxChildPrice(): float
    {
        $qty = $this->getTaxChildQty();
        $total = $qty * self::TAX_CHILD_PRICE;

        return $total / 100;
    }


    public function getTotalTtc(): float
    {
        $positionBs = $this->getTotalPriceBsDays();
        $positionHs = $this->getTotalPriceHsDays();
        $poolAdult = $this->getTotalPoolAdultPrice();
        $poolChild = $this->getTotalPoolChildPrice();
        $totalPrice = $positionBs + $positionHs + $poolAdult + $poolChild;
        return $totalPrice;
    }

    public function getVat10(): float
    {
        $bs = $this->getTotalPriceBsDays();
        $hs = $this->getTotalPriceHsDays();
        $total = $bs + $hs;
        $ht = $total / self::VAT_RATE_10;
        $vat = $total - $ht;

        return $vat;
    }

    public function getVat20(): float
    {
        $adult = $this->getTotalPoolAdultPrice();
        $child = $this->getTotalPoolChildPrice();
        $total = $adult + $child;
        $ht = $total / self::VAT_RATE_20;
        $vat = $total - $ht;

        return $vat;
    }

    public function getTotalHt(): float
    {
        $ttc = $this->getTotalTtc();
        $vat10 = $this->getVat10();
        $vat20 = $this->getVat20();
        $total = $ttc - $vat10 + $vat20;

        return $total;
    }

    // Calcul du prix remisé
    public function getDiscountedPrice(): float
    {
        $price = 0;
        $totalDays = $this->getDays();
        $hsDays = $this->getHsDays();
        $bsDays = $this->getBsDays();
        $normalPrice = $this->getNormalPrice();

        // Calcule le prix total des jours en haute saison
        $hsPrice = $hsDays * $normalPrice * self::HS_RATE;
        $price += $hsPrice;

        // Calcule le prix total des jours en basse saison
        $bsPrice = $bsDays * $normalPrice;
        $price += $bsPrice;

        // Applique une remise pour chaque tranche de 7 jours
        $weeks = (int) ($totalDays / 7);
        for ($i = 0; $i < $weeks; $i++) {
            $price -= ($normalPrice * 7 * self::DISCOUNT_RATE);
        }

        return $price;
    }

    // Montant de la remise
    public function getDiscount(): float
    {
        $normalPrice = $this->getTotalPriceBsDays() + $this->getTotalPriceHsDays();
        $discountPrice = $this->getDiscountedPrice();
        $total = $normalPrice - $discountPrice;

        return $total;
    }

    public function getPayable(): float
    {
        $ttc = $this->getTotalTtc();
        $adultTax = $this->getTotalTaxAdultPrice();
        $childTax = $this->getTotalTaxChildPrice();
        $discount = $this->getDiscount();
        $total = $ttc + $adultTax + $childTax - $discount;

        return $total;
    }

    public function getCustomer(): ?Customer
    {
        return $this->customer;
    }

    public function setCustomer(?Customer $customer): self
    {
        $this->customer = $customer;

        return $this;
    }

    public function getRetribution(): float
    {
        $hsDays = $this->getPositionHsDays();
        $bsDays = $this->getPositionBsDays();
        $hsDayPrice = $this->getPosition()->getType()->getPrice() * 1.15 / 100;
        $bsDayPrice = $this->getPosition()->getType()->getPrice() / 100;
        $total = ($hsDays * $hsDayPrice) + ($bsDays * $bsDayPrice);
        return $total * self::RETRIBUTION;
    }

    private function getPositionHsDays(): int
    {
        $checkin = $this->getCheckin();
        $checkout = $this->getCheckout();
        $hsStart = new DateTimeImmutable(sprintf('%s-%s-%s', date('Y'), self::HS_START_MONTH, self::HS_START_DAY));
        $hsEnd = new DateTimeImmutable(sprintf('%s-%s-%s', date('Y'), self::HS_END_MONTH, self::HS_END_DAY));
        if ($checkout <= $hsStart || $checkin >= $hsEnd) {
            return 0;
        }
        $start = max($checkin, $hsStart);
        $end = min($checkout, $hsEnd);
        $interval = $start->diff($end);
        return $interval->days;
    }

    private function getPositionBsDays(): int
    {
        $checkin = $this->getCheckin();
        $checkout = $this->getCheckout();
        $hsStart = new DateTimeImmutable(sprintf('%s-%s-%s', date('Y'), self::HS_START_MONTH, self::HS_START_DAY));
        $hsEnd = new DateTimeImmutable(sprintf('%s-%s-%s', date('Y'), self::HS_END_MONTH, self::HS_END_DAY));
        $bsDays = 0;
        if ($checkin < $hsStart) {
            $start = $checkin;
            $end = min($checkout, $hsStart);
            $interval = $start->diff($end);
            $bsDays += $interval->days;
        }
        if ($checkout > $hsEnd) {
            $start = max($checkin, $hsEnd);
            $end = $checkout;
            $interval = $start->diff($end);
            $bsDays += $interval->days;
        }
        return $bsDays;
    }
}
