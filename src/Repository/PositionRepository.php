<?php

namespace App\Repository;

use App\Entity\Position;
use App\Entity\User;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @extends ServiceEntityRepository<Position>
 *
 * @method Position|null find($id, $lockMode = null, $lockVersion = null)
 * @method Position|null findOneBy(array $criteria, array $orderBy = null)
 * @method Position[]    findAll()
 * @method Position[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class PositionRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Position::class);
    }

    public function save(Position $entity, bool $flush = false): void
    {
        $this->getEntityManager()->persist($entity);

        if ($flush) {
            $this->getEntityManager()->flush();
        }
    }

    public function remove(Position $entity, bool $flush = false): void
    {
        $this->getEntityManager()->remove($entity);

        if ($flush) {
            $this->getEntityManager()->flush();
        }
    }

    public function findByOwner(User $owner)
    {
        return $this->createQueryBuilder('p')
            ->where('p.owner = :owner')
            ->setParameter('owner', $owner)
            ->orderBy('p.createdAt', 'DESC')
            ->getQuery()
            ->getResult();
    }

    //public function findAllActivePositions()
    //{
    //    return $this->createQueryBuilder('p')
    //        ->andWhere('p.active = :active')
    //        ->setParameter('active', true)
    //        ->getQuery()
    //        ->getResult();
    //}

    public function findByType($type)
    {
        return $this->createQueryBuilder('p')
            ->join('p.type', 't')
            ->andWhere('t = :type')
            ->setParameter('type', $type)
            ->getQuery()
            ->getResult();
    }

    public function findByCapacity($capacity)
    {
        return $this->createQueryBuilder('p')
            ->join('p.type', 't')
            ->andWhere('t.capacity >= :capacity')
            ->setParameter('capacity', $capacity)
            ->getQuery()
            ->getResult();
    }

    public function findByActive($active)
    {
        return $this->createQueryBuilder('p')
            ->andWhere('p.active = :active')
            ->setParameter('active', $active)
            ->getQuery()
            ->getResult();
    }

//    /**
//     * @return Position[] Returns an array of Position objects
//     */
//    public function findByExampleField($value): array
//    {
//        return $this->createQueryBuilder('p')
//            ->andWhere('p.exampleField = :val')
//            ->setParameter('val', $value)
//            ->orderBy('p.id', 'ASC')
//            ->setMaxResults(10)
//            ->getQuery()
//            ->getResult()
//        ;
//    }

//    public function findOneBySomeField($value): ?Position
//    {
//        return $this->createQueryBuilder('p')
//            ->andWhere('p.exampleField = :val')
//            ->setParameter('val', $value)
//            ->getQuery()
//            ->getOneOrNullResult()
//        ;
//    }
}
