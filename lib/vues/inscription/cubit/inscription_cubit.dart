import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:memo_car/vues/connexion/models/email.dart';
import 'package:memo_car/vues/connexion/models/mot_de_passe.dart';
import 'package:memo_car/vues/connexion/models/mot_de_passe_confirme.dart';

part 'inscription_state.dart';

class InscriptionCubit extends Cubit<InscriptionState> {
  InscriptionCubit() : super(const InscriptionState());
}
