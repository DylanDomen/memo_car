import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:memo_car/models/utilisateur.dart';

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

  Future<void> inscriptionEmailMotDePasse({
    required String email,
    required String motDePasse,
  }) async {
    await instance.createUserWithEmailAndPassword(
      email: email,
      password: motDePasse,
    );
    final uidUtilisateur = instance.currentUser?.uid;
    final utilisateur = Utilisateur(
      uid: uidUtilisateur,
      email: email,
      listVehicule: const [],
      listMemo: const [],
      listRendezVous: const [],
    );
    final CollectionReference utilisateurs =
        FirebaseFirestore.instance.collection('utilisateurs');
    await utilisateurs.doc(uidUtilisateur).set({
      'uid': utilisateur.uid,
      'email': utilisateur.email,
      'listVehicule': utilisateur.listVehicule,
      'listMemo': utilisateur.listMemo,
      'listRendezVous': utilisateur.listRendezVous,
    });
  }
}
