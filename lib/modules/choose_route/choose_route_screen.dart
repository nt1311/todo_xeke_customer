import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_xeke_customer/config/constants/app_colors.dart';
import 'package:todo_xeke_customer/modules/choose_route/choose_route_view.dart';
import 'package:todo_xeke_customer/widget/widget_input.dart';

class ChooseRouteScreen extends StatefulWidget {
  const ChooseRouteScreen({super.key});

  @override
  State<ChooseRouteScreen> createState() => _ChooseRouteScreenState();
}

class _ChooseRouteScreenState extends State<ChooseRouteScreen> {
  final ChooseRouteViewModule _chooseRouteViewModule =
      Get.put(ChooseRouteViewModule());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Chọn tuyến",
          style: TextStyle(
            fontFamily: "Canbin",
            fontWeight: FontWeight.w700,
            color: grey_4,
            fontSize: 18,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: grey_4,
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            InputWidget(
              onTap: () {},
              hintText: 'Tìm kiếm',
              prefixIcon: const Icon(Icons.search),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: Obx(
                () {
                  final chooseRouteList = _chooseRouteViewModule.chooseRoute;
                  final List<Widget> items = [];
                  for (int index = 0; index < chooseRouteList.length; index++) {
                    final routeName = chooseRouteList[index];
                    final isLastItem = index == chooseRouteList.length - 1;
                    items.add(
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            child: TextButton(
                              onPressed: () {
                                _chooseRouteViewModule.selectIndex.value =
                                    index;
                              },
                              child: Text(
                                routeName,
                                style: const TextStyle(
                                  fontFamily: "Canbi",
                                  fontSize: 16,
                                  color: NEUTRAL_GREY_8_COLOR,
                                ),
                              ),
                            ),
                          ),
                          if (!isLastItem)
                            const Divider(
                              thickness: 1,
                              height: 1,
                              color: NEUTRAL_RADIUS_COLOR,
                            ),
                        ],
                      ),
                    );
                  }
                  return ListView(
                    children: items,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
