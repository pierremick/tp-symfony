<?php
// src/Enum/BookingStatus.php

namespace App\Enum;

use MyCLabs\Enum\Enum;

class BookingStatus extends Enum
{
    private const PENDING = 'pending';
    private const CONFIRMED = 'confirmed';
    private const CANCELLED = 'cancelled';
    private const CHECKIN = 'checkin';
    private const CKECKOUT = 'checkout';
    private const CLOSED = 'closed';
    private const INVOICED = 'invoiced';

    public static function getChoices(): array
    {
        return [
            'En attente' => self::PENDING,
            'Confirmée' => self::CONFIRMED,
            'Abandonnée' => self::CANCELLED,
            'Arrivé' => self::CHECKIN,
            'Départ' => self::CHECKOUT,
            'Clôturée' => self::CLOSED,
            'Facturé' => self::INVOICED,
        ];
    }
}
