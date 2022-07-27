import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:memo_car/app/app_bloc.dart';
import 'package:memo_car/shared/widgets/custom_text_field.dart';
import 'package:memo_car/vues/connexion/cubit/connexion_cubit.dart';

class ConnexionView extends StatelessWidget {
  const ConnexionView({super.key});

  @override
  Widget build(BuildContext context) {
    final connexionCubit = context.watch<ConnexionCubit>();
    final appBloc = context.watch<AppBloc>();

    return SafeArea(
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
            ),
            CustomTextField(
              key: const Key('TextFieldMotDePasse'),
              labelText: 'Mot de passe',
              labelStyle: const TextStyle(
                color: Colors.blueAccent,
                fontWeight: FontWeight.bold,
              ),
              onChangedMethod: (motDePasse) => connexionCubit
                  .motDePasseModifier(motDePasseTexte: motDePasse),
            ),
            ElevatedButton(
              key: const Key('BoutonConnexion'),
              onPressed: connexionCubit.submit,
              child: const Text('Connexion'),
            ),
            TextButton(
              key: const Key('BoutonInscription'),
              onPressed: () => appBloc.add(const GoToInscription()),
              child: const Text("S'inscrire"),
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
    );
  }
}
