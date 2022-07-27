import 'package:formz/formz.dart';

enum EmailValidationError { empty, mailIncorrect }

extension EmailValidationErrorTexte on EmailValidationError {
  String get texte {
    switch (this) {
      case EmailValidationError.empty:
        return 'Email requis !';
      case EmailValidationError.mailIncorrect:
        return 'Email incorrect';
    }
  }
}

class Email extends FormzInput<String, EmailValidationError> {
  const Email.pure() : super.pure('');
  const Email.dirty([super.value = '']) : super.dirty();

  @override
  EmailValidationError? validator(String? value) {
    final emailRegExp =
        RegExp(r'^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+.[a-zA-Z0-9-.]+$');

    if (value == '') {
      return EmailValidationError.empty;
    }
    if (!emailRegExp.hasMatch(value ?? '')) {
      return EmailValidationError.mailIncorrect;
    }

    return null;
  }
}
