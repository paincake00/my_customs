import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_customs_v2/components/search_bar.dart';
import 'package:my_customs_v2/database/db.dart';
import 'package:my_customs_v2/models/my_purchase.dart';
import 'package:my_customs_v2/providers/sort_order_provider.dart';
import 'package:my_customs_v2/tiles/purchase_tile.dart';
import 'package:my_customs_v2/utils/sort_methods.dart';
import 'package:provider/provider.dart';

class PurchasesPage extends StatefulWidget {
  const PurchasesPage({super.key});

  @override
  State<PurchasesPage> createState() => _PurchasesPageState();
}

class _PurchasesPageState extends State<PurchasesPage> {
  List<MyPurchase> _foundPurchases = [];
  final TextEditingController _searchController = TextEditingController();

  final Map<SortOrder, String> _sortOrders = {
    SortOrder.alphabetically: 'По алфавиту',
    SortOrder.ascedingPrice: 'По возрастанию цены',
    SortOrder.descendingPrice: 'По убыванию цены',
    SortOrder.ascedingCount: 'По возрастанию количества',
    SortOrder.descendingCount: 'По убыванию количества',
  };

  @override
  void initState() {
    super.initState();
    // read all purchases from database
    context.read<DB>().readPurchases();

    _foundPurchases = context.read<DB>().currentPurchases;

    _searchController.text = '';
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _countController = TextEditingController();
  final TextEditingController _measureController = TextEditingController();
  final TextEditingController _marketController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

  // TO-DO: make methods for purchase
  void createNewPurchase() {
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
                decoration: const InputDecoration(hintText: 'Название'),
              ),
              TextField(
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                      RegExp(r'^[0-9]+[.]?[0-9]*$')),
                ],
                controller: _countController,
                decoration: const InputDecoration(hintText: 'Количество'),
              ),
              TextField(
                controller: _measureController,
                decoration: const InputDecoration(hintText: 'Мера измерения'),
              ),
              TextField(
                controller: _marketController,
                decoration: const InputDecoration(hintText: 'Магазин'),
              ),
              TextField(
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                      RegExp(r'^[0-9]+[.]?[0-9]*$')),
                ],
                controller: _priceController,
                decoration: const InputDecoration(hintText: 'Цена (руб.)'),
              ),
            ],
          ),
        ),
        actions: [
          MaterialButton(
            onPressed: () {
              final name = _nameController.text;
              final count = _countController.text;
              final measure = _measureController.text;
              final market = _marketController.text;
              final price = _priceController.text;

              // check if any field is empty
              if (name.isEmpty ||
                  count.isEmpty ||
                  measure.isEmpty ||
                  market.isEmpty ||
                  price.isEmpty) {
                return;
              }

              MyPurchase purchase = MyPurchase()
                ..name = name
                ..count = double.parse(count)
                ..measure = measure
                ..market = market
                ..price = double.parse(price);

              context.read<DB>().addPurchase(purchase);

              Navigator.pop(context);

              _nameController.clear();
              _countController.clear();
              _measureController.clear();
              _marketController.clear();
              _priceController.clear();
            },
            child: const Text('Создать'),
          ),
          MaterialButton(
            onPressed: () {
              Navigator.pop(context);

              _nameController.clear();
              _countController.clear();
              _measureController.clear();
              _marketController.clear();
              _priceController.clear();
            },
            child: const Text('Отмена'),
          ),
        ],
      ),
    );
  }

  void editPurchase(MyPurchase purchase) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: SingleChildScrollView(
          reverse: true,
          padding: const EdgeInsets.all(32),
          child: Column(
            children: [
              TextField(
                controller: _nameController..text = purchase.name,
                decoration: const InputDecoration(hintText: 'Название'),
              ),
              TextField(
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                      RegExp(r'^[0-9]+[.]?[0-9]*$')),
                ],
                controller: _countController..text = purchase.count.toString(),
                decoration: const InputDecoration(hintText: 'Количество'),
              ),
              TextField(
                controller: _measureController..text = purchase.measure,
                decoration: const InputDecoration(hintText: 'Мера измерения'),
              ),
              TextField(
                controller: _marketController..text = purchase.market,
                decoration: const InputDecoration(hintText: 'Магазин'),
              ),
              TextField(
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                      RegExp(r'^[0-9]+[.]?[0-9]*$')),
                ],
                controller: _priceController..text = purchase.price.toString(),
                decoration: const InputDecoration(hintText: 'Цена'),
              ),
            ],
          ),
        ),
        actions: [
          MaterialButton(
            onPressed: () {
              double usedCount = purchase.count - purchase.balance;

              final name = _nameController.text;
              final count = _countController.text;
              final measure = _measureController.text;
              final market = _marketController.text;
              final price = _priceController.text;

              if (name.isEmpty ||
                  count.isEmpty ||
                  measure.isEmpty ||
                  market.isEmpty ||
                  price.isEmpty) {
                return;
              }

              purchase.name = name;
              purchase.count = double.parse(count);
              purchase.balance = double.parse(count) - usedCount;
              purchase.measure = measure;
              purchase.market = market;
              purchase.price = double.parse(price);

              context.read<DB>().updatePurchase(purchase);

              Navigator.pop(context);

              _nameController.clear();
              _countController.clear();
              _measureController.clear();
              _marketController.clear();
              _priceController.clear();
            },
            child: const Text('Обновить'),
          ),
          MaterialButton(
            onPressed: () {
              Navigator.pop(context);

              _nameController.clear();
              _countController.clear();
              _measureController.clear();
              _marketController.clear();
              _priceController.clear();
            },
            child: const Text('Отмена'),
          ),
        ],
      ),
    );
  }

  void deletePurchase(MyPurchase purchase) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Удаление'),
        content: const Text('Вы уверены, что хотите удалить эту закупку?'),
        actions: [
          MaterialButton(
            color: Colors.red,
            onPressed: () {
              context.read<DB>().deletePurchase(purchase.id);

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
        _foundPurchases = db.currentPurchases.where(
          (purchase) {
            return purchase.name.toLowerCase().contains(
                  query.toLowerCase(),
                );
          },
        ).toList();
      },
    );
  }

  void _sortPurchasesNewOrder(SortOrder order) {
    context.read<SortOrderProvider>().setPurchaseSortOrder(order);
    _sortPurchases(order);
  }

  void _sortPurchases(SortOrder order) {
    setState(() {
      SortMethods.sortPurchases(order, _foundPurchases);
    });
  }

  @override
  Widget build(BuildContext context) {
    final db = context.watch<DB>();

    _sortPurchases(context.read<SortOrderProvider>().purchaseSortOrder);

    return Scaffold(
      appBar: AppBar(
        title: DynamicSearchBar(
          searchController: _searchController,
          filterFunc: (query) => _updateSearchQuery(query, db),
          sortFunc: (order) => _sortPurchasesNewOrder(order),
          sortOrders: _sortOrders,
          currentSortOrder: context.read<SortOrderProvider>().purchaseSortOrder,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewPurchase,
        child: const Icon(Icons.add),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: _foundPurchases.length,
          itemBuilder: (context, index) {
            final purchase = _foundPurchases[index];

            return PurchaseTile(
              purchase: purchase,
              editPurchase: (context) => editPurchase(purchase),
              deletePurchase: (context) => deletePurchase(purchase),
            );
          },
        ),
      ),
    );
  }
}
