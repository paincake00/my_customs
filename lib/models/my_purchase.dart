import 'package:isar/isar.dart';

part 'my_purchase.g.dart';

@collection
class MyPurchase {
  Id id = Isar.autoIncrement;
  late String name; // name is not defined
  late double count;
  late String measure;
  late String market;
  late double price;
  bool isArchived = false;
  int isUsed = 0;
  late double balance = count;
}
