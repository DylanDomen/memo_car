import 'package:memo_car/models/rappel_vehicule.dart';
import 'package:memo_car/models/utilisateur.dart';
import 'package:memo_car/models/vehicule.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class MockUtilisateur extends Mock implements Utilisateur {}

class MockRappelVehicule extends Mock implements RappelVehicule {}

void main() {
  late Utilisateur utilisateur;
  late RappelVehicule rappelVehicule;
  late Utilisateur utilisateur2;
  late RappelVehicule rappelVehicule2;
  late Vehicule vehicule;

  setUp(() {
    utilisateur = MockUtilisateur();
    rappelVehicule = MockRappelVehicule();
    utilisateur2 = MockUtilisateur();
    rappelVehicule2 = MockRappelVehicule();

    vehicule = Vehicule(
      uid: 'uid',
      nom: 'nom',
      marque: 'marque',
      immatriculation: 'immatriculation',
      km: 100000,
      photo: 'xxx',
      notes: 'notes',
      dateControleTechnique: DateTime(2022, 10, 24),
      dateRevision: DateTime(2022, 10, 24),
      dateDistribution: DateTime(2022, 10, 24),
      utilisateur: utilisateur,
      listRappel: [rappelVehicule],
    );
  });

  test('Comparaison entre 2 objets vehicules', () {
    expect(
      Vehicule(
        uid: 'uid',
        nom: 'nom',
        marque: 'marque',
        immatriculation: 'immatriculation',
        km: 100000,
        photo: 'xxx',
        notes: 'notes',
        dateControleTechnique: DateTime(2022, 10, 24),
        dateRevision: DateTime(2022, 10, 24),
        dateDistribution: DateTime(2022, 10, 24),
        utilisateur: utilisateur,
        listRappel: [rappelVehicule],
      ),
      Vehicule(
        uid: 'uid',
        nom: 'nom',
        marque: 'marque',
        immatriculation: 'immatriculation',
        km: 100000,
        photo: 'xxx',
        notes: 'notes',
        dateControleTechnique: DateTime(2022, 10, 24),
        dateRevision: DateTime(2022, 10, 24),
        dateDistribution: DateTime(2022, 10, 24),
        utilisateur: utilisateur,
        listRappel: [rappelVehicule],
      ),
    );
  });

  test("Instanciation d'un véhicule", () {
    expect(vehicule.uid, 'uid');
    expect(vehicule.nom, 'nom');
    expect(vehicule.marque, 'marque');
    expect(vehicule.immatriculation, 'immatriculation');
    expect(vehicule.km, 100000);
    expect(vehicule.photo, 'xxx');
    expect(vehicule.notes, 'notes');
    expect(vehicule.dateControleTechnique, DateTime(2022, 10, 24));
    expect(vehicule.dateRevision, DateTime(2022, 10, 24));
    expect(vehicule.dateDistribution, DateTime(2022, 10, 24));
    expect(vehicule.utilisateur, utilisateur);
    expect(vehicule.listRappel, [rappelVehicule]);
  });

  test('copyWith champ : uid', () {
    expect(
      vehicule.copyWith(uid: 'uidModif'),
      Vehicule(
        uid: 'uidModif',
        nom: 'nom',
        marque: 'marque',
        immatriculation: 'immatriculation',
        km: 100000,
        photo: 'xxx',
        notes: 'notes',
        dateControleTechnique: DateTime(2022, 10, 24),
        dateRevision: DateTime(2022, 10, 24),
        dateDistribution: DateTime(2022, 10, 24),
        utilisateur: utilisateur,
        listRappel: [rappelVehicule],
      ),
    );
  });

  test('copyWith champ : nom', () {
    expect(
      vehicule.copyWith(nom: 'nomModif'),
      Vehicule(
        uid: 'uid',
        nom: 'nomModif',
        marque: 'marque',
        immatriculation: 'immatriculation',
        km: 100000,
        photo: 'xxx',
        notes: 'notes',
        dateControleTechnique: DateTime(2022, 10, 24),
        dateRevision: DateTime(2022, 10, 24),
        dateDistribution: DateTime(2022, 10, 24),
        utilisateur: utilisateur,
        listRappel: [rappelVehicule],
      ),
    );
  });

  test('copyWith champ : marque', () {
    expect(
      vehicule.copyWith(marque: 'marqueModif'),
      Vehicule(
        uid: 'uid',
        nom: 'nom',
        marque: 'marqueModif',
        immatriculation: 'immatriculation',
        km: 100000,
        photo: 'xxx',
        notes: 'notes',
        dateControleTechnique: DateTime(2022, 10, 24),
        dateRevision: DateTime(2022, 10, 24),
        dateDistribution: DateTime(2022, 10, 24),
        utilisateur: utilisateur,
        listRappel: [rappelVehicule],
      ),
    );
  });

  test('copyWith champ : immatriculation', () {
    expect(
      vehicule.copyWith(immatriculation: 'immatriculationModif'),
      Vehicule(
        uid: 'uid',
        nom: 'nom',
        marque: 'marque',
        immatriculation: 'immatriculationModif',
        km: 100000,
        photo: 'xxx',
        notes: 'notes',
        dateControleTechnique: DateTime(2022, 10, 24),
        dateRevision: DateTime(2022, 10, 24),
        dateDistribution: DateTime(2022, 10, 24),
        utilisateur: utilisateur,
        listRappel: [rappelVehicule],
      ),
    );
  });

  test('copyWith champ : km', () {
    expect(
      vehicule.copyWith(km: 111111),
      Vehicule(
        uid: 'uid',
        nom: 'nom',
        marque: 'marque',
        immatriculation: 'immatriculation',
        km: 111111,
        photo: 'xxx',
        notes: 'notes',
        dateControleTechnique: DateTime(2022, 10, 24),
        dateRevision: DateTime(2022, 10, 24),
        dateDistribution: DateTime(2022, 10, 24),
        utilisateur: utilisateur,
        listRappel: [rappelVehicule],
      ),
    );
  });

  test('copyWith champ : photo', () {
    expect(
      vehicule.copyWith(photo: 'xxxModif'),
      Vehicule(
        uid: 'uid',
        nom: 'nom',
        marque: 'marque',
        immatriculation: 'immatriculation',
        km: 100000,
        photo: 'xxxModif',
        notes: 'notes',
        dateControleTechnique: DateTime(2022, 10, 24),
        dateRevision: DateTime(2022, 10, 24),
        dateDistribution: DateTime(2022, 10, 24),
        utilisateur: utilisateur,
        listRappel: [rappelVehicule],
      ),
    );
  });

  test('copyWith champ : notes', () {
    expect(
      vehicule.copyWith(notes: 'notesModif'),
      Vehicule(
        uid: 'uid',
        nom: 'nom',
        marque: 'marque',
        immatriculation: 'immatriculation',
        km: 100000,
        photo: 'xxx',
        notes: 'notesModif',
        dateControleTechnique: DateTime(2022, 10, 24),
        dateRevision: DateTime(2022, 10, 24),
        dateDistribution: DateTime(2022, 10, 24),
        utilisateur: utilisateur,
        listRappel: [rappelVehicule],
      ),
    );
  });

  test('copyWith champ : dateControleTechnique', () {
    expect(
      vehicule.copyWith(dateControleTechnique: DateTime(2022, 10, 26)),
      Vehicule(
        uid: 'uid',
        nom: 'nom',
        marque: 'marque',
        immatriculation: 'immatriculation',
        km: 100000,
        photo: 'xxx',
        notes: 'notes',
        dateControleTechnique: DateTime(2022, 10, 26),
        dateRevision: DateTime(2022, 10, 24),
        dateDistribution: DateTime(2022, 10, 24),
        utilisateur: utilisateur,
        listRappel: [rappelVehicule],
      ),
    );
  });

  test('copyWith champ : dateRevision', () {
    expect(
      vehicule.copyWith(dateRevision: DateTime(2022, 10, 26)),
      Vehicule(
        uid: 'uid',
        nom: 'nom',
        marque: 'marque',
        immatriculation: 'immatriculation',
        km: 100000,
        photo: 'xxx',
        notes: 'notes',
        dateControleTechnique: DateTime(2022, 10, 24),
        dateRevision: DateTime(2022, 10, 26),
        dateDistribution: DateTime(2022, 10, 24),
        utilisateur: utilisateur,
        listRappel: [rappelVehicule],
      ),
    );
  });

  test('copyWith champ : dateDistribution', () {
    expect(
      vehicule.copyWith(dateDistribution: DateTime(2022, 10, 26)),
      Vehicule(
        uid: 'uid',
        nom: 'nom',
        marque: 'marque',
        immatriculation: 'immatriculation',
        km: 100000,
        photo: 'xxx',
        notes: 'notes',
        dateControleTechnique: DateTime(2022, 10, 24),
        dateRevision: DateTime(2022, 10, 24),
        dateDistribution: DateTime(2022, 10, 26),
        utilisateur: utilisateur,
        listRappel: [rappelVehicule],
      ),
    );
  });

  test('copyWith champ : utilisateur', () {
    expect(
      vehicule.copyWith(utilisateur: utilisateur2),
      Vehicule(
        uid: 'uid',
        nom: 'nom',
        marque: 'marque',
        immatriculation: 'immatriculation',
        km: 100000,
        photo: 'xxx',
        notes: 'notes',
        dateControleTechnique: DateTime(2022, 10, 24),
        dateRevision: DateTime(2022, 10, 24),
        dateDistribution: DateTime(2022, 10, 24),
        utilisateur: utilisateur2,
        listRappel: [rappelVehicule],
      ),
    );
  });

  test('copyWith champ : listRappel', () {
    expect(
      vehicule.copyWith(listRappel: [rappelVehicule2]),
      Vehicule(
        uid: 'uid',
        nom: 'nom',
        marque: 'marque',
        immatriculation: 'immatriculation',
        km: 100000,
        photo: 'xxx',
        notes: 'notes',
        dateControleTechnique: DateTime(2022, 10, 24),
        dateRevision: DateTime(2022, 10, 24),
        dateDistribution: DateTime(2022, 10, 24),
        utilisateur: utilisateur,
        listRappel: [rappelVehicule2],
      ),
    );
  });

  test('copyWith avec tout les champs', () {
    expect(
      vehicule.copyWith(
        uid: 'uidModif',
        nom: 'nomModif',
        marque: 'marqueModif',
        immatriculation: 'immatriculationModif',
        km: 20000,
        photo: 'xxxModif',
        notes: 'notesModif',
        dateControleTechnique: DateTime(2022, 10, 25),
        dateRevision: DateTime(2022, 10, 25),
        dateDistribution: DateTime(2022, 10, 25),
        utilisateur: utilisateur2,
        listRappel: [rappelVehicule2],
      ),
      Vehicule(
        uid: 'uidModif',
        nom: 'nomModif',
        marque: 'marqueModif',
        immatriculation: 'immatriculationModif',
        km: 20000,
        photo: 'xxxModif',
        notes: 'notesModif',
        dateControleTechnique: DateTime(2022, 10, 25),
        dateRevision: DateTime(2022, 10, 25),
        dateDistribution: DateTime(2022, 10, 25),
        utilisateur: utilisateur2,
        listRappel: [rappelVehicule2],
      ),
    );
  });
}
