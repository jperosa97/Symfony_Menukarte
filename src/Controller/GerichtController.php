<?php

namespace App\Controller;

use App\Entity\Gericht;
use App\Form\GerichtType;
use App\Repository\GerichtRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;

#[Route('/gericht', name: 'gericht.')]
class GerichtController extends AbstractController
{

    #[Route('/', name: 'bearbeiten')]
    public function index(GerichtRepository $gr): Response
    {
        $gerichte = $gr->findAll();

        return $this->render('gericht/index.html.twig', [
            'gerichte' => $gerichte,
        ]);
    }

    #[Route('/anlegen', name: 'anlegen')]
    public function anlegen(Request $request)
    {
        //Gericht anlgen mit der Datenbank
        $gericht = new Gericht();

        //Formular für Gericht
        $form = $this->createForm(GerichtType::class, $gericht);
        $form->handleRequest($request);

        //werden alle übermittelten Daten in die Datenbank gespeichert
        if($form->isSubmitted()) {
            //Entity Manager
            $em = $this->getDoctrine()->getManager();
            $bild = $request->files->get('gericht')['anhang'];

            if ($bild) {
                $dateianame = md5(uniqid()). '.'. $bild->guessClientExtension();
            }
            $bild->move(
                $this->getParameter('bilder_ordner'),
                $dateianame
            );

            $gericht->setBild($dateianame);
            $em->persist($gericht);
            $em->flush();

            return $this->redirect($this->generateUrl('gericht.bearbeiten'));
        }

        //Response ausgabe
        return $this->render('gericht/anlegen.html.twig', [
            'anlegenForm' => $form->createView(),
        ]);
    }

    //Ein gericht löschenfunktion
    #[Route('/entfernen/{id}', name: 'entfernen')]
    public function entfernen($id, GerichtRepository $gr){

        //Entity Manager
        $em = $this->getDoctrine()->getManager();
        $gericht = $gr->find($id);
        $em->remove($gericht);
        $em->flush();

        //message
        $this->addFlash('erfolg', 'Gericht wurde erfolgreich entfernt');

        return $this->redirect($this->generateUrl('gericht.bearbeiten'));
    }

     //Ein Gerichtbild anzeigen
     #[Route('/anzeigen/{id}', name: 'anzeigen')]
     public function anzeigen(Gericht $gericht){
 
      
 
        return $this->render('gericht/anzeigen.html.twig', [
            'gericht' => $gericht,
        ]);
     }
}
