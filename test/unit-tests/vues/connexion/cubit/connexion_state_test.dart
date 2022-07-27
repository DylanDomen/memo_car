import 'package:formz/formz.dart';
import 'package:memo_car/vues/connexion/cubit/connexion_cubit.dart';
import 'package:memo_car/vues/connexion/models/email.dart';
import 'package:memo_car/vues/connexion/models/mot_de_passe.dart';
import 'package:test/test.dart';

void main() {
  test('Comparaison état', () {
    expect(const ConnexionState(), const ConnexionState());
  });

  test('copyWith vide', () {
    expect(const ConnexionState().copyWith(), const ConnexionState());
  });
  test('copyWith status', () {
    expect(
      const ConnexionState().copyWith(status: FormzStatus.submissionInProgress),
      const ConnexionState(status: FormzStatus.submissionInProgress),
    );
  });
  test('copyWith email', () {
    expect(
      const ConnexionState().copyWith(email: const Email.dirty('emailTest')),
      const ConnexionState(
        email: Email.dirty('emailTest'),
      ),
    );
  });
  test('copyWith mot de passe', () {
    expect(
      const ConnexionState()
          .copyWith(motDePasse: const Password.dirty('password')),
      const ConnexionState(motDePasse: Password.dirty('password')),
    );
  });
  test('copyWith messageErreur', () {
    expect(
      const ConnexionState().copyWith(messsageErreur: 'erreur'),
      const ConnexionState(messsageErreur: 'erreur'),
    );
  });
}
