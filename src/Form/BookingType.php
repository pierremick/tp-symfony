<?php

namespace App\Form;

use App\Entity\Booking;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class BookingType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('checkin')
            ->add('checkout')
            ->add('firstname')
            ->add('lastname')
            ->add('email')
            ->add('phone')
            ->add('address')
            ->add('zipcode')
            ->add('city')
            ->add('adults')
            ->add('childs')
            ->add('poolAdult')
            ->add('poolChild')
            ->add('createdAt')
            ->add('position')
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Booking::class,
        ]);
    }
}
