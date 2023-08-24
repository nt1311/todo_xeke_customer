import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_xeke_customer/routes/app_pages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.initila,
      getPages: AppPages.routes,
    );
  }
}
