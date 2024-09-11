import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:park_i_t/utils/theme.dart';
import 'package:park_i_t/index.dart';
import 'package:park_i_t/main.dart';
import 'package:park_i_t/utils/util.dart';

import 'package:provider/provider.dart';
import 'package:park_i_t/backend/firebase/firebase_config.dart';
import 'package:park_i_t/auth/firebase_auth/auth_util.dart';

void main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    _overrideOnError();
    await initFirebase();

    await FFTheme.initialize();
  });

  setUp(() async {
    await authManager.signOut();
    FFAppState.reset();
    final appState = FFAppState();
    await appState.initializePersistedState();
  });

  testWidgets('Login', (WidgetTester tester) async {
    await tester.pumpWidget(ChangeNotifierProvider(
      create: (context) => FFAppState(),
      child: const MyApp(
        entryPage: LoginWidget(),
      ),
    ));

    await tester.tap(find.byKey(const ValueKey('emailAddress_92zj')));
    await tester.enterText(
        find.byKey(const ValueKey('emailAddress_92zj')), 'cianquigley16@gmail.com');
    await tester.tap(find.byKey(const ValueKey('selenium-password_u8zc')));
    await tester.enterText(
        find.byKey(const ValueKey('selenium-password_u8zc')), '123123');
    await tester.tap(find.byKey(const ValueKey('Button_c7ax')));
    await tester.pumpAndSettle(const Duration(milliseconds: 3000));
    expect(find.byKey(const ValueKey('cardTable_6_mrrb')), findsOneWidget);
  });

  testWidgets('editProfile', (WidgetTester tester) async {
    await tester.pumpWidget(ChangeNotifierProvider(
      create: (context) => FFAppState(),
      child: const MyApp(
        entryPage: EditProfileWidget(),
      ),
    ));

    await tester.pumpAndSettle(const Duration(milliseconds: 3000));
    await tester.enterText(
        find.byKey(const ValueKey('TextField_7ufk')), 'John Appleseed');
    await tester.enterText(
        find.byKey(const ValueKey('TextField_g2mk')), '0862356612');
    await tester.tap(find.byKey(const ValueKey('Row_xlvp')));
    await tester.pumpAndSettle(const Duration(milliseconds: 3000));
    expect(find.byKey(const ValueKey('TextField_7ufk')), findsNothing);
  });

  testWidgets('failedlogin', (WidgetTester tester) async {
    await tester.pumpWidget(ChangeNotifierProvider(
      create: (context) => FFAppState(),
      child: const MyApp(
        entryPage: LoginWidget(),
      ),
    ));

    await tester.tap(find.byKey(const ValueKey('emailAddress_92zj')));
    await tester.enterText(
        find.byKey(const ValueKey('emailAddress_92zj')), 'cianquigley16@gmail.com');
    await tester.tap(find.byKey(const ValueKey('selenium-password_u8zc')));
    await tester.enterText(
        find.byKey(const ValueKey('selenium-password_u8zc')), '12312');
    await tester.pumpAndSettle(const Duration(milliseconds: 4000));
    expect(find.byKey(const ValueKey('emailAddress_92zj')), findsOneWidget);
  });

  testWidgets('homestack loads', (WidgetTester tester) async {
    await tester.pumpWidget(ChangeNotifierProvider(
      create: (context) => FFAppState(),
      child: const MyApp(
        entryPage: DashboardWidget(),
      ),
    ));

    await tester.pumpAndSettle(const Duration(milliseconds: 2000));
    expect(find.byKey(const ValueKey('Stack_ikb2')), findsOneWidget);
  });
}

// There are certain types of errors that can happen during tests but
// should not break the test.
void _overrideOnError() {
  final originalOnError = FlutterError.onError!;
  FlutterError.onError = (errorDetails) {
    if (_shouldIgnoreError(errorDetails.toString())) {
      return;
    }
    originalOnError(errorDetails);
  };
}

bool _shouldIgnoreError(String error) {
  // It can fail to decode some SVGs - this should not break the test.
  if (error.contains('ImageCodecException')) {
    return true;
  }
  // Overflows happen all over the place,
  // but they should not break tests.
  if (error.contains('overflowed by')) {
    return true;
  }
  // Sometimes some images fail to load, it generally does not break the test.
  if (error.contains('No host specified in URI') ||
      error.contains('EXCEPTION CAUGHT BY IMAGE RESOURCE SERVICE')) {
    return true;
  }
  // These errors should be avoided, but they should not break the test.
  if (error.contains('setState() called after dispose()')) {
    return true;
  }

  return false;
}
