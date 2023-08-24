import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_xeke_customer/config/constants/app_icons.dart';
import 'package:todo_xeke_customer/modules/main_menu_module/main_menu_view_model.dart';

import '../../config/constants/app_colors.dart';

class MainMenuScreen extends GetView<MainMenuViewModel> {
  const MainMenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => controller.widgetOptions.elementAt(controller.selectedIndex.value)),
      bottomNavigationBar: Obx(
        () {
          return BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Image.asset(AppIcons.icHomeTab,
                    color: controller.selectedIndex.value == 0
                        ? NEUTRAL_ORANGE_5_COLOR
                        : NEUTRAL_GREY_5_COLOR),
                label: 'Trang chủ',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(AppIcons.icCalendarTab,
                    color: controller.selectedIndex.value == 1
                        ? NEUTRAL_ORANGE_5_COLOR
                        : NEUTRAL_GREY_5_COLOR),
                label: 'trips'.tr,
              ),
              BottomNavigationBarItem(
                icon: Image.asset(AppIcons.icNotifiTab,
                    color: controller.selectedIndex.value == 2
                        ? NEUTRAL_ORANGE_5_COLOR
                        : NEUTRAL_GREY_5_COLOR),
                label: 'notification'.tr,
              ),
              BottomNavigationBarItem(
                icon: Image.asset(AppIcons.icProfileTab,
                    color: controller.selectedIndex.value == 3
                        ? NEUTRAL_ORANGE_5_COLOR
                        : NEUTRAL_GREY_5_COLOR),
                label: 'profile_tab'.tr,
              ),
            ],
            currentIndex: controller.selectedIndex.value,
            selectedItemColor: NEUTRAL_ORANGE_5_COLOR,
            onTap: controller.onItemTapped,
          );
        },
      ),
    );
  }
}
