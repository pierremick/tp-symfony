<?php

namespace App\Form;

use App\Entity\Type;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\IntegerType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class PositionFilterType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('type', EntityType::class, [
                'class' => Type::class,
                'choice_label' => 'name',
                'required' => false,
                'placeholder' => 'Tous les types',
            ])
            ->add('capacity', IntegerType::class, [
                'required' => false,
                'attr' => [
                    'placeholder' => 'Capacité minimale',
                ],
            ])
            ->add('price', IntegerType::class, [
                'required' => false,
                'attr' => [
                    'placeholder' => 'Prix régulier',
                ],
            ])
            ->add('submit', SubmitType::class, [
                'label' => 'Filtrer',
            ]);
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults([
            'method' => 'GET',
        ]);
    }
}