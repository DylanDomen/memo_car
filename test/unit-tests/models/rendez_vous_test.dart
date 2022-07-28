import 'package:flutter/material.dart';
import 'package:memo_car/models/rendez_vous.dart';
import 'package:memo_car/models/utilisateur.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class MockUtilisateur extends Mock implements Utilisateur {}

void main() {
  late Utilisateur utilisateur;
  late Utilisateur utilisateur2;
  late RendezVous rendezVous;

  setUp(() {
    utilisateur = MockUtilisateur();
    utilisateur2 = MockUtilisateur();
    rendezVous = RendezVous(
      uid: 'uid',
      nom: 'nom',
      lieu: 'lieu',
      notes: 'notes',
      date: DateTime(2022, 10, 25),
      heure: const TimeOfDay(hour: 10, minute: 0),
      dateRappel: DateTime(2022, 10, 24),
      utilisateur: utilisateur,
    );
  });

  test('Comparaison entre 2 objets rendez-vous', () {
    expect(
      RendezVous(
        uid: 'uid',
        nom: 'nom',
        lieu: 'lieu',
        notes: 'notes',
        date: DateTime(2022, 10, 25),
        heure: const TimeOfDay(hour: 10, minute: 0),
        dateRappel: DateTime(2022, 10, 24),
        utilisateur: utilisateur,
      ),
      RendezVous(
        uid: 'uid',
        nom: 'nom',
        lieu: 'lieu',
        notes: 'notes',
        date: DateTime(2022, 10, 25),
        heure: const TimeOfDay(hour: 10, minute: 0),
        dateRappel: DateTime(2022, 10, 24),
        utilisateur: utilisateur,
      ),
    );
  });

  test("Instanciation d'un rendez-vous", () {
    expect(rendezVous.uid, 'uid');
    expect(rendezVous.nom, 'nom');
    expect(rendezVous.lieu, 'lieu');
    expect(rendezVous.notes, 'notes');
    expect(rendezVous.date, DateTime(2022, 10, 25));
    expect(rendezVous.heure, const TimeOfDay(hour: 10, minute: 0));
    expect(rendezVous.dateRappel, DateTime(2022, 10, 24));
    expect(rendezVous.utilisateur, utilisateur);
  });

  test('copyWith champ : uid', () {
    expect(
      rendezVous.copyWith(uid: 'uidModif'),
      RendezVous(
        uid: 'uidModif',
        nom: 'nom',
        lieu: 'lieu',
        notes: 'notes',
        date: DateTime(2022, 10, 25),
        heure: const TimeOfDay(hour: 10, minute: 0),
        dateRappel: DateTime(2022, 10, 24),
        utilisateur: utilisateur,
      ),
    );
  });

  test('copyWith champ : nom', () {
    expect(
      rendezVous.copyWith(nom: 'nomModif'),
      RendezVous(
        uid: 'uid',
        nom: 'nomModif',
        lieu: 'lieu',
        notes: 'notes',
        date: DateTime(2022, 10, 25),
        heure: const TimeOfDay(hour: 10, minute: 0),
        dateRappel: DateTime(2022, 10, 24),
        utilisateur: utilisateur,
      ),
    );
  });

  test('copyWith champ : lieu', () {
    expect(
      rendezVous.copyWith(lieu: 'lieuModif'),
      RendezVous(
        uid: 'uid',
        nom: 'nom',
        lieu: 'lieuModif',
        notes: 'notes',
        date: DateTime(2022, 10, 25),
        heure: const TimeOfDay(hour: 10, minute: 0),
        dateRappel: DateTime(2022, 10, 24),
        utilisateur: utilisateur,
      ),
    );
  });

  test('copyWith champ : notes', () {
    expect(
      rendezVous.copyWith(notes: 'notesModif'),
      RendezVous(
        uid: 'uid',
        nom: 'nom',
        lieu: 'lieu',
        notes: 'notesModif',
        date: DateTime(2022, 10, 25),
        heure: const TimeOfDay(hour: 10, minute: 0),
        dateRappel: DateTime(2022, 10, 24),
        utilisateur: utilisateur,
      ),
    );
  });

  test('copyWith champ : date', () {
    expect(
      rendezVous.copyWith(date: DateTime(2022, 09, 26)),
      RendezVous(
        uid: 'uid',
        nom: 'nom',
        lieu: 'lieu',
        notes: 'notes',
        date: DateTime(2022, 09, 26),
        heure: const TimeOfDay(hour: 10, minute: 0),
        dateRappel: DateTime(2022, 10, 24),
        utilisateur: utilisateur,
      ),
    );
  });

  test('copyWith champ : heure', () {
    expect(
      rendezVous.copyWith(
        heure: const TimeOfDay(hour: 12, minute: 0),
      ),
      RendezVous(
        uid: 'uid',
        nom: 'nom',
        lieu: 'lieu',
        notes: 'notes',
        date: DateTime(2022, 10, 25),
        heure: const TimeOfDay(hour: 12, minute: 0),
        dateRappel: DateTime(2022, 10, 24),
        utilisateur: utilisateur,
      ),
    );
  });

  test('copyWith champ : dateRappel', () {
    expect(
      rendezVous.copyWith(
        dateRappel: DateTime(2022, 09, 25),
      ),
      RendezVous(
        uid: 'uid',
        nom: 'nom',
        lieu: 'lieu',
        notes: 'notes',
        date: DateTime(2022, 10, 25),
        heure: const TimeOfDay(hour: 10, minute: 0),
        dateRappel: DateTime(2022, 09, 25),
        utilisateur: utilisateur,
      ),
    );
  });

  test('copyWith champ : utilisateur', () {
    expect(
      rendezVous.copyWith(utilisateur: utilisateur2),
      RendezVous(
        uid: 'uid',
        nom: 'nom',
        lieu: 'lieu',
        notes: 'notes',
        date: DateTime(2022, 10, 25),
        heure: const TimeOfDay(hour: 10, minute: 0),
        dateRappel: DateTime(2022, 10, 24),
        utilisateur: utilisateur2,
      ),
    );
  });

  test('copyWith avec tout les champs', () {
    expect(
      rendezVous.copyWith(
        uid: 'uidModif',
        nom: 'nomModif',
        lieu: 'lieuModif',
        notes: 'notesModif',
        date: DateTime(2022, 09, 26),
        heure: const TimeOfDay(hour: 12, minute: 0),
        dateRappel: DateTime(2022, 10, 25),
        utilisateur: utilisateur2,
      ),
      RendezVous(
        uid: 'uidModif',
        nom: 'nomModif',
        lieu: 'lieuModif',
        notes: 'notesModif',
        date: DateTime(2022, 09, 26),
        heure: const TimeOfDay(hour: 12, minute: 0),
        dateRappel: DateTime(2022, 10, 25),
        utilisateur: utilisateur2,
      ),
    );
  });
}
