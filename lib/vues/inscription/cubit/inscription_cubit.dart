import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'inscription_state.dart';

class InscriptionCubit extends Cubit<InscriptionState> {
  InscriptionCubit() : super(InscriptionInitial());
}
