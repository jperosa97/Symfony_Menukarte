<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Bridge\Twig\Mime\TemplatedEmail;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Mailer\MailerInterface;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Mime\Email;
use Symfony\Component\Routing\Annotation\Route;

class MailerController extends AbstractController
{
    #[Route('/mail', name: 'mail')]
    public function sendEmail(MailerInterface $mailer, Request $request): Response
    {
        $emailForm = $this->createFormBuilder()
        ->add('nachricht', TextareaType::class, [
            'attr' => array('rows' => '5')
        ])
        ->add('abschicken', SubmitType::class)
        ->getForm();

       $emailForm->handleRequest($request);

        if ($emailForm->isSubmitted()) {
            $eingabe = $emailForm->getData();
            $text = ($eingabe['nachricht']);
            $tisch = 'tisch1';
            $email =(new TemplatedEmail())
                ->from('tisch1@menukarte.wip')
                ->to('kellner@menukarte.wip')
                ->subject('Bestellung')

            ->htmlTemplate('mailer/mail.html.twig')
            ->context([
                'tisch' => $tisch,
                'text' => $text,
            ]);

            $mailer->send($email);
                $this->addFlash('nachricht', 'Nachricht wurde gesendet');
            
            return  $this->redirect($this->generateUrl('mail'));
        }  

        return $this->render('mailer/index.html.twig', [
            'emailForm' => $emailForm->createView()
        ]);
    }
}
