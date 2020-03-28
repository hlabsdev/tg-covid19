import 'package:flutter/material.dart';

class Guide {
  final String imageUrl;
  final String title;
  final String description;

  Guide({
    @required this.imageUrl,
    @required this.title,
    @required this.description,
  });
}

/*=========================================*/
final propagationList = [
  Guide(
    imageUrl: 'assets/images/Guide/tansmission.png',
    title: 'Personnes',
    description:
        "Beaucoup de personnes atteintes présentent des symptômes discrets aux premiers stades de la maladie (par exemple, une toux légère). Il est alors possible de contracter la COVID-19 au contact de ces personnes, même si elles ne se sentent pas malades.",
  ),
  Guide(
    imageUrl: 'assets/images/Guide/prevention2.png',
    title: 'Gouttelettes respiratoires',
    description:
        "La maladie peut se transmettre d’une personne à l’autre principalement par des gouttelettes respiratoires expulsées par le nez ou par la bouche lorsqu’une personne tousse ou éternue. Il est donc possible de contracter la COVID-19 en respirant des gouttelettes d’une personne malade qui vient de tousser ou d’éternuer. C’est pourquoi il est important de se tenir à plus d’un mètre d’une personne malade.",
  ),
  Guide(
    imageUrl: 'assets/images/Guide/prevention.png',
    title: 'Gouttelettes respiratoires',
    description:
        "Ces gouttelettes peuvent se retrouver sur des objets ou des surfaces autour de la personne en question. On peut alors contracter la COVID-19 si on touche ces objets ou ces surfaces et si on se touche ensuite les yeux, le nez ou la bouche.",
  ),
];
/*=========================================*/
final prevList = [
  Guide(
    imageUrl: 'assets/images/Guide/lavemain.jpg',
    title: 'Suivez les regles!!',
    description:
        "Pour eradiquer cette menace, nous devons suivre scrupuleusement les teglesles regl.",
  ),
  Guide(
    imageUrl: 'assets/images/Guide/lavemain.jpg',
    title: 'Lavage des mains',
    description:
        "Lavez-vous les mains avec du savon, ou désinfectez-les avec du gel hydroalcoolique.",
  ),
  Guide(
    imageUrl: 'assets/images/Guide/prev4.jpg',
    title: 'Lavage des mains',
    description:
        "Apres lavage rincer correctement les mains avec de l'eau propre.",
  ),
  Guide(
    imageUrl: 'assets/images/Guide/prev1.jpg',
    title: 'Les gestes sains',
    description:
        "Toussez ou éternuez dans un mouchoir ou dans le pli de votre coude. Ne pas se toucher les yeux, le nez ou la bouche.",
  ),
  Guide(
    imageUrl: 'assets/images/distance.png',
    title: 'Distanciation sociale',
    description:
    "Saluez sans se serrer les mains, évitez les embrassades. Restez à une distance d’au moins 1 mètre des autres.",
  ),
];
/*=========================================*/
final symptList = [
  Guide(
    imageUrl: 'assets/images/Guide/sympt1.jpg',
    title: 'Les Principaux symptômes',
    description:
        "Fièvre; Toux; Gorge irritée; Peuvent s'ajouter les symptomes suivants: Fatigue –  Nez bouché – Douleurs – Diarrhée – Respiration très difficile – Perte de l’odorat et du goût",
  ),
  Guide(
    imageUrl: 'assets/images/Guide/sympt2.jpg',
    title:
        'TOUTE PERSONNE QUI A DE LA FIÈVRE, QUI TOUSSE ET QUI A DES DIFFICULTÉS À RESPIRER DOIT APPELER LE 111  ',
    description:
        "Ces symptômes sont généralement peu graves et apparaissent de manière progressive. Certaines personnes peuvent être infectées sans symptôme et se sentent bien. Environ 80 % des personnes guérissent sans avoir besoin de traitement particulier. Environ 1 personne sur 6 contractant la maladie présente des symptômes plus graves, comme une sensation de manque d’air ou un essoufflement anormal. Les personnes âgées et celles qui ont d’autres problèmes de santé (hypertension artérielle, problèmes cardiaques ou diabète) ont plus de risques de présenter des symptômes graves.",
  ),
];
/*=========================================*/
// ignore: non_constant_identifier_names
final que_faireList = [
  Guide(
    imageUrl: 'assets/images/Guide/quefaire2.jpg',
    title: 'Appelez le 111',
    description: "Appellez le 111 sans hesitez, pour une assistance rapide et efficace.",
  ),
  Guide(
    imageUrl: 'assets/images/Guide/quefaire1.jpg',
    title: 'Protegez les autres en vous isolant',
    description:
        "Se mettre en quarantaine, Couvrez-vous la bouche et le nez avec un papier mouchoir quand vous toussez ou eternuez, ensuite le jetter a la poubelle. Lavez-vous les main et portez un masque chirurgical. Evitez les contacts etroits avec autrui. Netoyer et desinfectez les objets et les surfaces.",
  ),
];
