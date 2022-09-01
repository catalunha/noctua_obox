import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:noctua_obox/app/data/utils/app_assets.dart';
import 'package:noctua_obox/app/domain/models/contact_model.dart';
import 'package:noctua_obox/objectbox.g.dart';
import 'package:path_provider/path_provider.dart';

class OBoxStore {
  late Store _store;
  late Box<ContactModel> contactBox;
  Future<void> init() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String appDocPath = appDocDir.path;
    _store = await openStore(directory: appDocPath);
    contactBox = _store.box<ContactModel>();
  }

  // final popBox = _store.box<PopModel>();
  // final tBox = _store.box<TModel>();
  // final munBox = _store.box<MunModel>();
  // final anaBox = _store.box<ANAModel>();

  Future<void> updateContact({bool update = false}) async {
    if (update) {
      print('Removendo todos os dados do contactBox');
      contactBox.removeAll();
    }
    if (contactBox.isEmpty()) {
      print('Lendo dados do json para contactBox');
      String dataJson = await rootBundle.loadString(AppAssets.contacts);
      // var dataJson = json.decode(dataPath);

      final dataJsonObj = json.decode(dataJson);
      final List<ContactModel> list = dataJsonObj
          .map<ContactModel>((e) => ContactModel.fromMap(e))
          .toList();

      contactBox.putMany(list);
    } else {
      print('contactBox com dados');
    }
  }

  close() {
    _store.close(); // don't forget to close the store
  }
}
