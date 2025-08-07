import 'package:persons/src/data/local/persons_database.dart';

class PersonDao {
  PersonDao(this.database);

  final PersonsDatabase database;

  Stream<List<PersonTableData>> observe() => _manager.orderBy((o) => o.name.asc()).watch();

  Future<void> insert(final PersonTableCompanion person) => _manager.create((_) => person);

  $$PersonTableTableTableManager get _manager => database.managers.personTable;
}
