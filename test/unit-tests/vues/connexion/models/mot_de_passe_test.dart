import 'package:memo_car/vues/connexion/models/mot_de_passe.dart';
import 'package:test/test.dart';

void main() {
  test('pure', () {
    const password = Password.pure();
    expect(password.value, '');
    expect(password.pure, true);
  });
  test('dirty', () {
    const password = Password.dirty('dirty');
    expect(password.value, 'dirty');
    expect(password.pure, false);
  });
  test('mot de passe vide', () {
    const password = Password.dirty('');
    expect(password.error, PasswordValidationError.empty);
  });
  test('mot de passe trop court', () {
    const password = Password.dirty('1234');
    expect(password.error, PasswordValidationError.tropCourt);
  });
  test('mot de passe correct', () {
    const password = Password.dirty('123456789');
    expect(password.error, isNull);
  });
  test('message erreur : vide ', () {
    expect(PasswordValidationError.empty.texte, 'Mot de passe requis !');
  });
  test('message erreur : tropCourt ', () {
    expect(PasswordValidationError.tropCourt.texte, 'Mot de passe trop court');
  });
}
