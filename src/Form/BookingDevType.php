<?php

namespace App\Form;

use App\Entity\Booking;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\CheckboxType;
use Symfony\Component\Form\Extension\Core\Type\CountryType;
use Symfony\Component\Form\Extension\Core\Type\IntegerType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class BookingDevType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
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
            ->add('adult', IntegerType::class)
            ->add('child', IntegerType::class, [
                'required' => false,
            ])
            ->add('adultPool', IntegerType::class, [
                'required' => false,
            ])
            ->add('childPool', IntegerType::class, [
                'required' => false,
            ])
            ->add('firstname', TextType::class)
            ->add('lastname', TextType::class)
            ->add('address', TextType::class)
            ->add('zipcode', TextType::class)
            ->add('city', TextType::class)
            ->add('country', CountryType::class, [
                'preferred_choices' => [
                    'FR',
                    'ES',
                    'IT',
                    'DE',
                    'NL',
                    'BE',
                ],
            ])
            ->add('optin', CheckboxType::class, [
                'required' => false,
            ])
            ->add('submit', SubmitType::class, [
                'label' => 'Confirmer la réservation',
            ]);
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults([
            'data_class' => Booking::class,
        ]);
    }
}
