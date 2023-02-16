<?php

namespace App\Form;

use App\Entity\Booking;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\DateType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;

class BookingType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('checkin', DateType::class, [
                'widget' => 'single_text',
                'attr' => [
                    'min' => '2023-05-05',
                    'max' => '2023-10-10',
                ],
                'html5' => true,
            ])
            ->add('checkout', DateType::class, [
                'widget' => 'single_text',
                'attr' => [
                    'min' => '2023-05-05',
                    'max' => '2023-10-10',
                ],
                'html5' => true,
            ])
            ->add('submit', SubmitType::class, [
                'label' => 'Vérifier la disponibilité',
            ]);
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Booking::class,
        ]);
    }
}
