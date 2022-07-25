import 'package:equatable/equatable.dart';
import 'package:memo_car/models/type_rappel.dart';
import 'package:memo_car/models/vehicule.dart';

class RappelVehicule extends Equatable {
  String? uid;
  DateTime dateRappel;
  TypeRappel typeRappel;
  Vehicule vehicule;

  RappelVehicule({
    this.uid,
    required this.dateRappel,
    required this.typeRappel,
    required this.vehicule,
  });

  @override
  List<Object?> get props => [
        uid,
        dateRappel,
        typeRappel,
        vehicule,
      ];
}
