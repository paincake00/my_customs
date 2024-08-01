import 'package:flutter/material.dart';
import 'package:my_customs_v2/components/sort_option.dart';
import 'package:my_customs_v2/providers/sort_order_provider.dart';

class DynamicSearchBar extends StatelessWidget {
  final TextEditingController _searchController;
  final void Function(String) _filterFunc;
  final void Function(SortOrder) _sortFunc;
  final Map<SortOrder, String> _sortOrders;
  final SortOrder _currentSortOrder;

  const DynamicSearchBar({
    super.key,
    required TextEditingController searchController,
    required void Function(String) filterFunc,
    required void Function(SortOrder) sortFunc,
    required Map<SortOrder, String> sortOrders,
    required SortOrder currentSortOrder,
  })  : _searchController = searchController,
        _filterFunc = filterFunc,
        _sortFunc = sortFunc,
        _sortOrders = sortOrders,
        _currentSortOrder = currentSortOrder;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerRight,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: TextField(
            controller: _searchController,
            onChanged: _filterFunc,
            cursorColor: Colors.black,
            decoration: const InputDecoration(
              hintText: 'Введите название',
              border: InputBorder.none,
              hintStyle: TextStyle(color: Colors.grey),
            ),
            style: const TextStyle(color: Colors.black, fontSize: 16.0),
          ),
        ),
        SortOption(
          sortFunc: _sortFunc,
          sortOrders: _sortOrders,
          currentSortOrder: _currentSortOrder,
        ),
      ],
    );
  }
}
