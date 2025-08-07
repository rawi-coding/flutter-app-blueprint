import 'package:logging/logging.dart';
import 'package:persons/component.dart';
import 'package:persons/src/data/local/person_dao.dart';
import 'package:persons/src/data/local/person_table.dart';

final _log = Logger('PersonsLocalRepoImpl');

class PersonsLocalRepoImpl implements PersonsLocalRepo {
  const PersonsLocalRepoImpl({
    required PersonDao personDao,
  }) : _personDao = personDao;

  final PersonDao _personDao;

  @override
  Stream<List<Person>> personsStream() => _personDao.observe().map((entities) => entities.toPersons());

  @override
  Future<void> add(Person person) async {
    try {
      await _personDao.insert(person.toCompanion());
    } catch (e) {
      _log.info('Add person failed.', e);
      rethrow;
    }
  }
}
