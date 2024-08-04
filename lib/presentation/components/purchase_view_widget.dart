import 'package:flutter/material.dart';
import 'package:my_customs_v2/domain/models/my_purchase.dart';
import 'package:my_customs_v2/presentation/uikit/theme/context_theme.dart';

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
            purchase.isArchived
                ? context.colorScheme.error
                : context.colorScheme.primary,
            purchase.isArchived
                ? context.colorScheme.onError
                : context.colorScheme.onPrimary,
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
              style: TextStyle(
                color: context.colorScheme.secondary,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
            child: Divider(
              thickness: 1,
              color: context.colorScheme.secondary,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              (purchase.isUsed != 0)
                  ? "Создано материалов: ${purchase.isUsed}"
                  : "Не используется",
              style: TextStyle(
                color: context.colorScheme.secondary,
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
