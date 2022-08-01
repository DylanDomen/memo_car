import 'package:bloc_test/bloc_test.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:formz/formz.dart';
import 'package:memo_car/models/authentification_repository.dart';
import 'package:memo_car/vues/connexion/cubit/connexion_cubit.dart';
import 'package:memo_car/vues/connexion/models/email.dart';
import 'package:memo_car/vues/connexion/models/mot_de_passe.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class MockFireAuth extends Mock implements FirebaseAuth {}

class MockUserCredential extends Mock implements UserCredential {}

class MockAuthentificationRepository extends Mock
    implements AuthentificationRepository {}

void main() {
  late FirebaseAuth auth;
  late AuthentificationRepository authentificationRepository;

  setUp(() {
    auth = MockFireAuth();
    authentificationRepository = MockAuthentificationRepository();
    when(
      () => authentificationRepository.instance,
    ).thenAnswer((invocation) => auth);
  });
  group('normal tests', () {
    test('etat initial', () {
      expect(
        ConnexionCubit(
          authentificationRepository: authentificationRepository,
        ).state,
        const ConnexionState(),
      );
    });
  });
  group('bloc tests', () {
    blocTest<ConnexionCubit, ConnexionState>(
      'email modifier',
      build: () => ConnexionCubit(
        authentificationRepository: authentificationRepository,
      ),
      act: (cubit) => cubit.emailModifier(emailtexte: 'xxx'),
      expect: () => [
        const ConnexionState(
          email: Email.dirty('xxx'),
          status: FormzStatus.invalid,
        ),
      ],
    );
    blocTest<ConnexionCubit, ConnexionState>(
      'mot de passe modifier',
      build: () => ConnexionCubit(
        authentificationRepository: authentificationRepository,
      ),
      act: (cubit) => cubit.motDePasseModifier(motDePasseTexte: 'xxx'),
      expect: () => [
        const ConnexionState(
          motDePasse: Password.dirty('xxx'),
          status: FormzStatus.invalid,
        ),
      ],
    );
    blocTest<ConnexionCubit, ConnexionState>(
      'submit réussi',
      build: () => ConnexionCubit(
        authentificationRepository: authentificationRepository,
      ),
      setUp: () {
        when(
          () => authentificationRepository.connexionEmailMotDePasse(
            email: any(named: 'email'),
            motDePasse: any(named: 'motDePasse'),
          ),
        ).thenAnswer((invocation) => Future.value());
      },
      act: (cubit) => cubit
        ..emailModifier(emailtexte: 'mail@gmail.com')
        ..motDePasseModifier(motDePasseTexte: 'mot de passe')
        ..submit(),
      verify: (_) {
        verify(
          () => authentificationRepository.connexionEmailMotDePasse(
            email: any(named: 'email'),
            motDePasse: any(named: 'motDePasse'),
          ),
        ).called(1);
      },
      expect: () => [
        const ConnexionState(
          email: Email.dirty('mail@gmail.com'),
          status: FormzStatus.invalid,
        ),
        const ConnexionState(
          email: Email.dirty('mail@gmail.com'),
          motDePasse: Password.dirty('mot de passe'),
          status: FormzStatus.valid,
        ),
        const ConnexionState(
          email: Email.dirty('mail@gmail.com'),
          motDePasse: Password.dirty('mot de passe'),
          status: FormzStatus.submissionInProgress,
        ),
        const ConnexionState(
          email: Email.dirty('mail@gmail.com'),
          motDePasse: Password.dirty('mot de passe'),
          status: FormzStatus.submissionSuccess,
        ),
      ],
    );

    blocTest<ConnexionCubit, ConnexionState>(
      'submit echec quand formulaire non valid',
      build: () => ConnexionCubit(
        authentificationRepository: authentificationRepository,
      ),
      act: (cubit) => cubit
        ..emailModifier(emailtexte: 'mail@gmail.com')
        ..motDePasseModifier(motDePasseTexte: '')
        ..submit(),
      verify: (_) {
        verifyNever(
          () => authentificationRepository.connexionEmailMotDePasse(
            email: any(named: 'email'),
            motDePasse: any(named: 'motDePasse'),
          ),
        );
      },
      expect: () => [
        const ConnexionState(
          email: Email.dirty('mail@gmail.com'),
          status: FormzStatus.invalid,
        ),
        const ConnexionState(
          email: Email.dirty('mail@gmail.com'),
          motDePasse: Password.dirty(''),
          status: FormzStatus.invalid,
        ),
        const ConnexionState(
          email: Email.dirty('mail@gmail.com'),
          motDePasse: Password.dirty(''),
          status: FormzStatus.submissionFailure,
          messageErreur: 'Formulaire non valide',
        ),
      ],
    );

    blocTest<ConnexionCubit, ConnexionState>(
      'submit echec quand formulaire valid : user not found',
      build: () => ConnexionCubit(
        authentificationRepository: authentificationRepository,
      ),
      setUp: () {
        when(
          () => authentificationRepository.connexionEmailMotDePasse(
            email: any(named: 'email'),
            motDePasse: any(named: 'motDePasse'),
          ),
        ).thenThrow(FirebaseAuthException(code: 'user-not-found'));
      },
      act: (cubit) => cubit
        ..emailModifier(emailtexte: 'mail@gmail.com')
        ..motDePasseModifier(motDePasseTexte: 'motdepasse')
        ..submit(),
      verify: (_) {
        verify(
          () => authentificationRepository.connexionEmailMotDePasse(
            email: any(named: 'email'),
            motDePasse: any(named: 'motDePasse'),
          ),
        ).called(1);
      },
      expect: () => [
        const ConnexionState(
          email: Email.dirty('mail@gmail.com'),
          status: FormzStatus.invalid,
        ),
        const ConnexionState(
          email: Email.dirty('mail@gmail.com'),
          motDePasse: Password.dirty('motdepasse'),
          status: FormzStatus.valid,
        ),
        const ConnexionState(
          email: Email.dirty('mail@gmail.com'),
          motDePasse: Password.dirty('motdepasse'),
          status: FormzStatus.submissionInProgress,
        ),
        const ConnexionState(
          email: Email.dirty('mail@gmail.com'),
          motDePasse: Password.dirty('motdepasse'),
          status: FormzStatus.submissionFailure,
          messageErreur: 'Utilisateur inconnu',
        ),
      ],
    );
    blocTest<ConnexionCubit, ConnexionState>(
      'submit echec quand formulaire valid : wrong-password',
      build: () => ConnexionCubit(
        authentificationRepository: authentificationRepository,
      ),
      setUp: () {
        when(
          () => authentificationRepository.connexionEmailMotDePasse(
            email: any(named: 'email'),
            motDePasse: any(named: 'motDePasse'),
          ),
        ).thenThrow(FirebaseAuthException(code: 'wrong-password'));
      },
      act: (cubit) => cubit
        ..emailModifier(emailtexte: 'mail@gmail.com')
        ..motDePasseModifier(motDePasseTexte: 'motdepasse')
        ..submit(),
      verify: (_) {
        verify(
          () => authentificationRepository.connexionEmailMotDePasse(
            email: any(named: 'email'),
            motDePasse: any(named: 'motDePasse'),
          ),
        ).called(1);
      },
      expect: () => [
        const ConnexionState(
          email: Email.dirty('mail@gmail.com'),
          status: FormzStatus.invalid,
        ),
        const ConnexionState(
          email: Email.dirty('mail@gmail.com'),
          motDePasse: Password.dirty('motdepasse'),
          status: FormzStatus.valid,
        ),
        const ConnexionState(
          email: Email.dirty('mail@gmail.com'),
          motDePasse: Password.dirty('motdepasse'),
          status: FormzStatus.submissionInProgress,
        ),
        const ConnexionState(
          email: Email.dirty('mail@gmail.com'),
          motDePasse: Password.dirty('motdepasse'),
          status: FormzStatus.submissionFailure,
          messageErreur: 'Mot de passe incorrect',
        ),
      ],
    );

    blocTest<ConnexionCubit, ConnexionState>(
      'submit echec quand formulaire valid : erreur exeption',
      build: () => ConnexionCubit(
        authentificationRepository: authentificationRepository,
      ),
      setUp: () {
        when(
          () => authentificationRepository.connexionEmailMotDePasse(
            email: any(named: 'email'),
            motDePasse: any(named: 'motDePasse'),
          ),
        ).thenThrow(Exception('oups'));
      },
      act: (cubit) => cubit
        ..emailModifier(emailtexte: 'mail@gmail.com')
        ..motDePasseModifier(motDePasseTexte: 'motdepasse')
        ..submit(),
      verify: (_) {
        verify(
          () => authentificationRepository.connexionEmailMotDePasse(
            email: any(named: 'email'),
            motDePasse: any(named: 'motDePasse'),
          ),
        ).called(1);
      },
      expect: () => [
        const ConnexionState(
          email: Email.dirty('mail@gmail.com'),
          status: FormzStatus.invalid,
        ),
        const ConnexionState(
          email: Email.dirty('mail@gmail.com'),
          motDePasse: Password.dirty('motdepasse'),
          status: FormzStatus.valid,
        ),
        const ConnexionState(
          email: Email.dirty('mail@gmail.com'),
          motDePasse: Password.dirty('motdepasse'),
          status: FormzStatus.submissionInProgress,
        ),
        const ConnexionState(
          email: Email.dirty('mail@gmail.com'),
          motDePasse: Password.dirty('motdepasse'),
          status: FormzStatus.submissionFailure,
          messageErreur: 'Erreur inconnu',
        ),
      ],
    );
  });
}
