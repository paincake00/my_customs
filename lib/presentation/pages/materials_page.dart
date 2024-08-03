import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_customs_v2/presentation/components/purchases_list.dart';
import 'package:my_customs_v2/data/storage/database/db.dart';
import 'package:my_customs_v2/domain/models/my_custom.dart';
import 'package:my_customs_v2/domain/models/my_material.dart';
import 'package:my_customs_v2/domain/models/my_purchase.dart';
import 'package:my_customs_v2/presentation/providers/purchase_provider.dart';
import 'package:my_customs_v2/presentation/tiles/material_tile.dart';
import 'package:my_customs_v2/presentation/uikit/theme/context_theme.dart';
import 'package:provider/provider.dart';

class MaterialsPage extends StatefulWidget {
  final MyCustom custom;

  const MaterialsPage({super.key, required this.custom});

  @override
  State<MaterialsPage> createState() => _MaterialsPageState();
}

class _MaterialsPageState extends State<MaterialsPage> {
  @override
  void initState() {
    // context.read<DB>().readMaterials(context.read<CustomProvider>().customId);
    // context.read<DB>().readMaterials(context.read<CustomProvider>().custom);
    context.read<DB>().readMaterials(widget.custom.id);

    super.initState();
  }

  final TextEditingController _countController = TextEditingController();
  final TextEditingController _measureController = TextEditingController();
  // final TextEditingController _costController = TextEditingController();

  void createNewMaterial() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: SingleChildScrollView(
          reverse: true,
          padding: const EdgeInsets.all(32),
          // consumer
          child: Consumer<PurchaseProvider>(
            builder: (context, provider, child) => Column(
              children: [
                Center(
                  child: Text(
                    provider.purchase == null
                        ? 'Закупка не выбрана!'
                        : 'Закупка: ${provider.purchase!.name}',
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PurchasesList(),
                      ),
                    );
                  },
                  child: const Text('Выбрать закупку'),
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
                  controller: provider.purchase == null
                      ? _measureController
                      : (_measureController..text = provider.purchase!.measure),
                  decoration: const InputDecoration(hintText: 'Мера измерения'),
                ),
              ],
            ),
          ),
        ),
        actions: [
          MaterialButton(
            onPressed: () {
              MyPurchase? purchase = context.read<PurchaseProvider>().purchase;

              final count = _countController.text;
              final measure = _measureController.text;

              if (count.isEmpty || measure.isEmpty || purchase == null) {
                return;
              }

              final material = MyMaterial()
                ..customId = widget.custom.id
                ..purchaseId = purchase.id
                ..name = purchase.name
                ..count = double.parse(count)
                ..measure = measure
                ..cost = double.parse(
                    (purchase.price * double.parse(count) / purchase.count)
                        .toStringAsFixed(2));

              context.read<DB>().addMaterial(material);

              // context.read<DB>().readCustoms();
              context.read<PurchaseProvider>().setPurchase(null);

              Navigator.of(context).pop();

              _countController.clear();
              _measureController.clear();
            },
            child: const Text('Создать'),
          ),
          MaterialButton(
            onPressed: () {
              Navigator.of(context).pop();

              context.read<PurchaseProvider>().setPurchase(null);

              _countController.clear();
              _measureController.clear();
            },
            child: const Text('Отмена'),
          ),
        ],
      ),
    );
  }

  void deleteMaterial(MyMaterial material) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Удаление'),
        content: const Text('Вы уверены, что хотите удалить материал?'),
        actions: [
          MaterialButton(
            color: context.colorScheme.errorContainer,
            onPressed: () {
              context.read<DB>().deleteMaterial(material.id);

              // context.read<DB>().readCustoms();

              Navigator.of(context).pop();
            },
            child: const Text('Да'),
          ),
          MaterialButton(
            onPressed: () {
              Navigator.of(context).pop();
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
            context.read<DB>().readCustoms();

            Navigator.pop(context);
          },
          child: const Text(
            'Перейти к заказам',
            // style: TextStyle(
            //   color: Color.fromARGB(255, 142, 36, 170),
            // ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          createNewMaterial();
        },
        child: const Icon(Icons.add),
      ),
      body: _buildMaterialsList(),
    );
  }

  Widget _buildMaterialsList() {
    final db = context.watch<DB>();

    List<MyMaterial> currentMaterials = db.currentMaterials;

    return ListView.builder(
      itemCount: currentMaterials.length,
      itemBuilder: (context, index) {
        final material = currentMaterials[index];

        return MaterialTile(
          material: material,
          deleteMaterial: (context) => deleteMaterial(material),
        );
      },
    );
  }
}
