import 'package:flutter/material.dart';
import 'package:memo_car/models/rendez_vous.dart';
import 'package:memo_car/models/utilisateur.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class MockUtilisateur extends Mock implements Utilisateur {}

void main() {
  late Utilisateur utilisateur;

  setUp(() {
    utilisateur = MockUtilisateur();
  });

  test('Comparaison entre 2 objets rendez-vous', () {
    expect(
      RendezVous(
        uid: 'uid',
        nom: 'nom',
        lieu: 'lieu',
        notes: 'notes',
        date: DateTime(2022, 10, 25),
        heure: TimeOfDay(hour: 10, minute: 0),
        dateRappel: DateTime(2022, 10, 24),
        utilisateur: utilisateur,
      ),
      RendezVous(
        uid: 'uid',
        nom: 'nom',
        lieu: 'lieu',
        notes: 'notes',
        date: DateTime(2022, 10, 25),
        heure: TimeOfDay(hour: 10, minute: 0),
        dateRappel: DateTime(2022, 10, 24),
        utilisateur: utilisateur,
      ),
    );
  });

  test("Instanciation d'un rendez-vous", () {
    RendezVous rendezVous = RendezVous(
      uid: 'uid',
      nom: 'nom',
      lieu: 'lieu',
      notes: 'notes',
      date: DateTime(2022, 10, 25),
      heure: TimeOfDay(hour: 10, minute: 0),
      dateRappel: DateTime(2022, 10, 24),
      utilisateur: utilisateur,
    );

    expect(rendezVous.uid, 'uid');
    expect(rendezVous.nom, 'nom');
    expect(rendezVous.lieu, 'lieu');
    expect(rendezVous.notes, 'notes');
    expect(rendezVous.date, DateTime(2022, 10, 25));
    expect(rendezVous.heure, TimeOfDay(hour: 10, minute: 0));
    expect(rendezVous.dateRappel, DateTime(2022, 10, 24));
    expect(rendezVous.utilisateur, utilisateur);
  });

  test('copyWith', () {
    RendezVous rendezVous = RendezVous(
      uid: 'uid',
      nom: 'nom',
      lieu: 'lieu',
      notes: 'notes',
      date: DateTime(2022, 10, 25),
      heure: TimeOfDay(hour: 10, minute: 0),
      dateRappel: DateTime(2022, 10, 24),
      utilisateur: utilisateur,
    );

    Utilisateur utilisateur2 = MockUtilisateur();

    RendezVous rendezVousCopy = rendezVous.copyWith(
      uid: 'uidmodif',
      nom: 'nommodif',
      lieu: 'lieumodif',
      notes: 'notesmodif',
      date: DateTime(2022, 10, 26),
      heure: TimeOfDay(hour: 12, minute: 0),
      dateRappel: DateTime(2022, 10, 25),
      utilisateur: utilisateur2,
    );

    expect(rendezVousCopy.uid, 'uidmodif');
    expect(rendezVousCopy.nom, 'nommodif');
    expect(rendezVousCopy.lieu, 'lieumodif');
    expect(rendezVousCopy.notes, 'notesmodif');
    expect(rendezVousCopy.date, DateTime(2022, 10, 26));
    expect(rendezVousCopy.heure, TimeOfDay(hour: 12, minute: 0));
    expect(rendezVousCopy.dateRappel, DateTime(2022, 10, 25));
    expect(rendezVousCopy.utilisateur, utilisateur2);
  });
}
