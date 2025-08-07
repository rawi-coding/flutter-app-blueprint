import 'package:persons/src/model/person.dart';

abstract class PersonsLocalRepo {
  const PersonsLocalRepo._();

  Stream<List<Person>> personsStream();

  Future<void> add(Person person);
}
