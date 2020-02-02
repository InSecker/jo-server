<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;
use ApiPlatform\Core\Annotation\ApiResource;
use ApiPlatform\Core\Annotation\ApiFilter;
use ApiPlatform\Core\Bridge\Doctrine\Orm\Filter\SearchFilter;

/**
 * Competition
 *
 * @ORM\Table(name="competition", indexes={@ORM\Index(name="id_family", columns={"id_family"})})
 * @ORM\Entity
 * @ApiResource
 * @ApiFilter(SearchFilter::class, properties={"idFamily": "exact"})
 */
class Competition
{
    /**
     * @var int
     *
     * @ORM\Column(name="id_competition", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $idCompetition;

    /**
     * @var string
     *
     * @ORM\Column(name="name", type="string", length=255, nullable=false)
     */
    private $name;

    /**
     * @var string
     *
     * @ORM\Column(name="address", type="string", length=255, nullable=false)
     */
    private $address;

    /**
     * @var string
     *
     * @ORM\Column(name="city", type="string", length=255, nullable=false)
     */
    private $city;

    /**
     * @var \Family
     *
     * @ORM\ManyToOne(targetEntity="Family")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="id_family", referencedColumnName="id_family")
     * })
     */
    private $idFamily;

    public function getIdCompetition(): ?int
    {
        return $this->idCompetition;
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

    public function getAddress(): ?string
    {
        return $this->address;
    }

    public function setAddress(string $address): self
    {
        $this->address = $address;

        return $this;
    }

    public function getCity(): ?string
    {
        return $this->city;
    }

    public function setCity(string $city): self
    {
        $this->city = $city;

        return $this;
    }

    public function getIdFamily(): ?Family
    {
        return $this->idFamily;
    }

    public function setIdFamily(?Family $idFamily): self
    {
        $this->idFamily = $idFamily;

        return $this;
    }


}
