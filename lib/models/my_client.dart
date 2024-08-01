import 'package:isar/isar.dart';

part 'my_client.g.dart';

@collection
class MyClient {
  Id id = Isar.autoIncrement;
  late String name;
  late String description;
  List<Id> customs = [];
}
