import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:todo_xeke_customer/modules/base_module/base_view_model.dart';
import 'home_tab/home_tab_sceeen.dart';

class MainMenuViewModel extends BaseViewModel {
  final selectedIndex = 0.obs;
  List widgetOptions = <Widget>[
    HomeTabScreen(),
  ].obs;

  void onItemTapped(int index) {
    if (index != selectedIndex.value) selectedIndex.value = index;
    update();
  }
}
