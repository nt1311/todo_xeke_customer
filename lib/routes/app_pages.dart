import 'package:get/get.dart';
import 'package:todo_xeke_customer/modules/booking_car/booking_car_screen.dart';
import 'package:todo_xeke_customer/modules/main_menu_module/home_tab/home_tab_sceeen.dart';
import 'package:todo_xeke_customer/modules/main_menu_module/main_menu_screen.dart';
import 'package:todo_xeke_customer/modules/main_menu_module/main_menu_view.dart';

import '../modules/location_module/location_screen.dart';

part 'app_routes.dart';

class AppPages {
  static const initila = AppRoutes.MAIN_MENU;
  static final routes = [
    GetPage(
      name: AppRoutes.MAIN_MENU,
      page: () => const MainMenuScreen(),
      binding: MainMenuBinding(),
    ),
    GetPage(
        name: AppRoutes.HOME_TAB,
        page: () => const HomeTabScreen(),
        transition: Transition.cupertino),
    GetPage(
        name: AppRoutes.BOOKING_CAR,
        page: () => const BookingCarScreen(),
        transition: Transition.cupertino),
    GetPage(
      name: AppRoutes.LOCATION_MAP,
      page: () => const LocationScreen(),
    ),
  ];
}
