<?php

namespace App\Controller\Admin;

use App\Entity\Type;
use App\Entity\Position;
use App\Entity\Option;
use EasyCorp\Bundle\EasyAdminBundle\Config\Crud;
use EasyCorp\Bundle\EasyAdminBundle\Config\Dashboard;
use EasyCorp\Bundle\EasyAdminBundle\Config\MenuItem;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractDashboardController;
use EasyCorp\Bundle\EasyAdminBundle\Router\AdminUrlGenerator;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class AdminController extends AbstractDashboardController
{
    public function __construct(
        private AdminUrlGenerator $adminUrlGenerator
    ) {
    }

    #[Route('/admin', name: 'admin')]
    public function index(): Response
    {
        $url = $this->adminUrlGenerator
            ->setController(PositionCrudController::class)
            ->generateUrl();

        return $this->redirect($url);
    }

    public function configureDashboard(): Dashboard
    {
        return Dashboard::new()
            ->setTitle('Admin Camping');
    }

    public function configureMenuItems(): iterable
    {
        yield MenuItem::linkToUrl('Site public', 'fas fa-home', '/');
        yield MenuItem::section('Booking');
        yield MenuItem::section('Config');
        yield MenuItem::subMenu('Emplacements', 'fas fa-bars')->setSubItems([
            MenuItem::linkToCrud('Voir les emplacements', 'fas fa-eye', Position::class),
            MenuItem::linkToCrud('Nouvel emplacement', 'fas fa-plus', Position::class)->setAction(Crud::PAGE_NEW)
        ]);
        yield MenuItem::subMenu('Types', 'fas fa-bars')->setSubItems([
            MenuItem::linkToCrud('Voir les types', 'fas fa-eye', Type::class),
            MenuItem::linkToCrud('Nouveau type', 'fas fa-plus', Type::class)->setAction(Crud::PAGE_NEW)
        ]);
        yield MenuItem::subMenu('Options', 'fas fa-bars')->setSubItems([
            MenuItem::linkToCrud('Voir les options', 'fas fa-eye', Option::class),
            MenuItem::linkToCrud('Nouvelle option', 'fas fa-plus', Option::class)->setAction(Crud::PAGE_NEW)
        ]);
    }
}
