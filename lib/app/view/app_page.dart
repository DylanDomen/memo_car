import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memo_car/app/app_bloc.dart';
import 'package:memo_car/app/view/app_view.dart';
import 'package:memo_car/models/authentification_repository.dart';

class AppPage extends StatelessWidget {
  const AppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => AuthentificationRepository(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AppBloc(),
          ),
        ],
        child: const AppView(),
      ),
    );
  }
}
