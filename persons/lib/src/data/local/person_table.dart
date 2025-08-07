import 'package:drift/drift.dart';
import 'package:persons/src/data/local/persons_database.dart';
import 'package:persons/src/model/person.dart';

class PersonTable extends Table {
  late final id = integer().autoIncrement()();
  late final name = text()();
  late final email = text()();
}

// extensions

extension PersonTableDataListX on List<PersonTableData> {
  List<Person> toPersons() => map((data) => data.toPerson()).toList();
}

extension PersonTableDataX on PersonTableData {
  Person toPerson() => Person(name: name, email: email);
}

extension PersonDriftMapperX on Person {
  PersonTableCompanion toCompanion({int? id}) {
    return PersonTableCompanion.insert(
      id: id != null ? Value(id) : const Value.absent(),
      name: name,
      email: email,
    );
  }
}
