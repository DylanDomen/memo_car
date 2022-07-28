import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:memo_car/app/app_bloc.dart';
import 'package:memo_car/shared/widgets/custom_text_field.dart';

class InscriptionView extends StatelessWidget {
  const InscriptionView({super.key});

  @override
  Widget build(BuildContext context) {
    final appBloc = context.watch<AppBloc>();

    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextField(
              key: const Key('TextFieldEmailVueInscription'),
              labelText: 'Email',
              labelStyle: const TextStyle(
                color: Colors.blueAccent,
                fontWeight: FontWeight.bold,
              ),
              onChangedMethod: (email) => null,
            ),
            CustomTextField(
              key: const Key('TextFieldMotDePasseVueInscription'),
              labelText: 'Mot de passe',
              labelStyle: const TextStyle(
                color: Colors.blueAccent,
                fontWeight: FontWeight.bold,
              ),
              onChangedMethod: (motDePasse) => null,
            ),
            ElevatedButton(
              key: const Key('BoutonInscription'),
              onPressed: () => null,
              child: const Text("S'inscrire"),
            ),
            TextButton(
              key: const Key('BoutonConnexionVueInscription'),
              onPressed: () => appBloc.add(const GoToConnexion()),
              child: const Text('Déjà un compte ? Connectez-vous !'),
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
