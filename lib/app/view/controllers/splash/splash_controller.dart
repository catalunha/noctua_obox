import 'dart:io';

import 'package:get/get.dart';
import 'package:noctua_obox/app/domain/models/contact_model.dart';
import 'package:noctua_obox/app/domain/services/models_obox.dart';
import 'package:path_provider/path_provider.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    openIsarInstance();
  }

  void openIsarInstance() async {
    print('start obox...');
    Directory tempDir = await getTemporaryDirectory();
    String tempPath = tempDir.path;
    // I/flutter (26634): tempPath: /data/user/0/org.brintec.noctua_obox.noctua_obox/cache

    Directory appDocDir = await getApplicationDocumentsDirectory();
    String appDocPath = appDocDir.path;
    // I/flutter (26634): appDocPath: /data/user/0/org.brintec.noctua_obox.noctua_obox/app_flutter
    OBoxStore oBoxStore = OBoxStore();
    await oBoxStore.init();
    await oBoxStore.updateContact(update: true);
    print('contactBox: ${oBoxStore.contactBox.getAll().length}');
  }
}
