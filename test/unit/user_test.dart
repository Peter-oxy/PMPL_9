import 'package:flutter_test/flutter_test.dart';
import 'package:pmpl_9/models/user.dart';

void main(){
  group('User Model', () {
      test('fromJson return valid user', () {
        final json = {
          'id' : '1',
          'name' : 'Budi',
          'email' : 'budi@gmail.com'
        };

        final user = User.fromJson(json);

        expect(user.id, '1');
        expect(user.name, 'Budi');
        expect(user.email, 'budi@gmail.com');
      });


       test('toJson return correct map', () {
        const user  = User (
          id : '1',
          name : 'Budi',
          email : 'budi@gmail.com',
        );

        expect(user.toJson(), {
          'id' : '1',
          'name' : 'Budi',
          'email' : 'budi@gmail.com',
        });
  });
  });

  group('User Model', () {
    test('fromJson -> toJson bersifat simetris (round-trip)', (){
      final json = {
        'id' : '2',
        'name' : 'Ani',
        'email' : 'ani@gmail.com'
    };
  
      final user = User.fromJson(json);
      expect(user.toJson(), json);
    });

    test('equality dua user dengan field sama dianggap sama',() {
      const a = User(id: '1', name: 'Budi', email: 'budi@gmail.com');
      const b = User(id: '1', name: 'Budi', email: 'budi@gmail.com');

      expect(a, equals(b));
      expect(a.hashCode, equals(b.hashCode));
    });
  });

  group('User Model', () {
    test('copyWith mengubah field yang dipilih saja', () {
      const user = User(
        id: '1', 
        name: 'Budi', 
        email: 'budi@gmail.com'
        );

        final renamed = user.copyWith(
          name: 'Budi Santoso'
          );

          expect(renamed.id, '1');
          expect(renamed.name, 'Budi Santoso');
          expect(renamed.email, 'budi@gmail.com');
    });
  });
}