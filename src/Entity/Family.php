<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;
use ApiPlatform\Core\Annotation\ApiResource;

/**
 * Family
 *
 * @ORM\Table(name="family")
 * @ORM\Entity
 * @ApiResource
 */
class Family
{
    /**
     * @var int
     *
     * @ORM\Column(name="id_family", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $idFamily;

    /**
     * @var string
     *
     * @ORM\Column(name="name", type="string", length=255, nullable=false)
     */
    private $name;

    public function getIdFamily(): ?int
    {
        return $this->idFamily;
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


}
