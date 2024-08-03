import 'package:flutter/material.dart';
import 'package:my_customs_v2/presentation/components/custom_view_widget.dart';
import 'package:my_customs_v2/presentation/components/search_bar.dart';
import 'package:my_customs_v2/data/storage/database/db.dart';
import 'package:my_customs_v2/domain/models/my_custom.dart';
import 'package:my_customs_v2/presentation/providers/sort_order_provider.dart';
import 'package:my_customs_v2/presentation/utils/sort_methods.dart';
import 'package:provider/provider.dart';

class CustomsList extends StatefulWidget {
  final int clientId;

  const CustomsList({
    super.key,
    required this.clientId,
  });

  @override
  State<CustomsList> createState() => _CustomsListState();
}

class _CustomsListState extends State<CustomsList> {
  List<MyCustom> _foundCustoms = [];
  final TextEditingController _searchController = TextEditingController();

  final Map<SortOrder, String> _sortOrders = {
    SortOrder.alphabetically: 'По алфавиту',
    SortOrder.ascedingPrice: 'Сначала дешевые',
    SortOrder.descendingPrice: 'Сначала дорогие',
    SortOrder.firstNewer: 'Сначала новые',
    SortOrder.firstOdler: 'Сначала старые',
  };

  @override
  void initState() {
    super.initState();
    context.read<DB>().readCustoms();

    _foundCustoms = context.read<DB>().currentCustoms;

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
        _foundCustoms = db.currentCustoms.where(
          (custom) {
            return custom.name.toLowerCase().contains(
                  query.toLowerCase(),
                );
          },
        ).toList();
      },
    );
  }

  void _sortCustomsNewOrder(SortOrder order) {
    context.read<SortOrderProvider>().setCustomSortOrder(order);
    _sortCustoms(order);
  }

  void _sortCustoms(SortOrder order) {
    setState(() {
      SortMethods.sortCustoms(order, _foundCustoms);
    });
  }

  @override
  Widget build(BuildContext context) {
    final db = context.watch<DB>();

    _sortCustoms(context.read<SortOrderProvider>().customSortOrder);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: DynamicSearchBar(
          searchController: _searchController,
          filterFunc: (query) => _updateSearchQuery(query, db),
          sortFunc: (order) => _sortCustomsNewOrder(order),
          sortOrders: _sortOrders,
          currentSortOrder: context.read<SortOrderProvider>().customSortOrder,
        ),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: _foundCustoms.length,
          itemBuilder: (context, index) {
            final custom = _foundCustoms[index];

            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
              child: GestureDetector(
                onTap: () {
                  // context.read<CustomProvider>().setCustomId(custom.id);
                  context
                      .read<DB>()
                      .addCustomsToClient(widget.clientId, custom.id);

                  Navigator.pop(context);
                },
                child: CustomViewWidget(
                  custom: custom,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
