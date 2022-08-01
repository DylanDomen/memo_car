import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:formz/formz.dart';
import 'package:memo_car/models/authentification_repository.dart';
import 'package:memo_car/vues/connexion/models/email.dart';
import 'package:memo_car/vues/connexion/models/mot_de_passe.dart';
import 'package:memo_car/vues/connexion/models/mot_de_passe_confirme.dart';

part 'inscription_state.dart';

class InscriptionCubit extends Cubit<InscriptionState> {
  final AuthentificationRepository authentificationRepository;
  InscriptionCubit({required this.authentificationRepository})
      : super(const InscriptionState());

  void emailModifier({required String emailtexte}) {
    final email = Email.dirty(emailtexte);
    emit(
      state.copyWith(
        email: email,
        status: Formz.validate(
          [email, state.motDePasse, state.motDePasseConfirme],
        ),
      ),
    );
  }

  void motDePasseModifier({required String motDePasseTexte}) {
    final motDePasse = Password.dirty(motDePasseTexte);
    emit(
      state.copyWith(
        motDePasse: motDePasse,
        status: Formz.validate(
          [state.email, motDePasse, state.motDePasseConfirme],
        ),
      ),
    );
  }

  void motDePasseConfirmeModifier({
    required String motDePasseConfirmeTexte,
  }) {
    final motDePasseConfirme = ConfirmedPassword.dirty(
      value: motDePasseConfirmeTexte,
      password: state.motDePasse,
    );
    emit(
      state.copyWith(
        motDePasseConfirme: motDePasseConfirme,
        status: Formz.validate(
          [state.email, state.motDePasse, motDePasseConfirme],
        ),
      ),
    );
  }

  Future<void> submit() async {
    if (state.status.isValidated) {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      try {
        await authentificationRepository.inscriptionEmailMotDePasse(
          email: state.email.value,
          motDePasse: state.motDePasse.value,
        );
        emit(state.copyWith(status: FormzStatus.submissionSuccess));
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          emit(
            state.copyWith(
              status: FormzStatus.submissionFailure,
              messageErreur: 'Mot de passe trop faible !',
            ),
          );
        } else if (e.code == 'email-already-in-use') {
          emit(
            state.copyWith(
              status: FormzStatus.submissionFailure,
              messageErreur: 'Le compte utilisateur exist déjà !',
            ),
          );
        }
      } catch (e) {
        emit(
          state.copyWith(
            status: FormzStatus.submissionFailure,
            messageErreur: 'Erreur inconnu',
          ),
        );
      }
    } else {
      emit(
        state.copyWith(
          status: FormzStatus.submissionFailure,
          messageErreur: 'Formulaire non valide',
        ),
      );
    }
  }
}
