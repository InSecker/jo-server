<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Serializer\Annotation\Groups;

/**
 * Restaurant
 *
 * @ORM\Table(name="restaurant")
 * @ORM\Entity
 */
class Restaurant
{
    /**
     * @var int
     *
     * @ORM\Column(name="restaurant_district", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $restaurantDistrict;

    /**
     * @var int
     *
     * @ORM\Column(name="rank", type="integer", nullable=false)
     * @Groups("district")
     */
    private $rank;

    /**
     * @var int
     *
     * @ORM\Column(name="unknown_prices", type="integer", nullable=false)
     * @Groups("district")
     */
    private $unknownPrices;

    /**
     * @var int
     *
     * @ORM\Column(name="low_prices", type="integer", nullable=false)
     * @Groups("district")
     */
    private $lowPrices;

    /**
     * @var int
     *
     * @ORM\Column(name="medium_prices", type="integer", nullable=false)
     * @Groups("district")
     */
    private $mediumPrices;

    /**
     * @var int
     *
     * @ORM\Column(name="high_prices", type="integer", nullable=false)
     * @Groups("district")
     */
    private $highPrices;

    /**
     * @var int
     *
     * @ORM\Column(name="total", type="integer", nullable=false)
     * @Groups("district")
     */
    private $total;

    public function getRestaurantDistrict(): ?int
    {
        return $this->restaurantDistrict;
    }

    public function getRank(): ?int
    {
        return $this->rank;
    }

    public function setRank(int $rank): self
    {
        $this->rank = $rank;

        return $this;
    }

    public function getUnknownPrices(): ?int
    {
        return $this->unknownPrices;
    }

    public function setUnknownPrices(int $unknownPrices): self
    {
        $this->unknownPrices = $unknownPrices;

        return $this;
    }

    public function getLowPrices(): ?int
    {
        return $this->lowPrices;
    }

    public function setLowPrices(int $lowPrices): self
    {
        $this->lowPrices = $lowPrices;

        return $this;
    }

    public function getMediumPrices(): ?int
    {
        return $this->mediumPrices;
    }

    public function setMediumPrices(int $mediumPrices): self
    {
        $this->mediumPrices = $mediumPrices;

        return $this;
    }

    public function getHighPrices(): ?int
    {
        return $this->highPrices;
    }

    public function setHighPrices(int $highPrices): self
    {
        $this->highPrices = $highPrices;

        return $this;
    }

    public function getTotal(): ?int
    {
        return $this->total;
    }

    public function setTotal(int $total): self
    {
        $this->total = $total;

        return $this;
    }


}
