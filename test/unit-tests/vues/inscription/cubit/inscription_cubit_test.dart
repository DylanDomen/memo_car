import 'package:bloc_test/bloc_test.dart';
import 'package:formz/formz.dart';
import 'package:memo_car/models/authentification_repository.dart';
import 'package:memo_car/vues/connexion/models/email.dart';
import 'package:memo_car/vues/connexion/models/mot_de_passe.dart';
import 'package:memo_car/vues/connexion/models/mot_de_passe_confirme.dart';
import 'package:memo_car/vues/inscription/cubit/inscription_cubit.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class MockAuthentificationRepository extends Mock
    implements AuthentificationRepository {}

void main() {
  late AuthentificationRepository authentificationRepository;

  setUp(() {
    authentificationRepository = MockAuthentificationRepository();
  });

  group('normal tests', () {
    test('etat initial', () {
      expect(
        InscriptionCubit(
          authentificationRepository: authentificationRepository,
        ).state,
        const InscriptionState(),
      );
    });
  });

  group('bloc tests', () {
    blocTest<InscriptionCubit, InscriptionState>(
      'email modifier',
      build: () => InscriptionCubit(
        authentificationRepository: authentificationRepository,
      ),
      act: (cubit) => cubit.emailModifier(emailtexte: 'xxx'),
      expect: () => [
        const InscriptionState(
          email: Email.dirty('xxx'),
          status: FormzStatus.invalid,
        ),
      ],
    );

    blocTest<InscriptionCubit, InscriptionState>(
      'mot de passe modifier',
      build: () => InscriptionCubit(
        authentificationRepository: authentificationRepository,
      ),
      act: (cubit) => cubit.motDePasseModifier(motDePasseTexte: 'motdepasse'),
      expect: () => [
        const InscriptionState(
          motDePasse: Password.dirty('motdepasse'),
          status: FormzStatus.invalid,
        ),
      ],
    );

    blocTest<InscriptionCubit, InscriptionState>(
      'mot de passe confirme modifier',
      build: () => InscriptionCubit(
        authentificationRepository: authentificationRepository,
      ),
      act: (cubit) => cubit.motDePasseConfirmeModifier(
        motDePasseConfirmeTexte: 'motdepasse',
      ),
      expect: () => [
        const InscriptionState(
          motDePasseConfirme: ConfirmedPassword.dirty(
            value: 'motdepasse',
            password: Password.dirty('motdepasse'),
          ),
          status: FormzStatus.invalid,
        ),
      ],
    );
  });

  blocTest<InscriptionCubit, InscriptionState>(
    'submit echec quand formulaire non valid',
    build: () => InscriptionCubit(
      authentificationRepository: authentificationRepository,
    ),
    act: (cubit) => cubit
      ..emailModifier(emailtexte: 'mail@gmail.com')
      ..motDePasseModifier(motDePasseTexte: '')
      ..motDePasseConfirmeModifier(motDePasseConfirmeTexte: '')
      ..submit(),
    verify: (_) {
      verifyNever(
        () => authentificationRepository.inscriptionEmailMotDePasse(
          email: any(named: 'email'),
          motDePasse: any(named: 'motDePasse'),
        ),
      );
    },
    expect: () => [
      const InscriptionState(
        email: Email.dirty('mail@gmail.com'),
        status: FormzStatus.invalid,
      ),
      const InscriptionState(
        email: Email.dirty('mail@gmail.com'),
        motDePasse: Password.dirty(''),
        status: FormzStatus.invalid,
      ),
      const InscriptionState(
        email: Email.dirty('mail@gmail.com'),
        motDePasse: Password.dirty(''),
        motDePasseConfirme:
            ConfirmedPassword.dirty(value: '', password: Password.dirty('')),
        status: FormzStatus.invalid,
      ),
      const InscriptionState(
        email: Email.dirty('mail@gmail.com'),
        motDePasse: Password.dirty(''),
        motDePasseConfirme:
            ConfirmedPassword.dirty(value: '', password: Password.dirty('')),
        status: FormzStatus.submissionFailure,
        messageErreur: 'Formulaire non valide',
      ),
    ],
  );

  // blocTest<InscriptionCubit, InscriptionState>(
  //   'submit réussi',
  //   build: () => InscriptionCubit(
  //     authentificationRepository: authentificationRepository,
  //   ),
  //   setUp: () {
  //     when(
  //       () => authentificationRepository.connexionEmailMotDePasse(
  //         email: any(named: 'email'),
  //         motDePasse: any(named: 'motDePasse'),
  //       ),
  //     ).thenAnswer((invocation) => Future.value());
  //   },
  //   act: (cubit) => cubit
  //     ..emailModifier(emailtexte: 'mail@gmail.com')
  //     ..motDePasseModifier(motDePasseTexte: 'motdepasse')
  //     ..motDePasseConfirmeModifier(motDePasseConfirmeTexte: 'motdepasse')
  //     ..submit(),
  //   verify: (_) {
  //     verify(
  //       () => authentificationRepository.inscriptionEmailMotDePasse(
  //         email: any(named: 'email'),
  //         motDePasse: any(named: 'motDePasse'),
  //       ),
  //     ).called(1);
  //   },
  //   expect: () => [
  //     const InscriptionState(
  //       email: Email.dirty('mail@gmail.com'),
  //       status: FormzStatus.invalid,
  //     ),
  //     const InscriptionState(
  //       email: Email.dirty('mail@gmail.com'),
  //       motDePasse: Password.dirty('motdepasse'),
  //       status: FormzStatus.invalid,
  //     ),
  //     const InscriptionState(
  //       email: Email.dirty('mail@gmail.com'),
  //       motDePasse: Password.dirty('motdepasse'),
  //       motDePasseConfirme: ConfirmedPassword.dirty(
  //         value: 'motdepasse',
  //         password: Password.dirty('motdepasse'),
  //       ),
  //       status: FormzStatus.valid,
  //     ),
  //     const InscriptionState(
  //       email: Email.dirty('mail@gmail.com'),
  //       motDePasse: Password.dirty('motdepasse'),
  //       motDePasseConfirme: ConfirmedPassword.dirty(
  //         value: 'motdepasse',
  //         password: Password.dirty('motdepasse'),
  //       ),
  //       status: FormzStatus.submissionInProgress,
  //     ),
  //     const InscriptionState(
  //       email: Email.dirty('mail@gmail.com'),
  //       motDePasse: Password.dirty('motdepasse'),
  //       motDePasseConfirme: ConfirmedPassword.dirty(
  //         value: 'motdepasse',
  //         password: Password.dirty('motdepasse'),
  //       ),
  //       status: FormzStatus.submissionSuccess,
  //     ),
  //   ],
  // );
}
