<?php

namespace App\Controller\Admin;

use App\Entity\Position;
use Doctrine\ORM\EntityManagerInterface;
use Doctrine\ORM\QueryBuilder;
use EasyCorp\Bundle\EasyAdminBundle\Config\Action;
use EasyCorp\Bundle\EasyAdminBundle\Config\Actions;
use EasyCorp\Bundle\EasyAdminBundle\Config\Crud;
use EasyCorp\Bundle\EasyAdminBundle\Context\AdminContext;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractCrudController;
use EasyCorp\Bundle\EasyAdminBundle\Field\AssociationField;
use EasyCorp\Bundle\EasyAdminBundle\Field\BooleanField;
use EasyCorp\Bundle\EasyAdminBundle\Field\DateTimeField;
use EasyCorp\Bundle\EasyAdminBundle\Field\IdField;
use EasyCorp\Bundle\EasyAdminBundle\Field\ImageField;
use EasyCorp\Bundle\EasyAdminBundle\Field\MoneyField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextareaField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextField;
use EasyCorp\Bundle\EasyAdminBundle\Field\SlugField;
use EasyCorp\Bundle\EasyAdminBundle\Router\AdminUrlGenerator;
use Symfony\Component\HttpFoundation\Response;

class PositionCrudController extends AbstractCrudController
{
    public const ACTION_DUPLICATE = 'duplicate';
    public const POSITIONS_BASE_PATH = 'upload/images/positions';
    public const POSITIONS_UPLOAD_DIR = 'public/upload/images/positions';

    public static function getEntityFqcn(): string
    {
        return Position::class;
    }

    public function configureActions(Actions $actions): Actions
    {
        $duplicate = Action::new(self::ACTION_DUPLICATE)
            ->linkToCrudAction('duplicatePosition')
            ->setCssClass('btn btn-info');

        return $actions
            ->add(Crud::PAGE_EDIT, $duplicate)
            ->reorder(Crud::PAGE_EDIT, [self::ACTION_DUPLICATE, Action::SAVE_AND_RETURN]);
    }

    public function configureFields(string $pageName): iterable
    {
        return [
            IdField::new('id')->hideOnForm(),
            AssociationField::new('owner', 'Propriétaire')
                ->renderAsNativeWidget()
                ->setRequired(false),
            AssociationField::new('type')->setQueryBuilder(function (QueryBuilder $queryBuilder) {
                $queryBuilder->where('entity.active = true');
            }),
            TextField::new('name'),
            SlugField::new('slug')
                ->setTargetFieldName('name')
                ->hideOnIndex(),
            TextareaField::new('description'),
            ImageField::new('image')
                ->setBasePath(self::POSITIONS_BASE_PATH)
                ->setUploadDir(self::POSITIONS_UPLOAD_DIR)
                ->setSortable(false),
            BooleanField::new('active'),
            DateTimeField::new('updatedAt')
                ->hideOnIndex()
                ->hideOnForm(),
            DateTimeField::new('createdAt')
                ->hideOnIndex()
                ->hideOnForm(),
        ];
    }


    public function persistEntity(EntityManagerInterface $em, $entityInstance): void
    {
        if (!$entityInstance instanceof Position) return;
        $entityInstance->setCreatedAt(new \DateTimeImmutable);
        parent::persistEntity($em, $entityInstance);
    }
    public function updateEntity(EntityManagerInterface $em, $entityInstance): void
    {
        if (!$entityInstance instanceof Position) return;
        $entityInstance->setUpdatedAt(new \DateTimeImmutable);
        parent::updateEntity($em, $entityInstance);
    }

    public function duplicatePosition(
        AdminContext $context,
        AdminUrlGenerator $adminUrlGenerator,
        EntityManagerInterface $em
    ): Response {
        /** @var Position $position */
        $position = $context->getEntity()->getInstance();

        $duplicatedPosition = clone $position;

        parent::persistEntity($em, $duplicatedPosition);

        $url = $adminUrlGenerator->setController(self::class)
            ->setAction(Action::DETAIL)
            ->setEntityId($duplicatedPosition->getId())
            ->generateUrl();

        return $this->redirect($url);
    }
}
