import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class ChooseRoute {
  final String chooseRoute;

  ChooseRoute({required this.chooseRoute});
}

class ChooseRouteViewModule extends GetxController {
  final ValueNotifier<List<ChooseRoute>> listChooseRoute = ValueNotifier([]);
  List<String> chooseRoute = [
    'Huế - Đà Nẵng',
    'Đà Nẵng - Huế',
    'Huế - Sài Gòn',
    'Huế - Quảng Trị'
  ].obs;
  RxInt selectIndex = 0.obs;
}
