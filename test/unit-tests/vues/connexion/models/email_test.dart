import 'package:memo_car/vues/connexion/models/email.dart';
import 'package:test/test.dart';

void main() {
  test('message erreur : empty', () {
    expect(EmailValidationError.empty.texte, 'Email requis !');
  });
  test('message erreur : mailIncorrect', () {
    expect(EmailValidationError.mailIncorrect.texte, 'Email incorrect');
  });
  test('email vide', () {
    const email = Email.dirty('');
    expect(email.error, EmailValidationError.empty);
  });
  test('email correct', () {
    const email = Email.dirty('test@gmail.com');
    expect(email.error, isNull);
  });
  test('email incorrect', () {
    const email = Email.dirty('test.com');
    expect(email.error, EmailValidationError.mailIncorrect);
  });
  test('email.dirty', () {
    const email = Email.dirty('test@gmail.com');
    expect(email.value, 'test@gmail.com');
    expect(email.pure, false);
  });
  test('email.pure', () {
    const email = Email.pure();
    expect(email.value, '');
    expect(email.pure, true);
  });
}
