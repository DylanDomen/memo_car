enum TypeRappel {
  controleTechnique,
  revision,
  distribution,
}

extension TypeRappelTxt on TypeRappel {
  String get texte {
    switch (this) {
      case TypeRappel.controleTechnique:
        return 'Contrôle technique';
      case TypeRappel.revision:
        return 'Révision';
      case TypeRappel.distribution:
        return 'Distribution';
    }
  }
}
