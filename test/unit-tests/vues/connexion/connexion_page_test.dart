import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:memo_car/app/app_bloc.dart';
import 'package:memo_car/models/authentification_repository.dart';
import 'package:memo_car/vues/connexion/connexion_page.dart';
import 'package:memo_car/vues/connexion/connexion_view.dart';
import 'package:memo_car/vues/connexion/cubit/connexion_cubit.dart';
import 'package:mocktail/mocktail.dart';

class MockConnexionCubit extends MockCubit<ConnexionState>
    implements ConnexionCubit {}

class MockAppBloc extends MockBloc<AppEvent, AppState> implements AppBloc {}

class MockAuthentificationRepository extends Mock
    implements AuthentificationRepository {}

extension PumpConnexionPage on WidgetTester {
  Future<void> pumpConnexionPage({
    required ConnexionCubit connexionCubit,
    required AppBloc appBloc,
    required AuthentificationRepository authentificationRepository,
  }) {
    return pumpWidget(
      RepositoryProvider(
        create: (context) => authentificationRepository,
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => connexionCubit,
            ),
            BlocProvider(
              create: (context) => appBloc,
            ),
          ],
          child: MaterialApp(
            home: ConnexionPage(),
          ),
        ),
      ),
    );
  }
}

void main() {
  late ConnexionCubit connexionCubit;
  late AppBloc appBloc;
  late AuthentificationRepository authentificationRepository;

  setUp(() {
    connexionCubit = MockConnexionCubit();
    appBloc = MockAppBloc();
    authentificationRepository = MockAuthentificationRepository();
    when(
      () => connexionCubit.submit(),
    ).thenAnswer((invocation) => Future.value());
  });

  test('est une page', () {
    expect(ConnexionPage.page(), isA<MaterialPage<dynamic>>());
  });
  testWidgets('Page contient vue', (widgetTester) async {
    await widgetTester.pumpConnexionPage(
      connexionCubit: connexionCubit,
      appBloc: appBloc,
      authentificationRepository: authentificationRepository,
    );
    await widgetTester.pumpAndSettle();
    expect(find.byType(ConnexionView), findsOneWidget);
  });
}
