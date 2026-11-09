import 'package:flutter_test/flutter_test.dart';
import 'package:pmpl_9/repositories/auth_repository.dart';
import 'package:pmpl_9/services/auth_service.dart';

void main() {
  late AuthRepository repository;

  setUp(() {
    repository = AuthRepository(
      FakeAuthService(
        users: const {'budi@gmail.com': 'rahasia123'},
        delay: Duration.zero,
      ),
    );
  });

  group('AuthRepository.login', () {
    test('email & password benar -> return user', () async {
      final user = await repository.login(
        'budi@gmail.com', 
        'rahasia123'
        );
      expect(user.name, 'Budi');
      expect(user.email, 'budi@gmail.com');
    });

    group('AuthRepository.login',() {
      test('password salah -> throw AuthException', () async {
        expect( 
          () => repository.login('budi@gmail.com', 'salah'),
          throwsA(
            isA<AuthException>().having(
            (e) => e.message, 
             'message',  
            'Password salah',
          ),
        ),
        );
      });

      test('email tidak terdaftar -> throw AuthException', () async {
        expect(
          () => repository.login('unknown@gmail.com', 'rahasia123'),
          throwsA(
            isA<AuthException>()),
        );
    });
  });
  });
}