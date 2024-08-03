import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:isar/isar.dart';
import 'package:my_customs_v2/domain/models/my_client.dart';
import 'package:my_customs_v2/domain/models/my_custom.dart';
import 'package:my_customs_v2/domain/models/my_material.dart';
import 'package:my_customs_v2/domain/models/my_purchase.dart';
import 'package:path_provider/path_provider.dart';

class DB with ChangeNotifier {
  static late Isar isar;

  // I N I T I A L I Z E   I S A R

  static Future<void> initialize() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open(
      [MyPurchaseSchema, MyMaterialSchema, MyCustomSchema, MyClientSchema],
      directory: dir.path,
    );
  }

  // C R U D   F O R   M Y   P U R C H A S E

  final List<MyPurchase> currentPurchases = [];

  final List<MyPurchase> archivedPurchases = [];

  // CREATE
  Future<void> addPurchase(MyPurchase purchase) async {
    await isar.writeTxn(
      () async {
        await isar.myPurchases.put(purchase);
      },
    );

    // re-read all purchases

    readPurchases();
  }

  // READ
  Future<void> readPurchases() async {
    List<MyPurchase> fetchedPurchases =
        await isar.myPurchases.where().findAll();

    currentPurchases.clear();
    archivedPurchases.clear();

    for (MyPurchase item in fetchedPurchases) {
      if (!item.isArchived) {
        currentPurchases.add(item);
      } else {
        archivedPurchases.add(item);
      }
    }

    // currentPurchases.addAll(fetchedPurchases);

    notifyListeners();
  }

  // UPDATE
  Future<void> updatePurchase(MyPurchase purchase) async {
    await isar.writeTxn(
      () async {
        await isar.myPurchases.put(purchase);
      },
    );

    // re-read all purchases

    readPurchases();
  }

  // DELETE
  Future<void> deletePurchase(int id) async {
    final purchase = await isar.myPurchases.get(id);

    if (purchase!.isUsed == 0) {
      await isar.writeTxn(
        () async {
          await isar.myPurchases.delete(id);
        },
      );
    }

    // re-read all purchases

    readPurchases();
  }

  // C R U D   F O R   M Y   M A T E R I A L

  List<MyMaterial> currentMaterials = [];

  // CREATE
  Future<void> addMaterial(MyMaterial material) async {
    final purchase = await isar.myPurchases.get(material.purchaseId);
    final custom = await isar.myCustoms.get(material.customId);

    await isar.writeTxn(
      () async {
        await isar.myMaterials.put(material); // ID HAS SET!!!

        // update for purchaseId

        if (purchase != null) {
          purchase.isUsed += 1;
          purchase.balance -= material.count;

          if (purchase.balance <= 0) {
            purchase.isArchived = true;
          }

          await isar.myPurchases.put(purchase); // UPDATE
        }

        // update for customId

        if (custom != null) {
          custom.materialList = MaterialList()
            ..materials = [...custom.materialList.materials, material.id];

          // custom.materials = [...custom.materials, material.id];
          await isar.myCustoms.put(custom); // UPDATE
        }
      },
    );

    // re-read all materials
    readMaterials(material.customId);
  }

  // READ
  Future<void> readMaterials(int customId) async {
    final fetchedCustom = await isar.myCustoms.get(customId);

    // print('${fetchedCustom!.name} datetime');
    // print('${fetchedCustom!.materialList.materials.length} fetched');
    // print('${fetchedCustom!.id} idk');
    // print('${fetchedCustom!.materialIds.length} nested');

    if (fetchedCustom != null) {
      await isar.writeTxn(() async {
        List<MyMaterial> fetchedMaterials = [];

        // for (int materialId in fetchedCustom.materials) {
        //   final material = await isar.myMaterials.get(materialId);

        //   if (material != null) {
        //     fetchedMaterials.add(material);
        //   }
        // }

        for (int materialId in fetchedCustom.materialList.materials) {
          final material = await isar.myMaterials.get(materialId);

          if (material != null) {
            fetchedMaterials.add(material);
          }
        }

        for (MyMaterial m in fetchedMaterials) {
          final purchase = await isar.myPurchases.get(m.purchaseId);

          if (purchase != null) {
            m.name = purchase.name;
            m.cost = double.parse(
                (purchase.price * m.count / purchase.count).toStringAsFixed(2));

            await isar.myMaterials.put(m);
          }
        }

        currentMaterials.clear();
        currentMaterials.addAll(fetchedMaterials);
      });

      notifyListeners();
    }
  }

  // UPDATE
  Future<void> updateMaterial(MyMaterial material) async {
    await isar.writeTxn(
      () async {
        await isar.myMaterials.put(material);
      },
    );

    // re-read all materials
    readMaterials(material.customId);
  }

  // DELETE
  Future<void> deleteMaterial(int id) async {
    final material = await isar.myMaterials.get(id);

    if (material != null) {
      int customId = material.customId;
      // remove material
      await isar.writeTxn(
        () async {
          // update for purchaseId
          final purchase = await isar.myPurchases.get(material.purchaseId);

          if (purchase != null) {
            purchase.isUsed -= 1;
            purchase.balance += material.count;

            await isar.myPurchases.put(purchase);
          }

          // update for customId
          final custom = await isar.myCustoms.get(material.customId);

          if (custom != null) {
            // for (int materialId in custom.materialList.materials) {
            //   if (materialId == material.id) {
            //     custom.materialList.materials.remove(materialId);
            //     break;
            //   }
            // }

            // custom.materialList.materials.removeWhere(
            //   (materialId) => materialId == material.id,
            // );

            final list = custom.materialList.materials.toList();
            list.removeWhere((element) => element == material.id);
            custom.materialList = MaterialList()..materials = list;

            await isar.myCustoms.put(custom);
            // custom.materials.remove(material.id);
          }
          await isar.myMaterials.delete(id);
        },
      );
      // re-read all materials
      readMaterials(customId);
    }
  }

  // C R U D  F O R   M Y   C U S T O M

  final List<MyCustom> currentCustoms = [];

  // CREATE
  Future<void> addCustom(MyCustom custom) async {
    await isar.writeTxn(
      () async {
        await isar.myCustoms.put(custom);
      },
    );

    // re-read all customs
    readCustoms();
  }

  // READ
  Future<void> readCustoms() async {
    List<MyCustom> fetchedCustoms = await isar.myCustoms.where().findAll();

    await isar.writeTxn(
      () async {
        for (MyCustom c in fetchedCustoms) {
          double totalCost = 0;

          for (int materialId in c.materialList.materials) {
            final material = await isar.myMaterials.get(materialId);

            if (material != null) {
              totalCost += material.cost;
            }
          }

          // for (MaterialId materialId in c.materialIds) {
          //   final material = await isar.myMaterials.get(materialId.myId);

          //   if (material != null) {
          //     totalCost += material.cost;
          //   }
          // }

          // for (int materialId in c.materials) {
          //   final material = await isar.myMaterials.get(materialId);

          //   if (material != null) {
          //     totalCost += material.cost;
          //   }
          // }

          c.selfCost = totalCost;

          await isar.myCustoms.put(c);
        }
      },
    );

    currentCustoms.clear();
    currentCustoms.addAll(fetchedCustoms);

    notifyListeners();
  }

  // UPDATE
  Future<void> updateCustom(MyCustom custom) async {
    await isar.writeTxn(
      () async {
        await isar.myCustoms.put(custom);
      },
    );

    // re-read all customs
    readCustoms();
  }

  // DELETE
  Future<void> deleteCustom(int id) async {
    final custom = await isar.myCustoms.get(id);

    if (custom!.isUsed == 0) {
      // delete materials

      for (int materialId in custom.materialList.materials) {
        await deleteMaterial(materialId);
      }

      // for (MaterialId materialId in custom.materialIds) {
      //   await deleteMaterialWithoutNotify(materialId.myId);
      // }

      // for (int materialId in custom.materials) {
      //   await deleteMaterialWithoutNotify(materialId);
      // }

      // delete custom
      await isar.writeTxn(
        () async {
          await isar.myCustoms.delete(id);
        },
      );
    }

    // re-read all customs
    readCustoms();
  }

  // C R U D   F O R   M Y   C L I E N T

  final List<MyClient> currentClients = [];

  // list of customs for current client
  List<MyCustom> currentClientCustoms = [];

  // ADD CUSTOMS TO CLIENT
  Future<void> addCustomsToClient(int clientId, int customId) async {
    final client = await isar.myClients.get(clientId);

    if (client != null) {
      await isar.writeTxn(
        () async {
          // client.customs.addAll(customs);
          client.customs = [...client.customs, customId];

          await isar.myClients.put(client);

          final custom = await isar.myCustoms.get(customId);

          if (custom != null) {
            custom.isUsed += 1;

            await isar.myCustoms.put(custom);
          }
        },
      );
    }

    // re-read all customs for client
    readCustomsForClient(clientId);
  }

  // READ CUSTOMS FOR CLIENT
  Future<void> readCustomsForClient(int clientId) async {
    final fetchedClient = await isar.myClients.get(clientId);

    if (fetchedClient != null) {
      List<MyCustom> fetchedCustoms = [];

      for (int customId in fetchedClient.customs) {
        final custom = await isar.myCustoms.get(customId);

        if (custom != null) {
          fetchedCustoms.add(custom);
        }
      }

      currentClientCustoms.clear();
      currentClientCustoms.addAll(fetchedCustoms);

      notifyListeners();
    }
  }

  // REMOVE CUSTOM FROM CLIENT
  Future<void> removeCustomFromClient(int clientId, int customId) async {
    await removeCustomFromClientWithoutNotify(clientId, customId);

    // re-read all customs for client
    readCustomsForClient(clientId);
  }

  // REMOVE CUSTOM FROM CLIENT WITHOUT NOTIFY
  Future<void> removeCustomFromClientWithoutNotify(
      int clientId, int customId) async {
    final client = await isar.myClients.get(clientId);

    if (client != null) {
      await isar.writeTxn(() async {
        final custom = await isar.myCustoms.get(customId);

        if (custom != null) {
          custom.isUsed -= 1;

          await isar.myCustoms.put(custom);
        }

        // client.customs.remove(customId);
        final list = client.customs.toList();
        // list.removeWhere((element) => element == customId);
        for (int fetchedId in list) {
          if (fetchedId == customId) {
            list.remove(fetchedId);
            break;
          }
        }
        client.customs = list;

        await isar.myClients.put(client);
      });
    }
  }

  // CREATE
  Future<void> addClient(MyClient client) async {
    await isar.writeTxn(
      () async {
        await isar.myClients.put(client);
      },
    );

    // re-read all clients
    readClients();
  }

  // READ
  Future<void> readClients() async {
    List<MyClient> fetchedClients = await isar.myClients.where().findAll();

    currentClients.clear();
    currentClients.addAll(fetchedClients);

    notifyListeners();
  }

  // UPDATE
  Future<void> updateClient(MyClient client) async {
    await isar.writeTxn(
      () async {
        await isar.myClients.put(client);
      },
    );

    // re-read all clients
    readClients();
  }

  // DELETE
  Future<void> deleteClient(int id) async {
    final client = await isar.myClients.get(id);

    if (client != null) {
      // delete customs
      for (int customId in client.customs) {
        final custom = await isar.myCustoms.get(customId);

        if (custom != null) {
          await removeCustomFromClient(id, customId);
        }
      }

      // delete client
      await isar.writeTxn(
        () async {
          await isar.myClients.delete(id);
        },
      );
    }

    // re-read all clients
    readClients();
  }
}
