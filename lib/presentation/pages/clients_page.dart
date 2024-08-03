import 'package:flutter/material.dart';
import 'package:my_customs_v2/presentation/components/search_bar.dart';
import 'package:my_customs_v2/data/storage/database/db.dart';
import 'package:my_customs_v2/domain/models/my_client.dart';
import 'package:my_customs_v2/presentation/providers/sort_order_provider.dart';
import 'package:my_customs_v2/presentation/tiles/client_tile.dart';
import 'package:my_customs_v2/presentation/uikit/theme/context_theme.dart';
import 'package:my_customs_v2/presentation/utils/sort_methods.dart';
import 'package:provider/provider.dart';

class ClientsPage extends StatefulWidget {
  const ClientsPage({super.key});

  @override
  State<ClientsPage> createState() => _ClientsPageState();
}

class _ClientsPageState extends State<ClientsPage> {
  List<MyClient> _foundClients = [];
  final TextEditingController _searchController = TextEditingController();

  final Map<SortOrder, String> _sortOrders = {
    SortOrder.alphabetically: 'По алфавиту',
  };

  @override
  void initState() {
    super.initState();
    context.read<DB>().readClients();

    _foundClients = context.read<DB>().currentClients;

    _searchController.text = '';
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();

  void createNewClient() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: SingleChildScrollView(
          reverse: true,
          padding: const EdgeInsets.all(32),
          child: Column(
            children: [
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(hintText: 'Имя клиента'),
              ),
              TextField(
                controller: _descriptionController,
                decoration: const InputDecoration(hintText: 'Описание'),
              ),
            ],
          ),
        ),
        actions: [
          MaterialButton(
            onPressed: () {
              final name = _nameController.text;
              final description = _descriptionController.text;

              if (name.isEmpty || description.isEmpty) {
                return;
              }

              final client = MyClient()
                ..name = name
                ..description = description;

              context.read<DB>().addClient(client);

              Navigator.pop(context);

              _nameController.clear();
              _descriptionController.clear();
            },
            child: const Text('Создать'),
          ),
          MaterialButton(
            onPressed: () {
              Navigator.pop(context);

              _nameController.clear();
              _descriptionController.clear();
            },
            child: const Text('Отмена'),
          ),
        ],
      ),
    );
  }

  void editClient(MyClient client) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: SingleChildScrollView(
          reverse: true,
          padding: const EdgeInsets.all(32),
          child: Column(
            children: [
              TextField(
                controller: _nameController..text = client.name,
                decoration: const InputDecoration(hintText: 'Имя клиента'),
              ),
              TextField(
                controller: _descriptionController..text = client.description,
                decoration: const InputDecoration(hintText: 'Описание'),
              ),
            ],
          ),
        ),
        actions: [
          MaterialButton(
            onPressed: () {
              final name = _nameController.text;
              final description = _descriptionController.text;

              if (name.isEmpty || description.isEmpty) {
                return;
              }

              client.name = name;
              client.description = description;

              context.read<DB>().updateClient(client);

              Navigator.pop(context);

              _nameController.clear();
              _descriptionController.clear();
            },
            child: const Text('Обновить'),
          ),
          MaterialButton(
            onPressed: () {
              Navigator.pop(context);

              _nameController.clear();
              _descriptionController.clear();
            },
            child: const Text('Отмена'),
          ),
        ],
      ),
    );
  }

  void deleteClient(MyClient client) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Удаление'),
        content: const Text('Вы уверены, что хотите удалить этого клиента?'),
        actions: [
          MaterialButton(
            color: context.colorScheme.errorContainer,
            onPressed: () {
              context.read<DB>().deleteClient(client.id);

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

  void _updateSearchQuery(String query, DB db) {
    setState(
      () {
        _searchController.text = query;
        _foundClients = db.currentClients.where(
          (client) {
            return client.name.toLowerCase().contains(
                  query.toLowerCase(),
                );
          },
        ).toList();
      },
    );
  }

  void _sortClientsNewOrder(SortOrder order) {
    context.read<SortOrderProvider>().setClientSortOrder(order);
    _sortClients(order);
  }

  void _sortClients(SortOrder order) {
    setState(() {
      SortMethods.sortClients(order, _foundClients);
    });
  }

  @override
  Widget build(BuildContext context) {
    final db = context.watch<DB>();

    _sortClients(context.read<SortOrderProvider>().clientSortOrder);

    return Scaffold(
      appBar: AppBar(
        title: DynamicSearchBar(
          searchController: _searchController,
          filterFunc: (query) => _updateSearchQuery(query, db),
          sortFunc: (order) => _sortClientsNewOrder(order),
          sortOrders: _sortOrders,
          currentSortOrder: context.read<SortOrderProvider>().clientSortOrder,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewClient,
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: _foundClients.length,
        itemBuilder: (context, index) {
          final client = _foundClients[index];

          return ClientTile(
            client: client,
            editClient: (context) => editClient(client),
            deleteClient: (context) => deleteClient(client),
          );
        },
      ),
    );
  }
}
