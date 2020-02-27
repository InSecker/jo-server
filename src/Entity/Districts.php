<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;
use ApiPlatform\Core\Annotation\ApiResource;
use Symfony\Component\Serializer\Annotation\Groups;
use Symfony\Component\Serializer\Annotation\SerializedName;

/**
 * Districts
 *
 * @ORM\Table(name="districts", indexes={@ORM\Index(name="nature_district", columns={"nature_district"}), @ORM\Index(name="hotel_district", columns={"hotel_district"}), @ORM\Index(name="restaurant_district", columns={"restaurant_district"}), @ORM\Index(name="culture_district", columns={"culture_district"})})
 * @ORM\Entity
 * 
 * @ApiResource(normalizationContext={"groups"={"district"}})
 * 
 */
class Districts
{
    /**
     * @var int
     *
     * @ORM\Column(name="district", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     * @Groups({"district"})
     */
    private $district;

    /**
     * @var \Nature
     *
     * @ORM\ManyToOne(targetEntity="Nature")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="nature_district", referencedColumnName="nature_district")
     * })
     * @SerializedName("nature")
     * @Groups({"district"})
     */
    private $natureDistrict;

    /**
     * @var \Culture
     *
     * @ORM\ManyToOne(targetEntity="Culture")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="culture_district", referencedColumnName="culture_district")
     * })
     * @SerializedName("culture")
     * @Groups({"district"})
     */
    private $cultureDistrict;

    /**
     * @var \Hotel
     *
     * @ORM\ManyToOne(targetEntity="Hotel")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="hotel_district", referencedColumnName="hotel_district")
     * })
     * @SerializedName("hotel")
     * @Groups({"district"})
     */
    private $hotelDistrict;

    /**
     * @var \Restaurant
     *
     * @ORM\ManyToOne(targetEntity="Restaurant")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="restaurant_district", referencedColumnName="restaurant_district")
     * })
     * @SerializedName("restaurant")
     * @Groups({"district"})
     */
    private $restaurantDistrict;

    public function getDistrict(): ?int
    {
        return $this->district;
    }

    public function getNatureDistrict(): ?Nature
    {
        return $this->natureDistrict;
    }

    public function setNatureDistrict(?Nature $natureDistrict): self
    {
        $this->natureDistrict = $natureDistrict;

        return $this;
    }

    public function getCultureDistrict(): ?Culture
    {
        return $this->cultureDistrict;
    }

    public function setCultureDistrict(?Culture $cultureDistrict): self
    {
        $this->cultureDistrict = $cultureDistrict;

        return $this;
    }

    public function getHotelDistrict(): ?Hotel
    {
        return $this->hotelDistrict;
    }

    public function setHotelDistrict(?Hotel $hotelDistrict): self
    {
        $this->hotelDistrict = $hotelDistrict;

        return $this;
    }

    public function getRestaurantDistrict(): ?Restaurant
    {
        return $this->restaurantDistrict;
    }

    public function setRestaurantDistrict(?Restaurant $restaurantDistrict): self
    {
        $this->restaurantDistrict = $restaurantDistrict;

        return $this;
    }


}
