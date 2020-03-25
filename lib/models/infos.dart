import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class Infos {
  final String imageUrl;
  final String title;
  final String description;

  Infos({
    @required this.imageUrl,
    @required this.title,
    @required this.description,
  });
}

final InfosList = [
  Infos(
    imageUrl: 'assets/images/transmision.png',
    title: 'Propagation',
    description:
        "On peut etre contaminé en serrant les mains, en se touchant physiquement",
  ),
  Infos(
    imageUrl: 'assets/images/prevention2.png',
    title: 'Prevention',
    description:
        "Lavez-vous très régulièrement les mains avec de l’eau et du savon, ou désinfectez-les avec du gel hydroalcoolique plusieurs fois par jour",
  ),
  Infos(
    imageUrl: 'assets/images/toussez.png',
    title: 'Toussez dans votre coude',
    description:
        "Toussez ou éternuez dans un mouchoir ou dans le pli de votre coude, vous evite d'exposer votre entourage au virus!!",
  ),
  Infos(
    imageUrl: 'assets/images/serrez.png',
    title: 'Ne vous serrez pas la main',
    description: "Saluez sans se serrer les mains, évitez les embrassades.",
  ),
  Infos(
    imageUrl: 'assets/images/distance.png',
    title: 'Une distance de 1M entre vous',
    description: "La santé est le plus important!!.",
  ),
];
