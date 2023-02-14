<?php

namespace App\Controller\Admin;

use App\Entity\Type;
use Doctrine\ORM\EntityManagerInterface;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractCrudController;
use EasyCorp\Bundle\EasyAdminBundle\Field\BooleanField;
use EasyCorp\Bundle\EasyAdminBundle\Field\DateTimeField;
use EasyCorp\Bundle\EasyAdminBundle\Field\IdField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextareaField;
use EasyCorp\Bundle\EasyAdminBundle\Field\SlugField;
use EasyCorp\Bundle\EasyAdminBundle\Field\NumberField;
use EasyCorp\Bundle\EasyAdminBundle\Field\MoneyField;

class TypeCrudController extends AbstractCrudController
{
    public static function getEntityFqcn(): string
    {
        return Type::class;
    }

    public function configureFields(string $pageName): iterable
    {
        return [
            IdField::new('id')
                ->hideOnForm()
                ->hideOnIndex(),
            TextField::new('name', 'Libellé'),
            SlugField::new('slug')
                ->setTargetFieldName('name')
                ->hideOnIndex(),
            TextareaField::new('description')
                ->hideOnIndex(),
            NumberField::new('capacity', 'Capacité')
                ->setNumDecimals(0),
            MoneyField::new('price', 'Prix')
                ->setCurrency('EUR')
                ->setNumDecimals(0),
            BooleanField::new('active', 'Disponible'),
            DateTimeField::new('updatedAt', 'Mise à jour')
                ->hideOnForm(),
            DateTimeField::new('createdAt')
                ->hideOnForm()
                ->hideOnIndex(),
        ];
    }

    public function persistEntity(EntityManagerInterface $em, $entityInstance): void
    {
        if (!$entityInstance instanceof Type) return;

        $entityInstance->setCreatedAt(new \DateTimeImmutable);

        parent::persistEntity($em, $entityInstance);
    }

    public function deleteEntity(EntityManagerInterface $em, $entityInstance): void
    {
        if (!$entityInstance instanceof Type) return;

        foreach ($entityInstance->getPositions() as $position) {
            $em->remove($position);
        }

        parent::deleteEntity($em, $entityInstance);
    }
}
