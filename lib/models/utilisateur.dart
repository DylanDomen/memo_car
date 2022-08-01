import 'package:equatable/equatable.dart';
import 'package:memo_car/models/memo.dart';
import 'package:memo_car/models/rendez_vous.dart';
import 'package:memo_car/models/vehicule.dart';

// ignore: must_be_immutable
class Utilisateur extends Equatable {
  final String? uid;
  final String email;
  final List<Vehicule> listVehicule;
  final List<Memo> listMemo;
  final List<RendezVous> listRendezVous;

  const Utilisateur({
    this.uid,
    required this.email,
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
      listVehicule: listVehicule ?? this.listVehicule,
      listMemo: listMemo ?? this.listMemo,
      listRendezVous: listRendezVous ?? this.listRendezVous,
    );
  }

  @override
  List<Object?> get props => [
        uid,
        email,
        listVehicule,
        listMemo,
        listRendezVous,
      ];
}
