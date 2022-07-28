import 'package:memo_car/models/rappel_vehicule.dart';
import 'package:memo_car/models/type_rappel.dart';
import 'package:memo_car/models/vehicule.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class MockVehicule extends Mock implements Vehicule {}

void main() {
  late Vehicule vehicule;
  late Vehicule vehicule2;
  late RappelVehicule rappelVehicule;

  setUp(() {
    vehicule = MockVehicule();
    vehicule2 = MockVehicule();

    rappelVehicule = RappelVehicule(
      uid: 'uid',
      dateRappel: DateTime(2022, 10, 25),
      typeRappel: TypeRappel.revision,
      vehicule: vehicule,
    );
  });

  test('Comparaison entre 2 objets rappelVehicule', () {
    expect(
      RappelVehicule(
        uid: 'uid',
        dateRappel: DateTime(2022, 10, 25),
        typeRappel: TypeRappel.revision,
        vehicule: vehicule,
      ),
      RappelVehicule(
        uid: 'uid',
        dateRappel: DateTime(2022, 10, 25),
        typeRappel: TypeRappel.revision,
        vehicule: vehicule,
      ),
    );
  });

  test("Instanciation d'un rappelVehicule", () {
    expect(rappelVehicule.uid, 'uid');
    expect(rappelVehicule.dateRappel, DateTime(2022, 10, 25));
    expect(rappelVehicule.typeRappel, TypeRappel.revision);
    expect(rappelVehicule.vehicule, vehicule);
  });

  test('copyWith champ : uid', () {
    expect(
      rappelVehicule.copyWith(uid: 'uidModif'),
      RappelVehicule(
        uid: 'uidModif',
        dateRappel: DateTime(2022, 10, 25),
        typeRappel: TypeRappel.revision,
        vehicule: vehicule,
      ),
    );
  });

  test('copyWith champ : dateRappel', () {
    expect(
      rappelVehicule.copyWith(dateRappel: DateTime(2022, 09, 26)),
      RappelVehicule(
        uid: 'uid',
        dateRappel: DateTime(2022, 09, 26),
        typeRappel: TypeRappel.revision,
        vehicule: vehicule,
      ),
    );
  });

  test('copyWith champ : typeRappel', () {
    expect(
      rappelVehicule.copyWith(typeRappel: TypeRappel.distribution),
      RappelVehicule(
        uid: 'uid',
        dateRappel: DateTime(2022, 10, 25),
        typeRappel: TypeRappel.distribution,
        vehicule: vehicule,
      ),
    );
  });

  test('copyWith champ : vehicule', () {
    expect(
      rappelVehicule.copyWith(vehicule: vehicule2),
      RappelVehicule(
        uid: 'uid',
        dateRappel: DateTime(2022, 10, 25),
        typeRappel: TypeRappel.revision,
        vehicule: vehicule2,
      ),
    );
  });

  test('copyWith avec tout les champs', () {
    expect(
      rappelVehicule.copyWith(
        uid: 'uidModif',
        dateRappel: DateTime(2022, 09, 26),
        typeRappel: TypeRappel.distribution,
        vehicule: vehicule2,
      ),
      RappelVehicule(
        uid: 'uidModif',
        dateRappel: DateTime(2022, 09, 26),
        typeRappel: TypeRappel.distribution,
        vehicule: vehicule2,
      ),
    );
  });
}
