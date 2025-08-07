import 'package:persons/src/data/local/person_dao.dart';
import 'package:persons/src/data/local/persons_database.dart';
import 'package:persons/src/data/persons_local_repo.dart';
import 'package:persons/src/data/persons_local_repo_impl.dart';

export 'package:persons/src/data/persons_local_repo.dart';
export 'package:persons/src/model/person.dart';

class PersonsComponent {
  const PersonsComponent._();

  static PersonsLocalRepo createLocalRepo() {
    final database = PersonsDatabase();
    return PersonsLocalRepoImpl(personDao: PersonDao(database));
  }
}
