import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:todo_xeke_customer/routes/app_pages.dart';

class ChoosePoint {
  final String chooseRoute;
  final String phone;

  ChoosePoint({required this.chooseRoute, required this.phone});
}

class BookingTabViewModule extends GetxController {
  final ValueNotifier<List<ChoosePoint>> listChoosePoint = ValueNotifier([]);
  List<String> car = ['7 chỗ', 'Limousine', '12 chỗ'];
  RxBool isSwitched = false.obs;
  RxInt selectIndex = 0.obs;
  RxString datecalendar = " a".obs;

  addPoint() {
    if (listChoosePoint.value.length < 2) {
      listChoosePoint.value.add(
        ChoosePoint(chooseRoute: 'Chọn điểm đón', phone: 'Số điện thoại'),
      );
      listChoosePoint.notifyListeners();
    }
  }

  bookCar(bool value) {
    isSwitched.value = value;
    notifyChildrens();
  }

  void ChooseRouteViewModule() => Get.toNamed(AppRoutes.CHOOSE_ROUTE);

  void LocationViewMoidel() => Get.toNamed(AppRoutes.LOCATION_MAP);

  void DiscountCodeBookingViewModule() =>
      Get.toNamed(AppRoutes.DISCOUNT_CODE_BOOKING);
}
