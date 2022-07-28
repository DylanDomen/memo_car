part of 'inscription_cubit.dart';

class InscriptionState extends Equatable {
  final String? messageErreur;
  final FormzStatus status;
  final Email email;
  final Password motDePasse;
  final ConfirmedPassword motDePasseConfirme;

  const InscriptionState({
    this.messageErreur,
    this.status = FormzStatus.pure,
    this.email = const Email.pure(),
    this.motDePasse = const Password.pure(),
    this.motDePasseConfirme =
        const ConfirmedPassword.pure(password: Password.pure()),
  });

  InscriptionState copyWith({
    String? messageErreur,
    FormzStatus? status,
    Email? email,
    Password? motDePasse,
    ConfirmedPassword? motDePasseConfirme,
  }) {
    return InscriptionState(
      messageErreur: messageErreur ?? this.messageErreur,
      status: status ?? this.status,
      email: email ?? this.email,
      motDePasse: motDePasse ?? this.motDePasse,
      motDePasseConfirme: motDePasseConfirme ?? this.motDePasseConfirme,
    );
  }

  @override
  List<Object?> get props => [
        messageErreur,
        status,
        email,
        motDePasse,
        motDePasseConfirme,
      ];
}
