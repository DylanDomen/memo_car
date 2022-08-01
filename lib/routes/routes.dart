import 'package:flutter/material.dart';
import 'package:memo_car/app/app_bloc.dart';
import 'package:memo_car/vues/connexion/connexion_page.dart';
import 'package:memo_car/vues/inscription/inscription_page.dart';
import 'package:memo_car/vues/vehicule/vehicule_page.dart';

// ignore: strict_raw_type
List<Page> onGenerateAppViewPages({
  required AppState app,
  List<Page<dynamic>>? pages,
}) {
  return [
    ConnexionPage.page(),
    if (app.step == AppStep.inscription) InscriptionPage.page(),
    if (app.step == AppStep.vehicule) VehiculePage.page(),
  ];
}
