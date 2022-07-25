import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:memo_car/models/utilisateur.dart';

class RendezVous extends Equatable {
  String? uid;
  String nom;
  String lieu;
  String? notes;
  DateTime date;
  TimeOfDay heure;
  DateTime? dateRappel;
  Utilisateur utilisateur;

  RendezVous({
    this.uid,
    required this.nom,
    required this.lieu,
    this.notes,
    required this.date,
    required this.heure,
    this.dateRappel,
    required this.utilisateur,
  });

  RendezVous copyWith({
    String? uid,
    String? nom,
    String? lieu,
    String? notes,
    DateTime? date,
    TimeOfDay? heure,
    DateTime? dateRappel,
    Utilisateur? utilisateur,
  }) {
    return RendezVous(
      uid: uid ?? this.uid,
      nom: nom ?? this.nom,
      lieu: lieu ?? this.lieu,
      notes: notes ?? this.notes,
      date: date ?? this.date,
      heure: heure ?? this.heure,
      dateRappel: dateRappel ?? this.dateRappel,
      utilisateur: utilisateur ?? this.utilisateur,
    );
  }

  @override
  List<Object?> get props => [
        uid,
        nom,
        lieu,
        notes,
        date,
        heure,
        dateRappel,
        utilisateur,
      ];
}
