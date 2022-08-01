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
  late Vehicule vehicule2;
  late Memo memo2;
  late RendezVous rendezVous2;
  late Utilisateur utilisateur;

  setUp(() {
    vehicule = MockVehicule();
    memo = MockMemo();
    rendezVous = MockRendezVous();
    vehicule2 = MockVehicule();
    memo2 = MockMemo();
    rendezVous2 = MockRendezVous();

    utilisateur = Utilisateur(
      uid: 'uid',
      email: 'email',
      listVehicule: [vehicule],
      listMemo: [memo],
      listRendezVous: [rendezVous],
    );
  });

  test('Comparaison entre 2 objets utilisateurs', () {
    expect(
      Utilisateur(
        uid: 'uid',
        email: 'email',
        listVehicule: [vehicule],
        listMemo: [memo],
        listRendezVous: [rendezVous],
      ),
      Utilisateur(
        uid: 'uid',
        email: 'email',
        listVehicule: [vehicule],
        listMemo: [memo],
        listRendezVous: [rendezVous],
      ),
    );
  });

  test("Instanciation d'un utilisateur", () {
    expect(utilisateur.uid, 'uid');
    expect(utilisateur.email, 'email');
    expect(utilisateur.listVehicule, [vehicule]);
    expect(utilisateur.listMemo, [memo]);
    expect(utilisateur.listRendezVous, [rendezVous]);
  });

  test('copyWith champ : uid', () {
    expect(
      utilisateur.copyWith(uid: 'uidModif'),
      Utilisateur(
        uid: 'uidModif',
        email: 'email',
        listVehicule: [vehicule],
        listMemo: [memo],
        listRendezVous: [rendezVous],
      ),
    );
  });

  test('copyWith champ : email', () {
    expect(
      utilisateur.copyWith(email: 'emailModif'),
      Utilisateur(
        uid: 'uid',
        email: 'emailModif',
        listVehicule: [vehicule],
        listMemo: [memo],
        listRendezVous: [rendezVous],
      ),
    );
  });

  test('copyWith champ : motDePasse', () {
    expect(
      utilisateur.copyWith(motDePasse: 'motDePasseModif'),
      Utilisateur(
        uid: 'uid',
        email: 'email',
        listVehicule: [vehicule],
        listMemo: [memo],
        listRendezVous: [rendezVous],
      ),
    );
  });

  test('copyWith champ : listVehicule', () {
    expect(
      utilisateur.copyWith(listVehicule: [vehicule2]),
      Utilisateur(
        uid: 'uid',
        email: 'email',
        listVehicule: [vehicule2],
        listMemo: [memo],
        listRendezVous: [rendezVous],
      ),
    );
  });

  test('copyWith champ : listMemo', () {
    expect(
      utilisateur.copyWith(listMemo: [memo2]),
      Utilisateur(
        uid: 'uid',
        email: 'email',
        listVehicule: [vehicule],
        listMemo: [memo2],
        listRendezVous: [rendezVous],
      ),
    );
  });

  test('copyWith champ : listRendezVous', () {
    expect(
      utilisateur.copyWith(listRendezVous: [rendezVous2]),
      Utilisateur(
        uid: 'uid',
        email: 'email',
        listVehicule: [vehicule],
        listMemo: [memo],
        listRendezVous: [rendezVous2],
      ),
    );
  });

  test('copyWith avec tout les champs', () {
    expect(
      utilisateur.copyWith(
        uid: 'uidModif',
        email: 'emailModif',
        listVehicule: [vehicule2],
        listMemo: [memo2],
        listRendezVous: [rendezVous2],
      ),
      Utilisateur(
        uid: 'uidModif',
        email: 'emailModif',
        listVehicule: [vehicule2],
        listMemo: [memo2],
        listRendezVous: [rendezVous2],
      ),
    );
  });
}
