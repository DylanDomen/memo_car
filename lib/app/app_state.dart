part of 'app_bloc.dart';

enum AppStep {
  inscription,
  connexion,
}

// ignore: must_be_immutable
class AppState extends Equatable {
  AppStep step;

  AppState({this.step = AppStep.connexion});

  AppState copyWith({
    AppStep? step,
  }) {
    return AppState(
      step: step ?? this.step,
    );
  }

  @override
  List<Object?> get props => [
        step,
      ];
}
