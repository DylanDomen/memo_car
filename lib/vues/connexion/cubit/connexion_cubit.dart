import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:formz/formz.dart';
import 'package:memo_car/models/authentification_repository.dart';
import 'package:memo_car/vues/connexion/models/email.dart';
import 'package:memo_car/vues/connexion/models/mot_de_passe.dart';

part 'connexion_state.dart';

class ConnexionCubit extends Cubit<ConnexionState> {
  final AuthentificationRepository authentificationRepository;
  ConnexionCubit({required this.authentificationRepository})
      : super(const ConnexionState());

  Future<void> submit() async {
    if (state.status.isValidated) {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      try {
        await authentificationRepository.connexionEmailMotDePasse(
          email: state.email.value,
          motDePasse: state.motDePasse.value,
        );
        emit(state.copyWith(status: FormzStatus.submissionSuccess));
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          emit(
            state.copyWith(
              status: FormzStatus.submissionFailure,
              messageErreur: 'Utilisateur inconnu',
            ),
          );
        } else if (e.code == 'wrong-password') {
          emit(
            state.copyWith(
              status: FormzStatus.submissionFailure,
              messageErreur: 'Mot de passe incorrect',
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

  void emailModifier({required String emailtexte}) {
    final email = Email.dirty(emailtexte);
    emit(
      state.copyWith(
        email: email,
        status: Formz.validate(
          [email, state.motDePasse],
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
          [state.email, motDePasse],
        ),
      ),
    );
  }
}
