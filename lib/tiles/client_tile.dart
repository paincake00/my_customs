import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:my_customs_v2/database/db.dart';
import 'package:my_customs_v2/models/my_client.dart';
import 'package:my_customs_v2/pages/client_customs_page.dart';
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
              backgroundColor: Colors.grey.shade800,
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
              backgroundColor: Colors.red,
              icon: Icons.delete,
              borderRadius: BorderRadius.circular(8),
            ),
          ],
        ),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.all(12),
              child: ListTile(
                title: Text(
                  'Имя: ${client.name}\n'
                  'Описание: ${client.description}\n',
                  style: const TextStyle(
                    color: Colors.white,
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
                icon: const Icon(
                  Icons.local_mall_rounded,
                  color: Colors.white,
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
