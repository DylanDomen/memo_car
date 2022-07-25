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
        photos: [],
        utilisateur: utilisateur,
      ),
      Memo(
        uid: 'uid',
        nom: 'nom',
        notes: 'notes',
        photos: [],
        utilisateur: utilisateur,
      ),
    );
  });

  test("Instanciation d'un mémo", () {
    Memo memo = Memo(
      uid: 'uid',
      nom: 'nom',
      notes: 'notes',
      photos: [],
      utilisateur: utilisateur,
    );

    expect(memo.uid, 'uid');
    expect(memo.nom, 'nom');
    expect(memo.notes, 'notes');
    expect(memo.photos, []);
    expect(memo.utilisateur, utilisateur);
  });

  test('copyWith', () {
    Memo memo = Memo(
      uid: 'uid',
      nom: 'nom',
      notes: 'notes',
      photos: [],
      utilisateur: utilisateur,
    );

    Utilisateur utilisateur2 = MockUtilisateur();

    Memo memoCopy = memo.copyWith(
      uid: 'uidModif',
      nom: 'nomModif',
      notes: 'notesModif',
      photos: ["modif"],
      utilisateur: utilisateur2,
    );

    expect(memoCopy.uid, 'uidModif');
    expect(memoCopy.nom, 'nomModif');
    expect(memoCopy.notes, 'notesModif');
    expect(memoCopy.photos, ["modif"]);
    expect(memoCopy.utilisateur, utilisateur2);
  });
}
