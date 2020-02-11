<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;
use ApiPlatform\Core\Annotation\ApiResource;
use ApiPlatform\Core\Annotation\ApiFilter;
use ApiPlatform\Core\Bridge\Doctrine\Orm\Filter\SearchFilter;

/**
 * Travel
 *
 * @ORM\Table(name="travel", indexes={@ORM\Index(name="id_competition", columns={"id_competition"})})
 * @ORM\Entity
 * @ApiResource(
 *     collectionOperations={"get"},
 *     itemOperations={"get"}
 * )
 * @ApiFilter(SearchFilter::class, properties={"idCompetition": "exact"})
 * 
 */
class Travel
{
    /**
     * @var int
     *
     * @ORM\Column(name="id_travel", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $idTravel;

    /**
     * @var int
     *
     * @ORM\Column(name="area", type="integer", nullable=false)
     */
    private $area;

    /**
     * @var int
     *
     * @ORM\Column(name="time", type="integer", nullable=false)
     */
    private $time;

    /**
     * @var int
     *
     * @ORM\Column(name="correspondence", type="integer", nullable=false)
     */
    private $correspondence;

    /**
     * @var \Competition
     *
     * @ORM\ManyToOne(targetEntity="Competition")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="id_competition", referencedColumnName="id_competition")
     * })
     */
    private $idCompetition;

    public function getIdTravel(): ?int
    {
        return $this->idTravel;
    }

    public function getArea(): ?int
    {
        return $this->area;
    }

    public function setArea(int $area): self
    {
        $this->area = $area;

        return $this;
    }

    public function getTime(): ?int
    {
        return $this->time;
    }

    public function setTime(int $time): self
    {
        $this->time = $time;

        return $this;
    }

    public function getCorrespondence(): ?int
    {
        return $this->correspondence;
    }

    public function setCorrespondence(int $correspondence): self
    {
        $this->correspondence = $correspondence;

        return $this;
    }

    public function getIdCompetition(): ?Competition
    {
        return $this->idCompetition;
    }

    public function setIdCompetition(?Competition $idCompetition): self
    {
        $this->idCompetition = $idCompetition;

        return $this;
    }


}
