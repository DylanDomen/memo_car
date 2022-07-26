import 'package:equatable/equatable.dart';
import 'package:memo_car/models/memo.dart';
import 'package:memo_car/models/rendez_vous.dart';
import 'package:memo_car/models/vehicule.dart';

class Utilisateur extends Equatable {
  String? uid;
  String email;
  String? motDePasse;
  List<Vehicule> listVehicule;
  List<Memo> listMemo;
  List<RendezVous> listRendezVous;

  Utilisateur({
    this.uid,
    required this.email,
    this.motDePasse,
    required this.listVehicule,
    required this.listMemo,
    required this.listRendezVous,
  });

  Utilisateur copyWith({
    String? uid,
    String? email,
    String? motDePasse,
    List<Vehicule>? listVehicule,
    List<Memo>? listMemo,
    List<RendezVous>? listRendezVous,
  }) {
    return Utilisateur(
      uid: uid ?? this.uid,
      email: email ?? this.email,
      motDePasse: motDePasse ?? this.motDePasse,
      listVehicule: listVehicule ?? this.listVehicule,
      listMemo: listMemo ?? this.listMemo,
      listRendezVous: listRendezVous ?? this.listRendezVous,
    );
  }

  @override
  List<Object?> get props => [
        uid,
        email,
        motDePasse,
        listVehicule,
        listMemo,
        listRendezVous,
      ];
}
