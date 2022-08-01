import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_storage/firebase_storage.dart' as storage;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:memo_car/models/utilisateur.dart';
import 'package:memo_car/models/vehicule.dart';

class VehiculeView extends StatefulWidget {
  VehiculeView({super.key});

  @override
  State<VehiculeView> createState() => _VehiculeViewState();
}

class _VehiculeViewState extends State<VehiculeView> {
  File? photoFile;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: prendrePhoto,
              child: Icon(Icons.camera_alt),
            ),
            if (photoFile != null) Image(image: Image.file(photoFile!).image),
            ElevatedButton(
              onPressed: () => ajouterVehicule(),
              child: Text('ajouter un véhicule'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> prendrePhoto() async {
    final _picker = ImagePicker();
    final photo = await _picker.pickImage(source: ImageSource.camera);
    if (photo != null) {
      final photoFinal = File(photo.path);
      setState(
        () => photoFile = photoFinal,
      );
    }
  }

  Future<void> ajouterVehicule() async {
    final userUid = FirebaseAuth.instance.currentUser?.uid;
    final utilisateurFirebase = await FirebaseFirestore.instance
        .collection('utilisateurs')
        .doc(userUid)
        .get();
    final utilisateurData = utilisateurFirebase.data();

    final utilisateur = Utilisateur(
      uid: utilisateurData!['uid'] as String,
      email: utilisateurData['email'] as String,
      listVehicule: const [],
      listMemo: const [],
      listRendezVous: const [],
    );

    final storageRef = FirebaseStorage.instance
        .ref()
        .child('vehicules')
        .child(DateTime.now().toString());
    final storage.UploadTask task;
    task = storageRef.putFile(photoFile!);
    final snapshot = await task.whenComplete(() => null);
    final urlImage = await snapshot.ref.getDownloadURL();

    final vehicule = Vehicule(
      nom: '206',
      marque: 'Peugeot',
      immatriculation: '95 ABC 974',
      km: 200000,
      photo: urlImage,
      notes: "ma voiture c'est la meilleur",
      dateControleTechnique: DateTime(2022, 10, 24),
      dateRevision: DateTime(2022, 10, 23),
      dateDistribution: DateTime(2022, 10, 23),
      utilisateur: utilisateur,
      listRappel: [],
    );

    final CollectionReference vehicules =
        FirebaseFirestore.instance.collection('vehicules');
    final uidVehicule = await vehicules.add({
      'nom': vehicule.nom,
      'marque': vehicule.marque,
      'immatriculation': vehicule.immatriculation,
      'km': vehicule.km,
      'photo': vehicule.photo,
      'notes': vehicule.notes,
      'dateControleTechnique': vehicule.dateControleTechnique,
      'dateRevision': vehicule.dateRevision,
      'dateDistribution': vehicule.dateDistribution,
      'utilisateur': vehicule.utilisateur.uid,
      'listRappel': vehicule.listRappel,
    });

    await FirebaseFirestore.instance
        .collection('utilisateurs')
        .doc(vehicule.utilisateur.uid)
        .update({
      'listVehicule': [uidVehicule.id],
    });
  }
}
