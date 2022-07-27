part of 'connexion_cubit.dart';

class ConnexionState extends Equatable {
  final String? messsageErreur;
  final FormzStatus status;
  final Email email;
  final Password motDePasse;

  const ConnexionState({
    this.messsageErreur,
    this.status = FormzStatus.pure,
    this.email = const Email.pure(),
    this.motDePasse = const Password.pure(),
  });

  ConnexionState copyWith({
    String? messsageErreur,
    FormzStatus? status,
    Email? email,
    Password? motDePasse,
  }) {
    return ConnexionState(
      messsageErreur: messsageErreur ?? this.messsageErreur,
      status: status ?? this.status,
      email: email ?? this.email,
      motDePasse: motDePasse ?? this.motDePasse,
    );
  }

  @override
  List<Object?> get props => [
        messsageErreur,
        status,
        email,
        motDePasse,
      ];
}
