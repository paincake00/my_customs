import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:my_customs_v2/presentation/components/purchase_view_widget.dart';
import 'package:my_customs_v2/data/storage/database/db.dart';
import 'package:my_customs_v2/domain/models/my_purchase.dart';
import 'package:my_customs_v2/presentation/uikit/theme/context_theme.dart';
import 'package:provider/provider.dart';

class PurchaseTile extends StatelessWidget {
  final MyPurchase purchase;
  final void Function(BuildContext)? editPurchase;
  final void Function(BuildContext)? deletePurchase;

  const PurchaseTile({
    super.key,
    required this.purchase,
    required this.editPurchase,
    required this.deletePurchase,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
      child: Slidable(
        startActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: editPurchase,
              backgroundColor: context.colorScheme.tertiary,
              icon: Icons.settings,
              borderRadius: BorderRadius.circular(8),
            ),
          ],
        ),
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deletePurchase,
              backgroundColor: context.colorScheme.errorContainer,
              icon: Icons.delete,
              borderRadius: BorderRadius.circular(8),
            ),
          ],
        ),
        child: Stack(
          children: [
            PurchaseViewWidget(
              purchase: purchase,
            ),
            Positioned(
              right: 10,
              top: 10,
              child: IconButton(
                onPressed: () {
                  purchase.isArchived = true;

                  context.read<DB>().updatePurchase(purchase);
                },
                icon: Icon(
                  Icons.archive_outlined,
                  color: context.colorScheme.secondary,
                  size: 30,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
