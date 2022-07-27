import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:memo_car/app/app_bloc.dart';
import 'package:memo_car/vues/connexion/connexion_view.dart';
import 'package:memo_car/vues/connexion/cubit/connexion_cubit.dart';
import 'package:mocktail/mocktail.dart';

class MockConnexionCubit extends MockCubit<ConnexionState>
    implements ConnexionCubit {}

class MockAppBloc extends MockBloc<AppEvent, AppState> implements AppBloc {}

extension PumpConnexionView on WidgetTester {
  Future<void> pumpConnexionView({
    required ConnexionCubit connexionCubit,
    required AppBloc appBloc,
  }) {
    return pumpWidget(
      MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => connexionCubit,
          ),
          BlocProvider(
            create: (context) => appBloc,
          ),
        ],
        child: const MaterialApp(home: Scaffold(body: ConnexionView())),
      ),
    );
  }
}

void main() {
  late ConnexionCubit connexionCubit;
  late AppBloc appBloc;

  setUp(() {
    connexionCubit = MockConnexionCubit();
    appBloc = MockAppBloc();
    when(
      () => connexionCubit.submit(),
    ).thenAnswer((invocation) => Future.value());
  });

  testWidgets('Click bouton connexion', (widgetTester) async {
    await widgetTester.pumpConnexionView(
      connexionCubit: connexionCubit,
      appBloc: appBloc,
    );
    await widgetTester.pumpAndSettle();
    await widgetTester.tap(find.byKey(const Key('BoutonConnexion')));
    verify(
      () => connexionCubit.submit(),
    ).called(1);
  });
  testWidgets('Modifie email', (widgetTester) async {
    await widgetTester.pumpConnexionView(
      connexionCubit: connexionCubit,
      appBloc: appBloc,
    );
    await widgetTester.pumpAndSettle();
    await widgetTester.enterText(
      find.byKey(const Key('TextFieldEmail')),
      'test@mail.com',
    );
    verify(
      () => connexionCubit.emailModifier(emailtexte: any(named: 'emailtexte')),
    ).called(1);
  });
  testWidgets('Modifie mot de passe', (widgetTester) async {
    await widgetTester.pumpConnexionView(
      connexionCubit: connexionCubit,
      appBloc: appBloc,
    );
    await widgetTester.pumpAndSettle();
    await widgetTester.enterText(
      find.byKey(const Key('TextFieldMotDePasse')),
      'motdepasse',
    );
    verify(
      () => connexionCubit.motDePasseModifier(
        motDePasseTexte: any(named: 'motDePasseTexte'),
      ),
    ).called(1);
  });
  testWidgets('bouton inscription', (widgetTester) async {
    await widgetTester.pumpConnexionView(
      connexionCubit: connexionCubit,
      appBloc: appBloc,
    );
    await widgetTester.pumpAndSettle();
    await widgetTester.tap(find.byKey(const Key('BoutonInscription')));
    verify(
      () => appBloc.add(
        const GoToInscription(),
      ),
    ).called(1);
  });
}
