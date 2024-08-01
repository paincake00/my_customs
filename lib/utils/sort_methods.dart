import 'package:my_customs_v2/models/my_client.dart';
import 'package:my_customs_v2/models/my_custom.dart';
import 'package:my_customs_v2/models/my_purchase.dart';
import 'package:my_customs_v2/providers/sort_order_provider.dart';

class SortMethods {
  static void sortPurchases(SortOrder order, List<MyPurchase> purchases) {
    if (order == SortOrder.alphabetically) {
      purchases.sort((a, b) => a.name.compareTo(b.name));
    } else if (order == SortOrder.ascedingPrice) {
      purchases.sort((a, b) => a.price.compareTo(b.price));
    } else if (order == SortOrder.descendingPrice) {
      purchases.sort((a, b) => b.price.compareTo(a.price));
    } else if (order == SortOrder.ascedingCount) {
      purchases.sort((a, b) => a.count.compareTo(b.count));
    } else if (order == SortOrder.descendingCount) {
      purchases.sort((a, b) => b.count.compareTo(a.count));
    }
  }

  static void sortCustoms(SortOrder order, List<MyCustom> customs) {
    if (order == SortOrder.alphabetically) {
      customs.sort((a, b) => a.name.compareTo(b.name));
    } else if (order == SortOrder.ascedingPrice) {
      customs.sort((a, b) => a.cost.compareTo(b.cost));
    } else if (order == SortOrder.descendingPrice) {
      customs.sort((a, b) => b.cost.compareTo(a.cost));
    } else if (order == SortOrder.firstOdler) {
      customs.sort((a, b) => a.date.compareTo(b.date));
    } else if (order == SortOrder.firstNewer) {
      customs.sort((a, b) => b.date.compareTo(a.date));
    }
  }

  static void sortClients(SortOrder order, List<MyClient> clients) {
    if (order == SortOrder.alphabetically) {
      clients.sort((a, b) => a.name.compareTo(b.name));
    }
  }
}
