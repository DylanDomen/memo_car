import 'package:formz/formz.dart';
import 'package:memo_car/vues/connexion/models/mot_de_passe.dart';

enum ConfirmedPasswordValidationError {
  different,
}

extension ConfirmedPasswordValidationErrorTexte
    on ConfirmedPasswordValidationError {
  String get texte {
    switch (this) {
      case ConfirmedPasswordValidationError.different:
        return 'Les deux mot de passe sont différent!';
    }
  }
}

class ConfirmedPassword
    extends FormzInput<String, ConfirmedPasswordValidationError> {
  final Password password;
  const ConfirmedPassword.pure({required this.password}) : super.pure('');
  const ConfirmedPassword.dirty({String value = '', required this.password})
      : super.dirty(value);

  @override
  ConfirmedPasswordValidationError? validator(String value) {
    if (value != password.value) {
      return ConfirmedPasswordValidationError.different;
    }

    return null;
  }
}
