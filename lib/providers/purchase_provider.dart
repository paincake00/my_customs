import 'package:flutter/material.dart';
import 'package:my_customs_v2/models/my_purchase.dart';

class PurchaseProvider with ChangeNotifier {
  MyPurchase? _purchase;

  MyPurchase? get purchase => _purchase;

  void setPurchase(MyPurchase? purchase) {
    _purchase = purchase;
    notifyListeners();
  }
}
