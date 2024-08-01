import 'package:flutter/material.dart';
import 'package:my_customs_v2/models/my_purchase.dart';

class PurchaseViewWidget extends StatelessWidget {
  final MyPurchase purchase;

  const PurchaseViewWidget({
    super.key,
    required this.purchase,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // color: purchase.isArchived
        //     ? Colors.grey
        //     : Theme.of(context).colorScheme.primary,
        gradient: LinearGradient(
          colors: [
            purchase.isArchived ? Colors.grey[500]! : Colors.blue[300]!,
            purchase.isArchived ? Colors.grey[600]! : Colors.blue[400]!,
          ],
        ),
        borderRadius: BorderRadius.circular(8),
        // border: Border.all(color: Colors.black),
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Text(
              'Название: ${purchase.name}\n'
              'Количество: ${purchase.count} ${purchase.measure}\n'
              'Остаток: ${purchase.balance.toStringAsFixed(2)} ${purchase.measure}\n'
              'Магазин: ${purchase.market}\n'
              'Цена закупки: ${purchase.price} руб.',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 12),
            child: Divider(
              thickness: 1,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              (purchase.isUsed != 0)
                  ? "Создано материалов: ${purchase.isUsed}"
                  : "Не используется",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
