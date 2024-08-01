import 'package:flutter/material.dart';
import 'package:my_customs_v2/components/purchase_view_widget.dart';
import 'package:my_customs_v2/components/search_bar.dart';
import 'package:my_customs_v2/database/db.dart';
import 'package:my_customs_v2/models/my_purchase.dart';
import 'package:my_customs_v2/providers/sort_order_provider.dart';
import 'package:my_customs_v2/utils/sort_methods.dart';
import 'package:provider/provider.dart';

class ArchivedPurchase extends StatefulWidget {
  const ArchivedPurchase({super.key});

  @override
  State<ArchivedPurchase> createState() => _ArchivedPurchaseState();
}

class _ArchivedPurchaseState extends State<ArchivedPurchase> {
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
    context.read<DB>().readPurchases();

    _foundPurchases = context.read<DB>().archivedPurchases;

    _searchController.text = '';
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _updateSearchQuery(String query, DB db) {
    setState(
      () {
        _searchController.text = query;
        _foundPurchases = db.archivedPurchases.where(
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
        centerTitle: true,
        title: DynamicSearchBar(
          searchController: _searchController,
          filterFunc: (query) => _updateSearchQuery(query, db),
          sortFunc: (order) => _sortPurchasesNewOrder(order),
          sortOrders: _sortOrders,
          currentSortOrder: context.read<SortOrderProvider>().purchaseSortOrder,
        ),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: _foundPurchases.length,
          itemBuilder: (context, index) {
            final purchase = _foundPurchases[index];

            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
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
                        purchase.isArchived = false;

                        context.read<DB>().updatePurchase(purchase);
                      },
                      icon: const Icon(
                        Icons.unarchive_outlined,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
