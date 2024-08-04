import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:my_customs_v2/data/storage/database/db.dart';
import 'package:my_customs_v2/domain/models/my_client.dart';
import 'package:my_customs_v2/presentation/pages/client_customs_page.dart';
import 'package:my_customs_v2/presentation/uikit/theme/context_theme.dart';
import 'package:provider/provider.dart';

class ClientTile extends StatelessWidget {
  final MyClient client;
  final void Function(BuildContext)? editClient;
  final void Function(BuildContext)? deleteClient;

  const ClientTile({
    super.key,
    required this.client,
    required this.editClient,
    required this.deleteClient,
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
              onPressed: editClient,
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
              onPressed: deleteClient,
              backgroundColor: context.colorScheme.errorContainer,
              icon: Icons.delete,
              borderRadius: BorderRadius.circular(8),
            ),
          ],
        ),
        child: Stack(
          children: [
            Container(
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
              child: ListTile(
                title: Text(
                  'Имя: ${client.name}\n'
                  'Описание: ${client.description}\n',
                  style: TextStyle(
                    color: context.colorScheme.secondary,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Positioned(
              right: 10,
              top: 10,
              child: IconButton(
                onPressed: () {
                  context.read<DB>().currentClientCustoms = [];

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ClientCustomsPage(clientId: client.id),
                    ),
                  );
                },
                icon: Icon(
                  Icons.local_mall_rounded,
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
