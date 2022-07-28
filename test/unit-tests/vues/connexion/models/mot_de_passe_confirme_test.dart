import 'package:memo_car/vues/connexion/models/mot_de_passe.dart';
import 'package:memo_car/vues/connexion/models/mot_de_passe_confirme.dart';
import 'package:test/test.dart';

void main() {
  const passwordPure = Password.pure();
  const passwordDirty = Password.dirty('motdepasse');

  test('pure', () {
    const confirmedPassword = ConfirmedPassword.pure(password: passwordPure);
    expect(confirmedPassword.value, '');
    expect(confirmedPassword.pure, true);
  });

  test('dirty', () {
    const confirmedPassword =
        ConfirmedPassword.dirty(value: 'motdepasse', password: passwordDirty);
    expect(confirmedPassword.value, 'motdepasse');
    expect(confirmedPassword.pure, false);
  });

  test('mot de passes differents', () {
    const confirmedPassword = ConfirmedPassword.dirty(
      value: 'motdepasseDifferent',
      password: passwordDirty,
    );
    expect(confirmedPassword.error, ConfirmedPasswordValidationError.different);
  });

  test('mot de passes identiques', () {
    const confirmedPassword =
        ConfirmedPassword.dirty(value: 'motdepasse', password: passwordDirty);
    expect(confirmedPassword.error, null);
  });

  test('message erreur : different', () {
    expect(
      ConfirmedPasswordValidationError.different.texte,
      'Les deux mot de passe sont différent!',
    );
  });
}
