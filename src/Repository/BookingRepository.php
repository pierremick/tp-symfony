<?php

namespace App\Repository;

use App\Entity\Booking;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @extends ServiceEntityRepository<Booking>
 *
 * @method Booking|null find($id, $lockMode = null, $lockVersion = null)
 * @method Booking|null findOneBy(array $criteria, array $orderBy = null)
 * @method Booking[]    findAll()
 * @method Booking[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class BookingRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Booking::class);
    }

    public function save(Booking $entity, bool $flush = false): void
    {
        $this->getEntityManager()->persist($entity);

        if ($flush) {
            $this->getEntityManager()->flush();
        }
    }

    public function remove(Booking $entity, bool $flush = false): void
    {
        $this->getEntityManager()->remove($entity);

        if ($flush) {
            $this->getEntityManager()->flush();
        }
    }

    public function findByPositionAndDates(Position $position, \DateTimeInterface $checkin, \DateTimeInterface $checkout): array
    {
        $qb = $this->createQueryBuilder('b')
            ->where('b.position = :position')
            ->andWhere(':checkin BETWEEN b.checkin AND b.checkout OR :checkout BETWEEN b.checkin AND b.checkout')
            ->setParameter('position', $position)
            ->setParameter('checkin', $checkin)
            ->setParameter('checkout', $checkout);

        return $qb->getQuery()->getResult();
    }

    public function countBookingsByOwnerAndUser($ownerId, $userId)
    {
        $qb = $this->createQueryBuilder('b')
            ->select('SUM(b.getDays()) as totalDays')
            ->addSelect('SUM(b.getBsDays()) as totalBsDays')
            ->addSelect('SUM(b.getHsDays()) as totalHsDays')
            ->where('b.position IN (SELECT p.id FROM App\Entity\Position p WHERE p.owner = :ownerId)')
            ->andWhere('b.user = :userId')
            ->setParameter('ownerId', $ownerId)
            ->setParameter('userId', $userId);

        return $qb->getQuery()->getOneOrNullResult();
    }
  }

//    /**
//     * @return Booking[] Returns an array of Booking objects
//     */
//    public function findByExampleField($value): array
//    {
//        return $this->createQueryBuilder('b')
//            ->andWhere('b.exampleField = :val')
//            ->setParameter('val', $value)
//            ->orderBy('b.id', 'ASC')
//            ->setMaxResults(10)
//            ->getQuery()
//            ->getResult()
//        ;
//    }

//    public function findOneBySomeField($value): ?Booking
//    {
//        return $this->createQueryBuilder('b')
//            ->andWhere('b.exampleField = :val')
//            ->setParameter('val', $value)
//            ->getQuery()
//            ->getOneOrNullResult()
//        ;
//    }
