import 'package:formz/formz.dart';
import 'package:memo_car/vues/connexion/models/email.dart';
import 'package:memo_car/vues/connexion/models/mot_de_passe.dart';
import 'package:memo_car/vues/connexion/models/mot_de_passe_confirme.dart';
import 'package:memo_car/vues/inscription/cubit/inscription_cubit.dart';
import 'package:test/test.dart';

void main() {
  test('comparaison entre deux état', () {
    expect(const InscriptionState(), const InscriptionState());
  });

  test('copyWith vide', () {
    expect(const InscriptionState().copyWith(), const InscriptionState());
  });

  test('copyWith champ : status', () {
    expect(
      const InscriptionState().copyWith(status: FormzStatus.invalid),
      const InscriptionState(status: FormzStatus.invalid),
    );
  });

  test('copyWith champ : email', () {
    expect(
      const InscriptionState()
          .copyWith(email: const Email.dirty('test@gmail.com')),
      const InscriptionState(email: Email.dirty('test@gmail.com')),
    );
  });

  test('copyWith champ : motDePasse', () {
    expect(
      const InscriptionState()
          .copyWith(motDePasse: const Password.dirty('motdepasse')),
      const InscriptionState(motDePasse: Password.dirty('motdepasse')),
    );
  });

  test('copyWith champ : motDePasseConfirme', () {
    expect(
      const InscriptionState().copyWith(
        motDePasseConfirme: const ConfirmedPassword.dirty(
          value: 'motdepasse2',
          password: Password.pure(),
        ),
      ),
      const InscriptionState(
        motDePasseConfirme: ConfirmedPassword.dirty(
          value: 'motdepasse2',
          password: Password.pure(),
        ),
      ),
    );
  });

  test('copyWith champ : messageErreur', () {
    expect(
      const InscriptionState().copyWith(messageErreur: 'erreur'),
      const InscriptionState(messageErreur: 'erreur'),
    );
  });
}
