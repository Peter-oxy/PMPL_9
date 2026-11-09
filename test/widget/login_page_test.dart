import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pmpl_9/pages/login_page.dart';
import 'package:pmpl_9/repositories/auth_repository.dart';
import 'package:pmpl_9/services/auth_service.dart';  

Widget _sut() {
  final repo = AuthRepository(
    FakeAuthService(
      users: const {'budi@gmail.com': 'rahasia123'},
      delay:Duration.zero,
    ),
  );
  return MaterialApp(home: LoginPage(repository: repo));
}

void main() {
  group('LoginPage Wiidget Test', () {
    testWidgets('menampilkan form email, password, dan tombol login', 
    (tester) async {
      await tester.pumpWidget(_sut());

      expect(find.byKey(const Key('emailField')), findsOneWidget);
      expect(find.byKey(const Key('passwordField')), findsOneWidget);
      expect(find.byKey(const Key('loginButton')), findsOneWidget);
    });
  });

  group('LoginPage Widget Test', () {
    testWidgets('tap login saat kosong -> mucul pesan validasi', 
    (tester) async {
      await tester.pumpWidget(_sut());

      await tester.tap(find.byKey(const Key('loginButton')));
      await tester.pump();

      expect(find.text('email tidak boleh kosong'), findsOneWidget);
      expect(find.text('password tidak boleh kosong'), findsOneWidget);
    });

    testWidgets('login sukses -> tampil sapaan',
    (tester) async {
      await tester.pumpWidget(_sut());

      await tester.enterText(find.byKey(const Key('emailField')), 'budi@gmail.com');
      await tester.enterText(find.byKey(const Key('passwordField')), 'rahasia123');
      await tester.tap(find.byKey(const Key('loginButton')));
      await tester.pumpAndSettle();

      expect(find.text('Selamat datang, Budi!'), findsOneWidget);
    });
  });
}
