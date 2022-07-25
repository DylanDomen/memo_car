import 'package:memo_car/models/type_rappel.dart';
import 'package:test/test.dart';

void main() {
  test('Fonction texte Contrôle technique', () {
    expect(TypeRappel.controleTechnique.texte, 'Contrôle technique');
  });
  test('Fonction texte Révision', () {
    expect(TypeRappel.revision.texte, 'Révision');
  });
  test('Fonction texte Distribution', () {
    expect(TypeRappel.distribution.texte, 'Distribution');
  });
}
