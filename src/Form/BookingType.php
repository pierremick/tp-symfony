<?php

namespace App\Form;

use App\Entity\Booking;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\CheckboxType;
use Symfony\Component\Form\Extension\Core\Type\CountryType;
use Symfony\Component\Form\Extension\Core\Type\IntegerType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\Extension\Core\Type\DateType;


class BookingType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('checkin', DateType::class, [
                'row_attr' => [
                    'class' => 'mb-3', // Ajoute une classe de style à la row
                ],
                'label' => 'Date d\'arrivée',
                'widget' => 'single_text',
                'attr' => [
                    'min' => '2023-05-05',
                    'max' => '2023-10-10',
                ],
                'html5' => true,
            ])
            ->add('checkout', DateType::class, [
                'label' => 'Date de départ',
                'widget' => 'single_text',
                'attr' => [
                    'min' => '2023-05-05',
                    'max' => '2023-10-10',
                ],
                'html5' => true,
            ])
            ->add('submit', SubmitType::class, [
                'label' => 'Vérifier la disponibilité',
                'attr' => [
                    'class' => 'btn-primary w-100'
                ]
            ]);
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Booking::class,
        ]);
    }
}
