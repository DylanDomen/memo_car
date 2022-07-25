import 'package:equatable/equatable.dart';
import 'package:memo_car/models/rappel_vehicule.dart';
import 'package:memo_car/models/utilisateur.dart';

class Vehicule extends Equatable {
  String? uid;
  String nom;
  String marque;
  String immatriculation;
  int km;
  String? notes;
  DateTime dateControleTechnique;
  DateTime dateRevision;
  DateTime dateDistribution;
  Utilisateur utilisateur;
  List<RappelVehicule> listRappel;

  Vehicule({
    this.uid,
    required this.nom,
    required this.marque,
    required this.immatriculation,
    required this.km,
    this.notes,
    required this.dateControleTechnique,
    required this.dateRevision,
    required this.dateDistribution,
    required this.utilisateur,
    required this.listRappel,
  });

  @override
  List<Object?> get props => [
        uid,
        nom,
        marque,
        immatriculation,
        km,
        notes,
        dateControleTechnique,
        dateRevision,
        dateDistribution,
        utilisateur,
        listRappel,
      ];
}
