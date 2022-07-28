import 'package:memo_car/models/memo.dart';
import 'package:memo_car/models/utilisateur.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class MockUtilisateur extends Mock implements Utilisateur {}

void main() {
  late Utilisateur utilisateur;
  late Utilisateur utilisateur2;
  late Memo memo;

  setUp(() {
    utilisateur = MockUtilisateur();
    utilisateur2 = MockUtilisateur();

    memo = Memo(
      uid: 'uid',
      nom: 'nom',
      notes: 'notes',
      photos: const ['XXX'],
      utilisateur: utilisateur,
    );
  });

  test('Comparaison entre 2 objets mémo', () {
    expect(
      Memo(
        uid: 'uid',
        nom: 'nom',
        notes: 'notes',
        photos: const ['XXX'],
        utilisateur: utilisateur,
      ),
      Memo(
        uid: 'uid',
        nom: 'nom',
        notes: 'notes',
        photos: const ['XXX'],
        utilisateur: utilisateur,
      ),
    );
  });

  test("Instanciation d'un mémo", () {
    expect(memo.uid, 'uid');
    expect(memo.nom, 'nom');
    expect(memo.notes, 'notes');
    expect(memo.photos, ['XXX']);
    expect(memo.utilisateur, utilisateur);
  });

  test('copyWith champ : uid', () {
    expect(
      memo.copyWith(uid: 'uidModif'),
      Memo(
        uid: 'uidModif',
        nom: 'nom',
        notes: 'notes',
        photos: const ['XXX'],
        utilisateur: utilisateur,
      ),
    );
  });

  test('copyWith champ : nom', () {
    expect(
      memo.copyWith(nom: 'nomModif'),
      Memo(
        uid: 'uid',
        nom: 'nomModif',
        notes: 'notes',
        photos: const ['XXX'],
        utilisateur: utilisateur,
      ),
    );
  });

  test('copyWith champ : notes', () {
    expect(
      memo.copyWith(notes: 'notesModif'),
      Memo(
        uid: 'uid',
        nom: 'nom',
        notes: 'notesModif',
        photos: const ['XXX'],
        utilisateur: utilisateur,
      ),
    );
  });

  test('copyWith champ : photos', () {
    expect(
      memo.copyWith(photos: ['XXXModif']),
      Memo(
        uid: 'uid',
        nom: 'nom',
        notes: 'notes',
        photos: const ['XXXModif'],
        utilisateur: utilisateur,
      ),
    );
  });

  test('copyWith champ : utilisateur', () {
    expect(
      memo.copyWith(utilisateur: utilisateur2),
      Memo(
        uid: 'uid',
        nom: 'nom',
        notes: 'notes',
        photos: const ['XXX'],
        utilisateur: utilisateur2,
      ),
    );
  });

  test('copyWith avec tout les champs', () {
    expect(
      memo.copyWith(
        uid: 'uidModif',
        nom: 'nomModif',
        notes: 'notesModif',
        photos: ['XXXModif'],
        utilisateur: utilisateur2,
      ),
      Memo(
        uid: 'uidModif',
        nom: 'nomModif',
        notes: 'notesModif',
        photos: const ['XXXModif'],
        utilisateur: utilisateur2,
      ),
    );
  });
}
