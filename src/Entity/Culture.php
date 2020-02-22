<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;
use ApiPlatform\Core\Annotation\ApiResource;

/**
 * Culture
 *
 * @ORM\Table(name="culture")
 * @ORM\Entity
 * 
 * @ApiResource(
 *     collectionOperations={"get"},
 *     itemOperations={"get"}
 * )
 * 
 */
class Culture
{
    /**
     * @var int
     *
     * @ORM\Column(name="district", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $district;

    /**
     * @var int
     *
     * @ORM\Column(name="rank", type="integer", nullable=false)
     */
    private $rank;

    /**
     * @var int
     *
     * @ORM\Column(name="museum", type="integer", nullable=false)
     */
    private $museum;

    /**
     * @var int
     *
     * @ORM\Column(name="theater", type="integer", nullable=false)
     */
    private $theater;

    /**
     * @var int
     *
     * @ORM\Column(name="monument", type="integer", nullable=false)
     */
    private $monument;

    /**
     * @var int
     *
     * @ORM\Column(name="total", type="integer", nullable=false)
     */
    private $total;

    public function getDistrict(): ?int
    {
        return $this->district;
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

    public function getMuseum(): ?int
    {
        return $this->museum;
    }

    public function setMuseum(int $museum): self
    {
        $this->museum = $museum;

        return $this;
    }

    public function getTheater(): ?int
    {
        return $this->theater;
    }

    public function setTheater(int $theater): self
    {
        $this->theater = $theater;

        return $this;
    }

    public function getMonument(): ?int
    {
        return $this->monument;
    }

    public function setMonument(int $monument): self
    {
        $this->monument = $monument;

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
