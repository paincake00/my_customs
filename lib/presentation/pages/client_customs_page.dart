import 'package:flutter/material.dart';
import 'package:my_customs_v2/presentation/components/customs_list.dart';
import 'package:my_customs_v2/data/storage/database/db.dart';
import 'package:my_customs_v2/domain/models/my_custom.dart';
import 'package:my_customs_v2/presentation/tiles/reserved_custom.dart';
import 'package:my_customs_v2/presentation/uikit/theme/context_theme.dart';
import 'package:provider/provider.dart';

class ClientCustomsPage extends StatefulWidget {
  final int clientId;

  const ClientCustomsPage({
    super.key,
    required this.clientId,
  });

  @override
  State<ClientCustomsPage> createState() => _ClientCustomsPageState();
}

class _ClientCustomsPageState extends State<ClientCustomsPage> {
  @override
  void initState() {
    context.read<DB>().readCustomsForClient(widget.clientId);

    super.initState();
  }

  void addCustomsForClient() {
    // final int clientId = widget.clientId;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CustomsList(
          clientId: widget.clientId,
        ),
      ),
    );
  }

  void removeCustomForClient(int customId) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Удаление'),
        content:
            const Text('Вы уверены, что хотите удалить этот заказ у клиента?'),
        actions: [
          MaterialButton(
            color: context.colorScheme.errorContainer,
            onPressed: () {
              context
                  .read<DB>()
                  .removeCustomFromClient(widget.clientId, customId);

              Navigator.pop(context);
            },
            child: const Text('Да'),
          ),
          MaterialButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Нет'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Перейти к клиентам'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addCustomsForClient();
        },
        child: const Icon(Icons.add),
      ),
      body: _buildCustomsForCLientList(),
    );
  }

  Widget _buildCustomsForCLientList() {
    final db = context.watch<DB>();

    List<MyCustom> currentClientCustoms = db.currentClientCustoms;

    return ListView.builder(
      itemCount: currentClientCustoms.length,
      itemBuilder: (context, index) {
        final custom = currentClientCustoms[index];

        return ReservedCustom(
          custom: custom,
          removeCustomForClient: (context) => removeCustomForClient(custom.id),
        );
      },
    );
  }
}
