import 'package:isar/isar.dart';

part 'my_material.g.dart';

@collection
class MyMaterial {
  Id id = Isar.autoIncrement;
  late int purchaseId;
  late int customId;
  late String name;
  late double count;
  late String measure;
  late double cost;
}
