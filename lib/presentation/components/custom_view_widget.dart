import 'package:flutter/material.dart';
import 'package:my_customs_v2/domain/models/my_custom.dart';
import 'package:my_customs_v2/presentation/providers/image_path_provider.dart';
import 'package:my_customs_v2/presentation/uikit/theme/context_theme.dart';
import 'package:my_customs_v2/presentation/utils/image_handler.dart';
import 'package:provider/provider.dart';

class CustomViewWidget extends StatelessWidget {
  final MyCustom custom;

  const CustomViewWidget({super.key, required this.custom});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.colorScheme.primary,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                  border: Border.all(color: context.colorScheme.tertiary)),
              child: ImageHandler.renderImage(
                name: custom.imageName,
                appDirPath: context.read<ImagePathProvider>().appDirPath,
              ),
            ),
          ),
          ListTile(
            title: Text(
              'Название: ${custom.name}\n'
              'Стоимость: ${custom.cost} руб.\n'
              'Себестоимость: ${(custom.selfCost).toStringAsFixed(2)} руб.\n'
              'Выручка: ${(custom.cost - custom.selfCost).toStringAsFixed(2)} руб.\n'
              'Дата: ${(custom.date.split('-')).reversed.join('.')}\n',
              style: TextStyle(
                color: context.colorScheme.secondary,
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
              (custom.isUsed != 0)
                  ? "Заказано клиентами: ${custom.isUsed}"
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
