import 'package:firebase_auth/firebase_auth.dart';

class AuthentificationRepository {
  late FirebaseAuth instance;

  AuthentificationRepository() {
    instance = FirebaseAuth.instance;
  }

  Future<void> connexionEmailMotDePasse({
    required String email,
    required String motDePasse,
  }) async {
    await instance.signInWithEmailAndPassword(
      email: email,
      password: motDePasse,
    );
  }
}
