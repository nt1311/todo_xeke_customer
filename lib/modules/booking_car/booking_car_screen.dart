import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_xeke_customer/config/constants/app_colors.dart';

class BookingCarScreen extends StatefulWidget {
  const BookingCarScreen({super.key});

  @override
  State<BookingCarScreen> createState() => _BookingCarScreen();
}

class _BookingCarScreen extends State<BookingCarScreen> {
  BookingCarScreen homeTabController = Get.put(BookingCarScreen());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.white,
            elevation: 0,
            title: const Text(
              "Đặt xe",
              style: TextStyle(color: Colors.black),
            ),
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
              onPressed: () {},
            )),
        body: _body());
  }

  Widget _body() {
    return Container(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(height: 10),
            _selectCarLine(),
            const SizedBox(height: 15),
            _orderBagCar(),
            const SizedBox(height: 10),
            _discountBookCar(),
            const SizedBox(height: 15),
            _chooseNumberPeople(),
            const SizedBox(height: 10),
            _chooseDateTime(),
            const SizedBox(height: 10),
            _chooseRoute(),
            const SizedBox(height: 10),
            _chossePickPoint(),
          ],
        ),
      ),
    );
  }

  Widget _selectCarLine() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Chọn dòng xe",
              style: TextStyle(
                  fontFamily: "Canbin",
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                  fontSize: 18),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Container(
                  width: 150,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      elevation: 0,
                      side: BorderSide(width: 2, color: Colors.black38),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text(
                      "7 chỗ",
                      style: TextStyle(
                          fontFamily: "Canbi",
                          fontSize: 16,
                          color: Colors.black54),
                    ),
                  ),
                ),
                Container(
                  width: 150,
                  height: 50,
                  padding: EdgeInsets.only(left: 10),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      elevation: 0,
                      side: BorderSide(width: 2, color: Colors.black38),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text(
                      "Limosine",
                      style: TextStyle(
                          fontFamily: "Canbi",
                          fontSize: 16,
                          color: Colors.black54),
                    ),
                  ),
                ),
                Container(
                  width: 150,
                  height: 50,
                  padding: EdgeInsets.only(left: 10),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      elevation: 0,
                      side: BorderSide(width: 2, color: Colors.black38),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text(
                      "12 chỗ",
                      style: TextStyle(
                          fontFamily: "Canbi",
                          fontSize: 16,
                          color: Colors.black54),
                    ),
                  ),
                ),
                Container(
                  width: 150,
                  height: 50,
                  padding: EdgeInsets.only(left: 10),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      elevation: 0,
                      side: BorderSide(width: 2, color: Colors.black38),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text(
                      "16 chỗ",
                      style: TextStyle(
                          fontFamily: "Canbi",
                          fontSize: 16,
                          color: Colors.black54),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _orderBagCar() {
    bool isSwitched = true;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          const Text(
            "Đặt bao xe ",
            style: TextStyle(
                fontFamily: "Canbin",
                fontWeight: FontWeight.w700,
                color: Colors.black,
                fontSize: 18),
          ),
          const SizedBox(width: 180),
          Transform.scale(
            scale: 0.7,
            child: CupertinoSwitch(
              value: isSwitched,
              activeColor: Color.fromARGB(255, 255, 77, 0),
              onChanged: (bool? value) {
                setState(() {
                  isSwitched = value ?? false;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _discountBookCar() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Icon(Icons.info, color: PRIMARY_ORANGE_BASE),
          SizedBox(width: 5),
          Text(
            "Đặt bao xe sẽ được",
            style: TextStyle(
                fontFamily: "Canbin", color: Colors.black, fontSize: 18),
          ),
          SizedBox(width: 5),
          Text(
            "giảm giá",
            style: TextStyle(
                fontFamily: "Canbin", color: PRIMARY_ORANGE_BASE, fontSize: 18),
          ),
        ],
      ),
    );
  }

  Widget _chooseNumberPeople() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Chọn số người đi",
              style: TextStyle(
                  fontFamily: "Canbin",
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                  fontSize: 18),
            ),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                border: Border.all(color: Colors.black26),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: IconButton(
                      icon: const Icon(Icons.remove),
                      onPressed: () {},
                    ),
                  ),
                  Container(
                    child: Text("2"),
                  ),
                  Container(
                    child: IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _chooseDateTime() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Chọn thời gian",
            style: TextStyle(
                fontFamily: "Canbin",
                fontWeight: FontWeight.w700,
                color: Colors.black,
                fontSize: 18),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Container(
                height: 48,
                width: 164,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  border: Border.all(color: Colors.black26),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      child: Row(
                        children: [
                          const Text(
                            "08/11/2023",
                            style: TextStyle(
                                fontFamily: "Canbin",
                                color: Colors.black,
                                fontSize: 16),
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.calendar_month_outlined,
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 10),
              Container(
                height: 48,
                width: 164,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  border: Border.all(color: Colors.black26),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      child: Row(
                        children: [
                          const Text(
                            "6:00",
                            style: TextStyle(
                                fontFamily: "Canbin",
                                color: Colors.black,
                                fontSize: 16),
                          ),
                          SizedBox(width: 60),
                          IconButton(
                            icon: const Icon(
                              Icons.keyboard_arrow_down_outlined,
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _chooseRoute() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Chọn tuyến",
            style: TextStyle(
                fontFamily: "Canbin",
                fontWeight: FontWeight.w700,
                color: Colors.black,
                fontSize: 18),
          ),
          const SizedBox(height: 10),
          Container(
            child: TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(13),
                hintText: "Chọn tuyến đường",
                suffixIcon: Icon(Icons.keyboard_arrow_right_outlined),
                fillColor: Colors.black26,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _chossePickPoint() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Chọn thời gian",
            style: TextStyle(
                fontFamily: "Canbin",
                fontWeight: FontWeight.w700,
                color: Colors.black,
                fontSize: 18),
          ),
          const SizedBox(height: 10),
          Container(
            child: Row(
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    side: BorderSide(color: Colors.black26),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: Text(
                    'Elevated Button',
                    style: TextStyle(fontSize: 28),
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          SizedBox(width: 10),
        ],
      ),
    );
  }
}
