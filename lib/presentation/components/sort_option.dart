import 'package:flutter/material.dart';
import 'package:my_customs_v2/presentation/providers/sort_order_provider.dart';
import 'package:my_customs_v2/presentation/uikit/theme/context_theme.dart';

class SortOption extends StatelessWidget {
  final void Function(SortOrder) _sortFunc;
  final Map<SortOrder, String> _sortOrders;
  final SortOrder _currentSortOrder;

  const SortOption({
    super.key,
    required void Function(SortOrder) sortFunc,
    required Map<SortOrder, String> sortOrders,
    required SortOrder currentSortOrder,
  })  : _sortFunc = sortFunc,
        _sortOrders = sortOrders,
        _currentSortOrder = currentSortOrder;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => _showSortOptions(context),
      icon: Icon(
        _currentSortOrder.key,
        color: context.colorScheme.onTertiary,
        size: 25,
      ),
    );
  }

  void _showSortOptions(BuildContext context) {
    showModalBottomSheet(
      constraints: BoxConstraints(
        maxHeight: _sortOrders.length * 45 + 25,
      ),
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: _sortOrders.entries
                .map(
                  (entry) => GestureDetector(
                    onTap: () {
                      _sortFunc(entry.key);
                      Navigator.pop(context);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          entry.key.key,
                          color: context.colorScheme.onTertiary,
                        ),
                        const SizedBox(width: 10.0),
                        Text(
                          entry.value,
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
                .toList(),
          ),
        );
      },
    );
  }
}
