import 'package:meta/meta.dart';

@sealed
@immutable
class Person {
  const Person({required this.name, required this.email});

  final String name;
  final String email;
}
