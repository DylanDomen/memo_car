enum TypeRappel {
  ControleTechnique,
  Revision,
  Distribution,
}

extension TypeRappelTxt on TypeRappel {
  String get texte {
    switch (this) {
      case TypeRappel.ControleTechnique:
        return 'Contrôle technique';
      case TypeRappel.Revision:
        return 'Révision';
      case TypeRappel.Distribution:
        return 'Distribution';
    }
  }
}
