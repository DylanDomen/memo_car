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

  setUp(() {
    utilisateur = MockUtilisateur();
    rappelVehicule = MockRappelVehicule();
  });

  test('Comparaison entre 2 objets vehicules', () {
    expect(
      Vehicule(
        uid: 'uid',
        nom: 'nom',
        marque: 'marque',
        immatriculation: 'immatriculation',
        km: 100000,
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
    final vehicule = Vehicule(
      uid: 'uid',
      nom: 'nom',
      marque: 'marque',
      immatriculation: 'immatriculation',
      km: 100000,
      notes: 'notes',
      dateControleTechnique: DateTime(2022, 10, 24),
      dateRevision: DateTime(2022, 10, 24),
      dateDistribution: DateTime(2022, 10, 24),
      utilisateur: utilisateur,
      listRappel: [rappelVehicule],
    );

    expect(vehicule.uid, 'uid');
    expect(vehicule.nom, 'nom');
    expect(vehicule.marque, 'marque');
    expect(vehicule.immatriculation, 'immatriculation');
    expect(vehicule.km, 100000);
    expect(vehicule.notes, 'notes');
    expect(vehicule.dateControleTechnique, DateTime(2022, 10, 24));
    expect(vehicule.dateRevision, DateTime(2022, 10, 24));
    expect(vehicule.dateDistribution, DateTime(2022, 10, 24));
    expect(vehicule.utilisateur, utilisateur);
    expect(vehicule.listRappel, [rappelVehicule]);
  });

  test('copyWith', () {
    final vehicule = Vehicule(
      uid: 'uid',
      nom: 'nom',
      marque: 'marque',
      immatriculation: 'immatriculation',
      km: 100000,
      notes: 'notes',
      dateControleTechnique: DateTime(2022, 10, 24),
      dateRevision: DateTime(2022, 10, 24),
      dateDistribution: DateTime(2022, 10, 24),
      utilisateur: utilisateur,
      listRappel: [rappelVehicule],
    );

    final utilisateur2 = MockUtilisateur();
    final rappelVehicule2 = MockRappelVehicule();

    final vehiculeCopy = vehicule.copyWith(
      uid: 'uidmodif',
      nom: 'nommodif',
      marque: 'marquemodif',
      immatriculation: 'immatriculationmodif',
      km: 20000,
      notes: 'notesmodif',
      dateControleTechnique: DateTime(2022, 10, 25),
      dateRevision: DateTime(2022, 10, 25),
      dateDistribution: DateTime(2022, 10, 25),
      utilisateur: utilisateur2,
      listRappel: [rappelVehicule2],
    );

    expect(vehiculeCopy.uid, 'uidmodif');
    expect(vehiculeCopy.nom, 'nommodif');
    expect(vehiculeCopy.marque, 'marquemodif');
    expect(vehiculeCopy.immatriculation, 'immatriculationmodif');
    expect(vehiculeCopy.km, 20000);
    expect(vehiculeCopy.notes, 'notesmodif');
    expect(vehiculeCopy.dateControleTechnique, DateTime(2022, 10, 25));
    expect(vehiculeCopy.dateRevision, DateTime(2022, 10, 25));
    expect(vehiculeCopy.dateDistribution, DateTime(2022, 10, 25));
    expect(vehiculeCopy.utilisateur, utilisateur2);
    expect(vehiculeCopy.listRappel, [rappelVehicule2]);
  });
}
