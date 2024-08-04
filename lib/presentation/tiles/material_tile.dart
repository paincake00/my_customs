import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:my_customs_v2/domain/models/my_material.dart';
import 'package:my_customs_v2/presentation/uikit/theme/context_theme.dart';

class MaterialTile extends StatelessWidget {
  final MyMaterial material;
  final void Function(BuildContext)? deleteMaterial;

  const MaterialTile({
    super.key,
    required this.material,
    required this.deleteMaterial,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteMaterial,
              backgroundColor: context.colorScheme.errorContainer,
              icon: Icons.delete,
              borderRadius: BorderRadius.circular(8),
            ),
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
            // color: context.colorScheme.primary,
            gradient: LinearGradient(
              colors: [
                context.colorScheme.primary,
                context.colorScheme.onPrimary,
              ],
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                title: Text(
                  'Название: ${material.name}\n'
                  'Количество: ${material.count} ${material.measure}\n'
                  'Стоимость: ${material.cost} руб.\n',
                  style: TextStyle(
                    color: context.colorScheme.secondary,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
