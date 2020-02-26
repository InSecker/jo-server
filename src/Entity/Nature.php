<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;
use ApiPlatform\Core\Annotation\ApiResource;
use Symfony\Component\Serializer\Annotation\Groups;

/**
 * Nature
 *
 * @ORM\Table(name="nature")
 * @ORM\Entity
 */
class Nature
{
    /**
     * @var int
     *
     * @ORM\Column(name="nature_district", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $natureDistrict;

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
     * @ORM\Column(name="green_space", type="integer", nullable=false)
     * @Groups("district")
     */
    private $greenSpace;

    /**
     * @var int
     *
     * @ORM\Column(name="garden", type="integer", nullable=false)
     * @Groups("district")
     */
    private $garden;

    /**
     * @var int
     *
     * @ORM\Column(name="park", type="integer", nullable=false)
     * @Groups("district")
     */
    private $park;

    /**
     * @var int
     *
     * @ORM\Column(name="total", type="integer", nullable=false)
     * @Groups("district")
     */
    private $total;

    public function getNatureDistrict(): ?int
    {
        return $this->natureDistrict;
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

    public function getGreenSpace(): ?int
    {
        return $this->greenSpace;
    }

    public function setGreenSpace(int $greenSpace): self
    {
        $this->greenSpace = $greenSpace;

        return $this;
    }

    public function getGarden(): ?int
    {
        return $this->garden;
    }

    public function setGarden(int $garden): self
    {
        $this->garden = $garden;

        return $this;
    }

    public function getPark(): ?int
    {
        return $this->park;
    }

    public function setPark(int $park): self
    {
        $this->park = $park;

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
