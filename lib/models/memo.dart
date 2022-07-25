import 'package:equatable/equatable.dart';
import 'package:memo_car/models/utilisateur.dart';

class Memo extends Equatable {
  String? uid;
  String nom;
  String? notes;
  List<String> photos;
  Utilisateur utilisateur;

  Memo({
    this.uid,
    required this.nom,
    this.notes,
    required this.photos,
    required this.utilisateur,
  });

  Memo copyWith({
    String? uid,
    String? nom,
    String? notes,
    List<String>? photos,
    Utilisateur? utilisateur,
  }) {
    return Memo(
      uid: uid ?? this.uid,
      nom: nom ?? this.nom,
      notes: notes ?? this.notes,
      photos: photos ?? this.photos,
      utilisateur: utilisateur ?? this.utilisateur,
    );
  }

  @override
  List<Object?> get props => [
        uid,
        nom,
        notes,
        photos,
        utilisateur,
      ];
}
