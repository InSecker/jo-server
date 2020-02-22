<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;
use ApiPlatform\Core\Annotation\ApiResource;

/**
 * Hotel
 *
 * @ORM\Table(name="hotel")
 * @ORM\Entity
 * @ApiResource(
 *     collectionOperations={"get"},
 *     itemOperations={"get"}
 * )
 * 
 */
class Hotel
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
     * @ORM\Column(name="one_star", type="integer", nullable=false)
     */
    private $oneStar;

    /**
     * @var int
     *
     * @ORM\Column(name="two_stars", type="integer", nullable=false)
     */
    private $twoStars;

    /**
     * @var int
     *
     * @ORM\Column(name="three_stars", type="integer", nullable=false)
     */
    private $threeStars;

    /**
     * @var int
     *
     * @ORM\Column(name="four_stars", type="integer", nullable=false)
     */
    private $fourStars;

    /**
     * @var int
     *
     * @ORM\Column(name="five_stars", type="integer", nullable=false)
     */
    private $fiveStars;

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

    public function getOneStar(): ?int
    {
        return $this->oneStar;
    }

    public function setOneStar(int $oneStar): self
    {
        $this->oneStar = $oneStar;

        return $this;
    }

    public function getTwoStars(): ?int
    {
        return $this->twoStars;
    }

    public function setTwoStars(int $twoStars): self
    {
        $this->twoStars = $twoStars;

        return $this;
    }

    public function getThreeStars(): ?int
    {
        return $this->threeStars;
    }

    public function setThreeStars(int $threeStars): self
    {
        $this->threeStars = $threeStars;

        return $this;
    }

    public function getFourStars(): ?int
    {
        return $this->fourStars;
    }

    public function setFourStars(int $fourStars): self
    {
        $this->fourStars = $fourStars;

        return $this;
    }

    public function getFiveStars(): ?int
    {
        return $this->fiveStars;
    }

    public function setFiveStars(int $fiveStars): self
    {
        $this->fiveStars = $fiveStars;

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
