import 'package:isar/isar.dart';

part 'my_custom.g.dart';

@collection
class MyCustom {
  Id id = Isar.autoIncrement;
  late String name;
  String? imageName;
  late double selfCost;
  late double cost;
  late String date;
  int isUsed = 0;
  MaterialList materialList = MaterialList();
}

// ADD List<int> in embedded class

@embedded
class MaterialList {
  List<int> materials = [];
}
