<?php
use DateTimeInterface;

class Booking
{
    // ...

    const HS_START_MONTH = 6;  // Juin
    const HS_START_DAY = 21;   // 21 juin
    const HS_END_MONTH = 8;    // Août
    const HS_END_DAY = 31;     // 31 août
    const RETRIBUTION = 0.15;  // 15%

    public function getRetribution(): float
    {
        $hsDays = $this->getPositionHsDays();
        $bsDays = $this->getPositionBsDays();
        $hsDayPrice = $this->getPosition()->getType()->getPrice() * 1.15 / 100;
        $bsDayPrice = $this->getPosition()->getType()->getPrice() / 100;
        $total = ($hsDays * $hsDayPrice) + ($bsDays * $bsDayPrice);
        return $total * self::RETRIBUTION;
    }

    private function getPositionHsDays(): int
    {
        $checkin = $this->getCheckin();
        $checkout = $this->getCheckout();
        $hsStart = new DateTimeImmutable(sprintf('%s-%s-%s', date('Y'), self::HS_START_MONTH, self::HS_START_DAY));
        $hsEnd = new DateTimeImmutable(sprintf('%s-%s-%s', date('Y'), self::HS_END_MONTH, self::HS_END_DAY));
        if ($checkout <= $hsStart || $checkin >= $hsEnd) {
            return 0;
        }
        $start = max($checkin, $hsStart);
        $end = min($checkout, $hsEnd);
        $interval = $start->diff($end);
        return $interval->days;
    }

    private function getPositionBsDays(): int
    {
        $checkin = $this->getCheckin();
        $checkout = $this->getCheckout();
        $hsStart = new DateTimeImmutable(sprintf('%s-%s-%s', date('Y'), self::HS_START_MONTH, self::HS_START_DAY));
        $hsEnd = new DateTimeImmutable(sprintf('%s-%s-%s', date('Y'), self::HS_END_MONTH, self::HS_END_DAY));
        $bsDays = 0;
        if ($checkin < $hsStart) {
            $start = $checkin;
            $end = min($checkout, $hsStart);
            $interval = $start->diff($end);
            $bsDays += $interval->days;
        }
        if ($checkout > $hsEnd) {
            $start = max($checkin, $hsEnd);
            $end = $checkout;
            $interval = $start->diff($end);
            $bsDays += $interval->days;
        }
        return $bsDays;
    }
}
