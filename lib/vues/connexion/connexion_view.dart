import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:formz/formz.dart';
import 'package:memo_car/app/app_bloc.dart';
import 'package:memo_car/shared/widgets/custom_text_field.dart';
import 'package:memo_car/vues/connexion/cubit/connexion_cubit.dart';
import 'package:memo_car/vues/connexion/models/email.dart';
import 'package:memo_car/vues/connexion/models/mot_de_passe.dart';

class ConnexionView extends StatelessWidget {
  const ConnexionView({super.key});

  @override
  Widget build(BuildContext context) {
    final connexionCubit = context.watch<ConnexionCubit>();
    final appBloc = context.watch<AppBloc>();

    return SafeArea(
      child: BlocListener<ConnexionCubit, ConnexionState>(
        listener: (context, state) =>
            listenerConnexion(state: state, appBloc: appBloc),
        child: Container(
          padding: const EdgeInsets.all(50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextField(
                key: const Key('TextFieldEmail'),
                labelText: 'Email',
                labelStyle: const TextStyle(
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.bold,
                ),
                onChangedMethod: (email) =>
                    connexionCubit.emailModifier(emailtexte: email),
                error: connexionCubit.state.email.invalid
                    ? connexionCubit.state.email.error?.texte
                    : null,
              ),
              CustomTextField(
                key: const Key('TextFieldMotDePasse'),
                obscureText: true,
                labelText: 'Mot de passe',
                labelStyle: const TextStyle(
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.bold,
                ),
                onChangedMethod: (motDePasse) => connexionCubit
                    .motDePasseModifier(motDePasseTexte: motDePasse),
                error: connexionCubit.state.motDePasse.invalid
                    ? connexionCubit.state.motDePasse.error?.texte
                    : null,
              ),
              ElevatedButton(
                key: const Key('BoutonConnexion'),
                onPressed: connexionCubit.submit,
                child: const Text('Connexion'),
              ),
              TextButton(
                key: const Key('BoutonInscription'),
                onPressed: () => appBloc.add(const GoToInscription()),
                child:
                    const Text('Vous n’avez pas de compte ? Inscrivez-vous !'),
              ),
              Row(
                children: const [
                  Expanded(
                    child: Divider(
                      thickness: 1,
                      color: Colors.black,
                      endIndent: 15,
                    ),
                  ),
                  Text('OU'),
                  Expanded(
                    child: Divider(
                      thickness: 1,
                      color: Colors.black,
                      indent: 15,
                    ),
                  ),
                ],
              ),
              ElevatedButton.icon(
                onPressed: () => null,
                icon: const FaIcon(FontAwesomeIcons.google),
                label: const Text('Google'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void listenerConnexion({
    required ConnexionState state,
    required AppBloc appBloc,
  }) {
    if (state.status == FormzStatus.submissionSuccess) {
      appBloc.add(const GoToVehicule());
    }
  }
}
