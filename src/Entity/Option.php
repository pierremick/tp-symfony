<?php

namespace App\Entity;

use App\Repository\OptionRepository;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: OptionRepository::class)]
#[ORM\Table(name: '`option`')]
class Option
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(length: 10)]
    private ?string $name = null;

    #[ORM\Column]
    private ?int $adultPrice = null;

    #[ORM\Column]
    private ?int $childPrice = null;

    #[ORM\Column(length: 10)]
    private ?string $slug = null;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getName(): ?string
    {
        return $this->name;
    }

    public function setName(string $name): self
    {
        $this->name = $name;

        return $this;
    }

    public function getAdultPrice(): ?int
    {
        return $this->adultPrice;
    }

    public function setAdultPrice(int $adultPrice): self
    {
        $this->adultPrice = $adultPrice;

        return $this;
    }

    public function getChildPrice(): ?int
    {
        return $this->childPrice;
    }

    public function setChildPrice(int $childPrice): self
    {
        $this->childPrice = $childPrice;

        return $this;
    }

    public function getSlug(): ?string
    {
        return $this->slug;
    }

    public function setSlug(string $slug): self
    {
        $this->slug = $slug;

        return $this;
    }
}
