import 'package:equatable/equatable.dart';
import 'package:memo_car/models/memo.dart';
import 'package:memo_car/models/rendez_vous.dart';
import 'package:memo_car/models/vehicule.dart';

class Utilisateur extends Equatable {
  String? uid;
  String email;
  List<Vehicule> listVehicule;
  List<Memo> listMemo;
  List<RendezVous> listRendezVous;

  Utilisateur({
    this.uid,
    required this.email,
    required this.listVehicule,
    required this.listMemo,
    required this.listRendezVous,
  });

  @override
  List<Object?> get props => [
        uid,
        email,
        listVehicule,
        listMemo,
        listRendezVous,
      ];
}
