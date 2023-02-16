<?php

namespace App\Form;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\PasswordType;
use Symfony\Component\Validator\Constraints\NotBlank;
use Symfony\Component\Validator\Constraints\Length;
use Symfony\Component\Validator\Constraints\Regex;

class ChangePasswordType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('currentPassword', PasswordType::class, [
                'label' => 'Current password',
                'constraints' => [
                    new NotBlank([
                        'message' => 'Please enter your current password.',
                    ]),
                ],
            ])
            ->add('newPassword', PasswordType::class, [
                'label' => 'New password',
                'constraints' => [
                    new NotBlank([
                        'message' => 'Please enter a new password.',
                    ]),
                    new Length([
                        'min' => 8,
                        'minMessage' => 'Your password should be at least {{ limit }} characters.',
                        // max length allowed by Symfony for security reasons
                        'max' => 4096,
                    ]),
                    new Regex([
                        'pattern' => '/^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/',
                        'message' => 'Your password should contain at least 8 characters including at least one letter and one number.',
                    ]),
                ],
            ])
            ->add('confirmPassword', PasswordType::class, [
                'label' => 'Confirm new password',
                'constraints' => [
                    new NotBlank([
                        'message' => 'Please confirm your new password.',
                    ]),
                    new Length([
                        'min' => 8,
                        'minMessage' => 'Your password should be at least {{ limit }} characters.',
                        // max length allowed by Symfony for security reasons
                        'max' => 4096,
                    ]),
                    new Regex([
                        'pattern' => '/^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/',
                        'message' => 'Your password should contain at least 8 characters including at least one letter and one number.',
                    ]),
                ],
            ])
        ;
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults([
            'data_class' => null,
        ]);
    }
}
