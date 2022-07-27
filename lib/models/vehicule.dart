import 'package:equatable/equatable.dart';
import 'package:memo_car/models/rappel_vehicule.dart';
import 'package:memo_car/models/utilisateur.dart';

// ignore: must_be_immutable
class Vehicule extends Equatable {
  final String? uid;
  final String nom;
  final String marque;
  final String immatriculation;
  final int km;
  final String? photo;
  final String? notes;
  final DateTime dateControleTechnique;
  final DateTime dateRevision;
  final DateTime dateDistribution;
  final Utilisateur utilisateur;
  final List<RappelVehicule> listRappel;

  const Vehicule({
    this.uid,
    required this.nom,
    required this.marque,
    required this.immatriculation,
    required this.km,
    this.photo,
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
    String? photo,
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
      photo: photo ?? this.photo,
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
        photo,
        notes,
        dateControleTechnique,
        dateRevision,
        dateDistribution,
        utilisateur,
        listRappel,
      ];
}
