import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memo_car/vues/inscription/cubit/inscription_cubit.dart';
import 'package:memo_car/vues/inscription/inscription_view.dart';

class InscriptionPage extends StatelessWidget {
  // ignore: strict_raw_type
  static Page page() => const MaterialPage<void>(child: InscriptionPage());
  const InscriptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InscriptionCubit(),
      child: const Scaffold(
        body: InscriptionView(),
      ),
    );
  }
}
