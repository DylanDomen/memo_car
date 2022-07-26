import 'package:memo_car/models/rappel_vehicule.dart';
import 'package:memo_car/models/type_rappel.dart';
import 'package:memo_car/models/vehicule.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class MockVehicule extends Mock implements Vehicule {}

void main() {
  late Vehicule vehicule;

  setUp(() {
    vehicule = MockVehicule();
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
    final rappelVehicule = RappelVehicule(
      uid: 'uid',
      dateRappel: DateTime(2022, 10, 25),
      typeRappel: TypeRappel.revision,
      vehicule: vehicule,
    );

    expect(rappelVehicule.uid, 'uid');
    expect(rappelVehicule.dateRappel, DateTime(2022, 10, 25));
    expect(rappelVehicule.typeRappel, TypeRappel.revision);
    expect(rappelVehicule.vehicule, vehicule);
  });

  test('copyWith', () {
    final rappelVehicule = RappelVehicule(
      uid: 'uid',
      dateRappel: DateTime(2022, 10, 25),
      typeRappel: TypeRappel.revision,
      vehicule: vehicule,
    );

    final vehicule2 = MockVehicule();

    final rappelVehiculeCopy = rappelVehicule.copyWith(
      uid: 'uidmodif',
      dateRappel: DateTime(2022, 10, 26),
      typeRappel: TypeRappel.distribution,
      vehicule: vehicule2,
    );

    expect(rappelVehiculeCopy.uid, 'uidmodif');
    expect(rappelVehiculeCopy.dateRappel, DateTime(2022, 10, 26));
    expect(rappelVehiculeCopy.typeRappel, TypeRappel.distribution);
    expect(rappelVehiculeCopy.vehicule, vehicule2);
  });
}
