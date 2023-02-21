<?php

namespace App\Entity;

use App\Repository\BookingRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\DBAL\Types\Types;
use Doctrine\ORM\Mapping as ORM;
use DateTime;

#[ORM\Entity(repositoryClass: BookingRepository::class)]
class Booking
{
    // Constantes pour les prix, taux de TVA, taxes, etc.
    const DISCOUNT_RATE = 1.05;
    const HS_RATE = 1.15;
    const VAT_RATE_10 = 1.10;
    const VAT_RATE_20 = 1.20;
    const POOL_ADULT_PRICE = 1.50;
    const POOL_CHILD_PRICE = 1.00;
    const TAX_ADULT_PRICE = 0.60;
    const TAX_CHILD_PRICE = 0.35;

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

    public function __construct()
    {
        $this->purchaseOrders = new ArrayCollection();
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

    public function getTotalPriceHsDays(): float
    {
        // Récupère le nombre de jours en haute saison pour cette réservation et le mutiplie par 1.15
        $hsDays = $this->getHsDays();
        $position = $this->getPosition();
        $price = $position->getType()->getPrice() / 100 * self::HS_RATE;

        return $hsDays * $price;
    }

    public function getBsDays(): int
    {
        $totalDays = $this->getDays();
        $hsDays = $this->getHsDays();

        return $totalDays - $hsDays;
    }

    public function getTotalPriceBsDays(): float
    {
        $bsDays = $this->getBsDays();
        $position = $this->getPosition();
        $price = $position->getType()->getPrice();

        return $bsDays * $price;
    }

    public function getTotalPoolAdultPrice(): int
    {
        $totalTickets = $this->getAdultPool();

        return $totalTickets * self::POOL_ADULT_PRICE;
    }

    public function getTotalPoolChildPrice(): int
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
        $totalTax = $this->getTaxAdultQty();

        return $totalTax * self::TAX_ADULT_PRICE;
    }

    public function getTaxChildQty(): int
    {
        $totalChild = $this->getChild();
        $totalDaysChild = $this->getDays();
        return $totalChild * $totalDaysChild;
    }

    public function getTotalTaxChildPrice(): int
    {
        $totalTax = $this->getTaxChildQty();

        return $totalTax * self::TAX_CHILD_PRICE;
    }

    public function getTotalPositionTtcPrice(): int
    {
        $ttcPrice = $this->getTotalPriceBsDays() + $this->getTotalPriceBsDays();
        return $ttcPrice;
    }
    public function getTotalPositionHtPrice(): int
    {
        $htPrice = $this->getTotalPriceBsDays() + $this->getTotalPriceBsDays();
        return $htPrice / self::VAT_RATE_10;
    }
    public function getTotalVat10(): int
    {
        return $this->getTotalPositionTtcPrice() - $this->getTotalPositionHtPrice();
    }

    public function getTotalPoolTtcPrice(): int
    {
        return $this->getTotalPoolAdultPrice() + $this->getTotalPoolChildPrice();
    }

    public function getTotalPoolHtPrice(): int
    {
        return $this->getTotalPoolTtcPrice() / self::VAT_RATE_20;
    }

    public function getTotalVat20(): int
    {
        return $this->getTotalPoolTtcPrice() - $this->getTotalPoolHtPrice();
    }

    public function getTotalHt(): int
    {
        $positionHt = $this->getTotalPositionHtPrice() / 100;
        $poolHt = $this->getTotalPoolHtPrice();
        $tax = $this->getTotalTaxAdultPrice() + $this->getTotalTaxChildPrice();
        $total = $positionHt + $poolHt + $tax;
        return $total;
    }

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
}
