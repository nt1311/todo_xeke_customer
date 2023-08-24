import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_xeke_customer/modules/main_menu_module/home_tab/home_tab_view_model.dart';

class HomeTabScreen extends StatefulWidget {
  const HomeTabScreen({super.key});

  @override
  State<HomeTabScreen> createState() => _HomeTabScreenState();
}

class _HomeTabScreenState extends State<HomeTabScreen> {
  final HomeTabViewModel homeTabViewModel = Get.put(HomeTabViewModel());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _appBar(),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  homeTabViewModel.bookingCarScreen();
                },
                child: const Text('Name'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _appBar() {
    return Container(
      child: AppBar(
        backgroundColor: Colors.white,
        title: ListTile(
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Container(
              width: 48,
              height: 48,
              child: Image.asset("assets/images/user_avatar.png"),
            ),
          ),
          title: Text(
            "Hello",
            style: TextStyle(fontSize: 12, color: Colors.grey.shade400),
          ),
          subtitle: const Text(
            "Huỳnh Văn Ngọc Tuấn",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
      ),
    );
  }
}
