import 'package:flutter/material.dart';
import 'package:memo_car/vues/vehicule/vehicule_view.dart';

class VehiculePage extends StatelessWidget {
  static Page<dynamic> page() => const MaterialPage<void>(
        child: VehiculePage(),
      );
  const VehiculePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: VehiculeView(),
    );
  }
}
