import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class HomeTabViewModel extends GetxController {
  @override
  void bookingCarScreen() => Get.toNamed(AppRoutes.BOOKING_CAR);
}
