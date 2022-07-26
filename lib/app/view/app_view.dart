import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memo_car/app/app_bloc.dart';
import 'package:memo_car/routes/routes.dart';

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MemoCar',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FlowBuilder<AppState>(
        state: context.select((AppBloc value) => value.state),
        onGeneratePages: (app, pages) => onGenerateAppViewPages(app: app),
      ),
    );
  }
}
