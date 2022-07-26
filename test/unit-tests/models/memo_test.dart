import 'package:memo_car/models/memo.dart';
import 'package:memo_car/models/utilisateur.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class MockUtilisateur extends Mock implements Utilisateur {}

void main() {
  late Utilisateur utilisateur;

  setUp(() {
    utilisateur = MockUtilisateur();
  });

  test('Comparaison entre 2 objets mémo', () {
    expect(
      Memo(
        uid: 'uid',
        nom: 'nom',
        notes: 'notes',
        photos: ['XXX'],
        utilisateur: utilisateur,
      ),
      Memo(
        uid: 'uid',
        nom: 'nom',
        notes: 'notes',
        photos: ['XXX'],
        utilisateur: utilisateur,
      ),
    );
  });

  test("Instanciation d'un mémo", () {
    final memo = Memo(
      uid: 'uid',
      nom: 'nom',
      notes: 'notes',
      photos: const ['XXX'],
      utilisateur: utilisateur,
    );

    expect(memo.uid, 'uid');
    expect(memo.nom, 'nom');
    expect(memo.notes, 'notes');
    expect(memo.photos, ['XXX']);
    expect(memo.utilisateur, utilisateur);
  });

  test('copyWith', () {
    final memo = Memo(
      uid: 'uid',
      nom: 'nom',
      notes: 'notes',
      photos: const [],
      utilisateur: utilisateur,
    );

    final utilisateur2 = MockUtilisateur();

    final memoCopy = memo.copyWith(
      uid: 'uidModif',
      nom: 'nomModif',
      notes: 'notesModif',
      photos: ['modif'],
      utilisateur: utilisateur2,
    );

    expect(memoCopy.uid, 'uidModif');
    expect(memoCopy.nom, 'nomModif');
    expect(memoCopy.notes, 'notesModif');
    expect(memoCopy.photos, ['modif']);
    expect(memoCopy.utilisateur, utilisateur2);
  });
}
