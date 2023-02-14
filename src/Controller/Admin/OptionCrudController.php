<?php

namespace App\Controller\Admin;

use App\Entity\Option;
use Doctrine\ORM\EntityManagerInterface;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractCrudController;
use EasyCorp\Bundle\EasyAdminBundle\Field\IdField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextField;
use EasyCorp\Bundle\EasyAdminBundle\Field\SlugField;
use EasyCorp\Bundle\EasyAdminBundle\Field\MoneyField;

class OptionCrudController extends AbstractCrudController
{
    public static function getEntityFqcn(): string
    {
        return Option::class;
    }

    public function configureFields(string $pageName): iterable
    {
        return [
            IdField::new('id')
                ->hideOnForm()
                ->hideOnIndex(),
            TextField::new('name', 'Libellé'),
            SlugField::new('slug')
                ->setTargetFieldName('name'),
            MoneyField::new('adultPrice', 'Adulte')
                ->setCurrency('EUR')
                ->setNumDecimals(2),
            MoneyField::new('childPrice', 'Enfant')
                ->setCurrency('EUR')
                ->setNumDecimals(2),
        ];
    }

    public function persistEntity(EntityManagerInterface $em, $entityInstance): void
    {
        if (!$entityInstance instanceof Option) return;
        parent::persistEntity($em, $entityInstance);
    }

    public function deleteEntity(EntityManagerInterface $em, $entityInstance): void
    {
        if (!$entityInstance instanceof Option) return;
        parent::deleteEntity($em, $entityInstance);
    }
}
