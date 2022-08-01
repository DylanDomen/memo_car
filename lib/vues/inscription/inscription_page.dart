import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memo_car/models/authentification_repository.dart';
import 'package:memo_car/vues/inscription/cubit/inscription_cubit.dart';
import 'package:memo_car/vues/inscription/inscription_view.dart';

class InscriptionPage extends StatelessWidget {
  static Page<dynamic> page() =>
      const MaterialPage<void>(child: InscriptionPage());
  const InscriptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InscriptionCubit(
        authentificationRepository: context.read<AuthentificationRepository>(),
      ),
      child: const Scaffold(
        body: InscriptionView(),
      ),
    );
  }
}
