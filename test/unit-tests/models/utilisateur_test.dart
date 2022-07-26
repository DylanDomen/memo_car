import 'package:memo_car/models/memo.dart';
import 'package:memo_car/models/rendez_vous.dart';
import 'package:memo_car/models/utilisateur.dart';
import 'package:memo_car/models/vehicule.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class MockVehicule extends Mock implements Vehicule {}

class MockMemo extends Mock implements Memo {}

class MockRendezVous extends Mock implements RendezVous {}

void main() {
  late Vehicule vehicule;
  late Memo memo;
  late RendezVous rendezVous;

  setUp(() {
    vehicule = MockVehicule();
    memo = MockMemo();
    rendezVous = MockRendezVous();
  });

  test('Comparaison entre 2 objets utilisateurs', () {
    expect(
      Utilisateur(
        uid: 'uid',
        email: 'email',
        motDePasse: 'motDePasse',
        listVehicule: [vehicule],
        listMemo: [memo],
        listRendezVous: [rendezVous],
      ),
      Utilisateur(
        uid: 'uid',
        email: 'email',
        motDePasse: 'motDePasse',
        listVehicule: [vehicule],
        listMemo: [memo],
        listRendezVous: [rendezVous],
      ),
    );
  });

  test("Instanciation d'un utilisateur", () {
    final utilisateur = Utilisateur(
      uid: 'uid',
      email: 'email',
      motDePasse: 'motDePasse',
      listVehicule: [vehicule],
      listMemo: [memo],
      listRendezVous: [rendezVous],
    );

    expect(utilisateur.uid, 'uid');
    expect(utilisateur.email, 'email');
    expect(utilisateur.motDePasse, 'motDePasse');
    expect(utilisateur.listVehicule, [vehicule]);
    expect(utilisateur.listMemo, [memo]);
    expect(utilisateur.listRendezVous, [rendezVous]);
  });

  test('copyWith', () {
    final utilisateur = Utilisateur(
      uid: 'uid',
      email: 'email',
      motDePasse: 'motDePasse',
      listVehicule: [vehicule],
      listMemo: [memo],
      listRendezVous: [rendezVous],
    );

    final vehicule2 = MockVehicule();
    final memo2 = MockMemo();
    final rendezVous2 = MockRendezVous();

    final utilisateurCopy = utilisateur.copyWith(
      uid: 'uidmodif',
      email: 'emailmodif',
      motDePasse: 'motDePassemodif',
      listVehicule: [vehicule2],
      listMemo: [memo2],
      listRendezVous: [rendezVous2],
    );

    expect(utilisateurCopy.uid, 'uidmodif');
    expect(utilisateurCopy.email, 'emailmodif');
    expect(utilisateurCopy.motDePasse, 'motDePassemodif');
    expect(utilisateurCopy.listVehicule, [vehicule2]);
    expect(utilisateurCopy.listMemo, [memo2]);
    expect(utilisateurCopy.listRendezVous, [rendezVous2]);
  });
}
