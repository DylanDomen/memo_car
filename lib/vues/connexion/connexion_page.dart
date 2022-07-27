import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memo_car/models/authentification_repository.dart';
import 'package:memo_car/vues/connexion/connexion_view.dart';
import 'package:memo_car/vues/connexion/cubit/connexion_cubit.dart';

class ConnexionPage extends StatelessWidget {
  // ignore: strict_raw_type
  static Page page() => const MaterialPage<void>(child: ConnexionPage());
  const ConnexionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ConnexionCubit(
        authentificationRepository: context.read<AuthentificationRepository>(),
      ),
      child: const Scaffold(
        body: ConnexionView(),
      ),
    );
  }
}
