import 'package:equatable/equatable.dart';
import 'package:memo_car/models/rappel_vehicule.dart';
import 'package:memo_car/models/utilisateur.dart';

// ignore: must_be_immutable
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

  Vehicule copyWith({
    String? uid,
    String? nom,
    String? marque,
    String? immatriculation,
    int? km,
    String? notes,
    DateTime? dateControleTechnique,
    DateTime? dateRevision,
    DateTime? dateDistribution,
    Utilisateur? utilisateur,
    List<RappelVehicule>? listRappel,
  }) {
    return Vehicule(
      uid: uid ?? this.uid,
      nom: nom ?? this.nom,
      marque: marque ?? this.marque,
      immatriculation: immatriculation ?? this.immatriculation,
      km: km ?? this.km,
      notes: notes ?? this.notes,
      dateControleTechnique:
          dateControleTechnique ?? this.dateControleTechnique,
      dateRevision: dateRevision ?? this.dateRevision,
      dateDistribution: dateDistribution ?? this.dateDistribution,
      utilisateur: utilisateur ?? this.utilisateur,
      listRappel: listRappel ?? this.listRappel,
    );
  }

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
