import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:my_customs_v2/presentation/components/custom_view_widget.dart';
import 'package:my_customs_v2/data/storage/database/db.dart';
import 'package:my_customs_v2/domain/models/my_custom.dart';
import 'package:my_customs_v2/presentation/pages/materials_page.dart';
import 'package:my_customs_v2/presentation/uikit/theme/context_theme.dart';
import 'package:provider/provider.dart';

class CustomTile extends StatelessWidget {
  final MyCustom custom;
  final void Function(BuildContext)? editCustom;
  final void Function(BuildContext)? deleteCustom;

  const CustomTile({
    super.key,
    required this.custom,
    required this.editCustom,
    required this.deleteCustom,
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
              onPressed: editCustom,
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
              onPressed: deleteCustom,
              backgroundColor: context.colorScheme.errorContainer,
              icon: Icons.delete,
              borderRadius: BorderRadius.circular(8),
            ),
          ],
        ),
        child: Stack(
          children: [
            CustomViewWidget(
              custom: custom,
            ),
            Positioned(
              right: 10,
              top: 10,
              child: IconButton(
                onPressed: () {
                  context.read<DB>().currentMaterials = [];

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MaterialsPage(custom: custom),
                    ),
                  );
                },
                icon: Icon(
                  Icons.list,
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
