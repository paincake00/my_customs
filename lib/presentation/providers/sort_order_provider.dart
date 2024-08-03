import 'package:flutter/material.dart';

class SortOrderProvider with ChangeNotifier {
  SortOrder _purchaseSortOrder = SortOrder.alphabetically;
  SortOrder _customSortOrder = SortOrder.alphabetically;
  SortOrder _clientSortOrder = SortOrder.alphabetically;

  SortOrder get purchaseSortOrder => _purchaseSortOrder;
  SortOrder get customSortOrder => _customSortOrder;
  SortOrder get clientSortOrder => _clientSortOrder;

  void setPurchaseSortOrder(SortOrder sortOrder) {
    _purchaseSortOrder = sortOrder;
  }

  void setCustomSortOrder(SortOrder sortOrder) {
    _customSortOrder = sortOrder;
  }

  void setClientSortOrder(SortOrder sortOrder) {
    _clientSortOrder = sortOrder;
  }
}

enum SortOrder {
  alphabetically(Icons.text_rotate_vertical_outlined),
  ascedingPrice(Icons.price_change),
  descendingPrice(Icons.price_change_outlined),
  ascedingCount(Icons.arrow_circle_up_outlined),
  descendingCount(Icons.arrow_circle_down_outlined),
  firstNewer(Icons.fiber_new),
  firstOdler(Icons.fiber_new_outlined);

  final IconData key;

  const SortOrder(this.key);
}
