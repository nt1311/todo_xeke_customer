import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_xeke_customer/config/constants/app_colors.dart';

class DiscointCodeBookScreen extends StatelessWidget {
  const DiscointCodeBookScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Giảm giá",
          style: TextStyle(color: Colors.black),
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
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: Text(
          "Tùy thuộc vào nhà xe bạn chọn sẽ được giảm giá với mức giá khác nhau khi đặt bao xe.",
          style: TextStyle(fontSize: 16, fontFamily: "Canbi"),
        ),
      ),
    );
  }
}
