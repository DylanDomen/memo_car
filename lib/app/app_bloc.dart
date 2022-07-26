import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(AppState()) {
    on<GoToConnexion>(_goToPageConnexion);
    on<GoToInscription>(_goToPageInscription);
  }

  FutureOr<void> _goToPageConnexion(
    GoToConnexion event,
    Emitter<AppState> emit,
  ) {
    emit(state.copyWith(step: AppStep.connexion));
  }

  FutureOr<void> _goToPageInscription(
    GoToInscription event,
    Emitter<AppState> emit,
  ) {
    emit(state.copyWith(step: AppStep.inscription));
  }
}
