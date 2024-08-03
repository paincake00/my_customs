import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_customs_v2/presentation/components/search_bar.dart';
import 'package:my_customs_v2/data/storage/database/db.dart';
import 'package:my_customs_v2/domain/models/my_custom.dart';
import 'package:my_customs_v2/presentation/providers/image_path_provider.dart';
import 'package:my_customs_v2/presentation/providers/sort_order_provider.dart';
import 'package:my_customs_v2/presentation/tiles/custom_tile.dart';
import 'package:my_customs_v2/presentation/uikit/theme/context_theme.dart';
import 'package:my_customs_v2/presentation/utils/image_handler.dart';
import 'package:my_customs_v2/presentation/utils/sort_methods.dart';
import 'package:provider/provider.dart';

class CustomsPage extends StatefulWidget {
  const CustomsPage({super.key});

  @override
  State<CustomsPage> createState() => _CustomsPageState();
}

class _CustomsPageState extends State<CustomsPage> {
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
    // read all customs from database
    context.read<DB>().readCustoms();

    _foundCustoms = context.read<DB>().currentCustoms;

    _searchController.text = '';
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _costController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  void setImageWithinProvider(String? name) {
    context.read<ImagePathProvider>().setImage(name);
  }

  void createNewCustom() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: SingleChildScrollView(
          reverse: true,
          padding: const EdgeInsets.all(32),
          child: Column(
            children: [
              // get image path from the provider and render image
              Selector<ImagePathProvider, String?>(
                selector: (context, provider) => provider.image,
                builder: (context, value, child) => InkWell(
                  onTap: () async {
                    var file = await ImageHandler.pickImageFromGallery(
                      appDirPath: context.read<ImagePathProvider>().appDirPath,
                    );
                    if (file != null) {
                      setImageWithinProvider(file.name);
                    }
                  },
                  child: Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: context.colorScheme.tertiary)),
                    child: ImageHandler.renderImage(
                      name: value,
                      appDirPath: context.read<ImagePathProvider>().appDirPath,
                    ),
                  ),
                ),
              ),
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
                controller: _costController,
                decoration: const InputDecoration(hintText: 'Стоимость'),
              ),
              _TextFieldForDate(
                controller: _dateController,
                onTap: _selectDate,
              ),
            ],
          ),
        ),
        actions: [
          MaterialButton(
            onPressed: () {
              final name = _nameController.text;
              final cost = _costController.text;
              final date = _dateController.text;

              if (name.isEmpty || cost.isEmpty || date.isEmpty) {
                return;
              }

              final custom = MyCustom()
                ..name = name
                ..imageName = context.read<ImagePathProvider>().image
                ..cost = double.parse(cost)
                ..selfCost = 0
                ..date = date;

              context.read<DB>().addCustom(custom);

              context.read<ImagePathProvider>().setImage(null);

              Navigator.pop(context);

              _nameController.clear();
              _costController.clear();
              _dateController.clear();
            },
            child: const Text('Создать'),
          ),
          MaterialButton(
            onPressed: () {
              Navigator.pop(context);

              context.read<ImagePathProvider>().setImage(null);

              _nameController.clear();
              _costController.clear();
              _dateController.clear();
            },
            child: const Text('Отмена'),
          ),
        ],
      ),
    );
  }

  void editCustom(MyCustom custom) {
    setImageWithinProvider(custom.imageName);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: SingleChildScrollView(
          reverse: true,
          padding: const EdgeInsets.all(32),
          child: Column(
            children: [
              Selector<ImagePathProvider, String?>(
                selector: (context, provider) => provider.image,
                builder: (context, value, child) => InkWell(
                  onTap: () async {
                    var file = await ImageHandler.pickImageFromGallery(
                      appDirPath: context.read<ImagePathProvider>().appDirPath,
                    );
                    if (file != null) {
                      setImageWithinProvider(file.name);
                    }
                  },
                  child: Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: context.colorScheme.tertiary)),
                    child: ImageHandler.renderImage(
                      name: value,
                      appDirPath: context.read<ImagePathProvider>().appDirPath,
                    ),
                  ),
                ),
              ),
              TextField(
                controller: _nameController..text = custom.name,
                decoration: const InputDecoration(hintText: 'Название'),
              ),
              TextField(
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                      RegExp(r'^[0-9]+[.]?[0-9]*$')),
                ],
                controller: _costController..text = custom.cost.toString(),
                decoration: const InputDecoration(hintText: 'Стоимость'),
              ),
              _TextFieldForDate(
                controller: _dateController..text = custom.date,
                onTap: _selectDate,
              ),
            ],
          ),
        ),
        actions: [
          MaterialButton(
            onPressed: () {
              final name = _nameController.text;
              final cost = _costController.text;
              final date = _dateController.text;

              if (name.isEmpty || cost.isEmpty || date.isEmpty) {
                return;
              }

              custom.name = name;
              custom.imageName = context.read<ImagePathProvider>().image;
              custom.cost = double.parse(cost);
              custom.date = date;

              context.read<DB>().updateCustom(custom);

              context.read<ImagePathProvider>().setImage(null);

              Navigator.pop(context);

              _nameController.clear();
              _costController.clear();
              _dateController.clear();
            },
            child: const Text('Обновить'),
          ),
          MaterialButton(
            onPressed: () {
              Navigator.pop(context);

              context.read<ImagePathProvider>().setImage(null);

              _nameController.clear();
              _costController.clear();
              _dateController.clear();
            },
            child: const Text('Отмена'),
          ),
        ],
      ),
    );
  }

  void deleteCustom(MyCustom custom) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Удаление'),
        content: const Text('Вы уверены, что хотите удалить этот заказ?'),
        actions: [
          MaterialButton(
            color: context.colorScheme.errorContainer,
            onPressed: () {
              String? imageName = custom.imageName;

              context.read<DB>().deleteCustom(custom.id);

              ImageHandler.deleteImageFormAppDir(
                name: imageName,
                appDirPath: context.read<ImagePathProvider>().appDirPath,
              );

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

  Future<void> _selectDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2150),
    );
    if (pickedDate != null) {
      setState(() {
        _dateController.text = pickedDate.toString().substring(0, 10);
      });
    }
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

    _sortCustoms(context.watch<SortOrderProvider>().customSortOrder);

    return Scaffold(
      appBar: AppBar(
        title: DynamicSearchBar(
          searchController: _searchController,
          filterFunc: (query) => _updateSearchQuery(query, db),
          sortFunc: (order) => _sortCustomsNewOrder(order),
          sortOrders: _sortOrders,
          currentSortOrder: context.read<SortOrderProvider>().customSortOrder,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewCustom,
        child: const Icon(Icons.add),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: _foundCustoms.length,
          itemBuilder: (context, index) {
            final custom = _foundCustoms[index];

            return CustomTile(
              custom: custom,
              editCustom: (context) => editCustom(custom),
              deleteCustom: (context) => deleteCustom(custom),
            );
          },
        ),
      ),
    );
  }
}

class _TextFieldForDate extends StatelessWidget {
  final TextEditingController controller;
  final void Function() onTap;

  const _TextFieldForDate({
    required this.controller,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: TextField(
        controller: controller,
        readOnly: true,
        decoration: InputDecoration(
          hintText: 'Дата',
          prefixIcon: Icon(
            Icons.calendar_today,
            color: context.colorScheme.tertiary,
          ),
          border: OutlineInputBorder(
            borderSide:
                BorderSide(color: context.colorScheme.onTertiaryContainer),
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}
