import 'package:flutter/material.dart';
import 'package:my_customs_v2/presentation/components/sort_option.dart';
import 'package:my_customs_v2/presentation/providers/sort_order_provider.dart';
import 'package:my_customs_v2/presentation/uikit/theme/context_theme.dart';

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
            color: context.colorScheme.onSurface,
            border: Border.all(color: context.colorScheme.onTertiaryContainer),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: TextField(
            controller: _searchController,
            onChanged: _filterFunc,
            cursorColor: context.colorScheme.onTertiaryContainer,
            decoration: InputDecoration(
              hintText: 'Введите название',
              border: InputBorder.none,
              hintStyle: TextStyle(color: context.colorScheme.tertiary),
            ),
            style: TextStyle(
                color: context.colorScheme.onTertiaryContainer, fontSize: 16.0),
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
