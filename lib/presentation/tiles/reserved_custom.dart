import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:my_customs_v2/presentation/components/custom_view_widget.dart';
import 'package:my_customs_v2/domain/models/my_custom.dart';
import 'package:my_customs_v2/presentation/uikit/theme/context_theme.dart';

class ReservedCustom extends StatelessWidget {
  final MyCustom custom;
  final void Function(BuildContext)? removeCustomForClient;

  const ReservedCustom({
    super.key,
    required this.custom,
    required this.removeCustomForClient,
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
              onPressed: removeCustomForClient,
              backgroundColor: context.colorScheme.errorContainer,
              icon: Icons.delete,
              borderRadius: BorderRadius.circular(8),
            ),
          ],
        ),
        child: CustomViewWidget(
          custom: custom,
        ),
      ),
    );
  }
}
