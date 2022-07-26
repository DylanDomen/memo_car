import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'connexion_state.dart';

class ConnexionCubit extends Cubit<ConnexionState> {
  ConnexionCubit() : super(ConnexionInitial());
}
