import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';

import 'main_menu_view_model.dart';

class MainMenuBinding extends Bindings {
  void dependencies() {
    Get.put(MainMenuViewModel());
  }
}
