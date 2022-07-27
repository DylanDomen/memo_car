import 'package:formz/formz.dart';

enum PasswordValidationError { empty, tropCourt }

extension PasswordValidationErrorTexte on PasswordValidationError {
  String get texte {
    switch (this) {
      case PasswordValidationError.empty:
        return 'Mot de passe requis !';
      case PasswordValidationError.tropCourt:
        return 'Mot de passe trop court';
    }
  }
}

class Password extends FormzInput<String, PasswordValidationError> {
  const Password.pure() : super.pure('');
  const Password.dirty([super.value = '']) : super.dirty();

  @override
  PasswordValidationError? validator(String value) {
    if (value == '') {
      return PasswordValidationError.empty;
    }
    if (value.length <= 5) {
      return PasswordValidationError.tropCourt;
    }

    return null;
  }
}
