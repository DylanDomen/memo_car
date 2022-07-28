part of 'connexion_cubit.dart';

class ConnexionState extends Equatable {
  final String? messageErreur;
  final FormzStatus status;
  final Email email;
  final Password motDePasse;

  const ConnexionState({
    this.messageErreur,
    this.status = FormzStatus.pure,
    this.email = const Email.pure(),
    this.motDePasse = const Password.pure(),
  });

  ConnexionState copyWith({
    String? messageErreur,
    FormzStatus? status,
    Email? email,
    Password? motDePasse,
  }) {
    return ConnexionState(
      messageErreur: messageErreur ?? this.messageErreur,
      status: status ?? this.status,
      email: email ?? this.email,
      motDePasse: motDePasse ?? this.motDePasse,
    );
  }

  @override
  List<Object?> get props => [
        messageErreur,
        status,
        email,
        motDePasse,
      ];
}
