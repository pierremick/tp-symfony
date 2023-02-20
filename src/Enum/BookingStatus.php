<?php
// src/Enum/BookingStatus.php

namespace App\Enum;

use MyCLabs\Enum\Enum;

class BookingStatus extends Enum
{
    private const PENDING = 'pending';
    private const CONFIRMED = 'confirmed';
    private const CANCELLED = 'cancelled';
    private const ARRIVAL = 'arrival';
    private const DEPARTURE = 'departure';
    private const INVOICED = 'invoiced';

    public static function getChoices(): array
    {
        return [
            'En attente' => self::PENDING,
            'Confirmée' => self::CONFIRMED,
            'Abandonnée' => self::CANCELLED,
            'Arrivé' => self::ARRIVAL,
            'Départ' => self::DEPARTURE,
            'Facturé' => self::INVOICED,
        ];
    }
}

