import 'package:equatable/equatable.dart';
import 'package:memo_car/models/type_rappel.dart';
import 'package:memo_car/models/vehicule.dart';

class RappelVehicule extends Equatable {
  final String? uid;
  final DateTime dateRappel;
  final TypeRappel typeRappel;
  final Vehicule vehicule;

  const RappelVehicule({
    this.uid,
    required this.dateRappel,
    required this.typeRappel,
    required this.vehicule,
  });

  RappelVehicule copyWith({
    String? uid,
    DateTime? dateRappel,
    TypeRappel? typeRappel,
    Vehicule? vehicule,
  }) {
    return RappelVehicule(
      uid: uid ?? this.uid,
      dateRappel: dateRappel ?? this.dateRappel,
      typeRappel: typeRappel ?? this.typeRappel,
      vehicule: vehicule ?? this.vehicule,
    );
  }

  @override
  List<Object?> get props => [
        uid,
        dateRappel,
        typeRappel,
        vehicule,
      ];
}
