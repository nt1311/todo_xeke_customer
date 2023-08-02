import 'package:flutter/material.dart';
import 'package:todo_xeke_customer/modules/banner_module/banner_module.dart';

class BannerScreen extends StatefulWidget {
  const BannerScreen({Key? key}) : super(key: key);

  @override
  State<BannerScreen> createState() => _BannerScreenState();
}

class _BannerScreenState extends State<BannerScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16.8),
      height: 150,
      width: 343,
      child: PageView.builder(
        itemCount: appBannerList.length,
        itemBuilder: (context, index) {
          final AppBannerModule banner = appBannerList[index];
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 16.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              image: DecorationImage(
                image: NetworkImage(banner.thumbnaiUrl),
                fit: BoxFit.cover,
              ),
            ),
            child: DefaultTextStyle(
              style: TextStyle(color: Colors.white, fontSize: 20),
              child: Stack(
                children: [
                  Positioned(
                    bottom: 8.0,
                    left: 16.0,
                    child: Text(
                      banner.title,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
