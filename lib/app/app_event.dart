part of 'app_bloc.dart';

abstract class AppEvent extends Equatable {
  const AppEvent();
}

class GoToInscription extends AppEvent {
  const GoToInscription();

  @override
  List<Object?> get props => [];
}

class GoToConnexion extends AppEvent {
  const GoToConnexion();

  @override
  List<Object?> get props => [];
}
