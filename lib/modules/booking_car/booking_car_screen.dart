import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cupertino_date_picker_fork/flutter_cupertino_date_picker_fork.dart';
import 'package:get/get.dart';
import 'package:todo_xeke_customer/config/constants/app_colors.dart';
import 'package:todo_xeke_customer/config/constants/app_icons.dart';
import 'package:todo_xeke_customer/modules/booking_car/booking_car_view.dart';
import 'package:todo_xeke_customer/widget/date_time_widget.dart';
import 'package:todo_xeke_customer/widget/widget_button_Style.dart';
import 'package:todo_xeke_customer/widget/widget_input.dart';

class BookingCarScreen extends StatefulWidget {
  const BookingCarScreen({super.key});

  @override
  State<BookingCarScreen> createState() => _BookingCarScreen();
}

class _BookingCarScreen extends State<BookingCarScreen> {
  final _viewController = Get.put(BookingTabViewModule());

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
                color: NEUTRAL_GREY_9_COLOR,
              ),
              onPressed: () {},
            )),
        body: _body());
  }

  Widget _body() {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          const SizedBox(height: 16),
          _selectCarLine(),
          const SizedBox(height: 16),
          _orderBagCar(),
          const SizedBox(height: 16),
          _discountBookCar(),
          const SizedBox(height: 16),
          _chooseNumberPeople(),
          const SizedBox(height: 16),
          _chooseDateTime(),
          const SizedBox(height: 16),
          _chooseRoute(),
          const SizedBox(height: 16),
          _choosePickUp(),
          const SizedBox(height: 16),
          _choosePickPay(),
          const SizedBox(height: 16),
          _carBookingConfirmation(),
        ],
      ),
    );
  }

  Widget _selectCarLine() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Chọn dòng xe",
            style: TextStyle(
                fontFamily: "Canbin",
                fontWeight: FontWeight.w700,
                color: NEUTRAL_GREY_9_COLOR,
                fontSize: 18),
          ),
          const SizedBox(height: 10),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Wrap(
              spacing: 16,
              children: List.generate(
                _viewController.car.length,
                (index) => Obx(
                  () => Container(
                    width: 150,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            _viewController.selectIndex.value == index
                                ? NEUTRAL_ORANGE_5_COLOR
                                : Colors.white,
                        elevation: 0,
                        side: BorderSide(
                            width: 2,
                            color: _viewController.selectIndex.value == index
                                ? NEUTRAL_ORANGE_5_COLOR
                                : NEUTRAL_RADIUS_COLOR),
                      ),
                      onPressed: () =>
                          _viewController.selectIndex.value = index,
                      child: Text(
                        _viewController.car[index],
                        style: TextStyle(
                            fontFamily: "Canbi",
                            fontSize: 16,
                            color: _viewController.selectIndex.value == index
                                ? Colors.white
                                : NEUTRAL_GREY_8_COLOR),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _orderBagCar() {
    print('build');
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          const Text(
            "Đặt bao xe ",
            style: TextStyle(
                fontFamily: "Canbin",
                fontWeight: FontWeight.w700,
                color: NEUTRAL_GREY_9_COLOR,
                fontSize: 18),
          ),
          const SizedBox(width: 180),
          Obx(() {
            return Transform.scale(
              scale: 0.7,
              child: CupertinoSwitch(
                value: _viewController.isSwitched.value,
                activeColor: NEUTRAL_ORANGE_5_COLOR,
                onChanged: _viewController.bookCar,
              ),
            );
          })
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
          Icon(Icons.info, color: NEUTRAL_ORANGE_5_COLOR),
          SizedBox(width: 5),
          Text(
            "Đặt bao xe sẽ được",
            style: TextStyle(
                fontFamily: "Canbin",
                color: NEUTRAL_GREY_9_COLOR,
                fontSize: 18),
          ),
          SizedBox(width: 5),
          Text(
            "giảm giá",
            style: TextStyle(
                fontFamily: "Canbin",
                color: NEUTRAL_ORANGE_5_COLOR,
                fontSize: 18),
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
            Obx(
              () => Text(
                "Chọn số người đi (tối đa ${_viewController.car[_viewController.selectIndex.value].replaceAll('chỗ', 'người').replaceAll('Limousine', '')})",
                style: const TextStyle(
                    fontFamily: "Canbin",
                    fontWeight: FontWeight.w700,
                    color: NEUTRAL_GREY_9_COLOR,
                    fontSize: 18),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                border: Border.all(color: NEUTRAL_RADIUS_COLOR),
              ),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.remove, color: NEUTRAL_GREY_5_COLOR),
                    onPressed: () {},
                  ),
                  Container(width: 1, height: 24, color: NEUTRAL_RADIUS_COLOR),
                  const Expanded(
                    child: Center(
                      child: Text(
                        "2",
                        style: TextStyle(
                            fontFamily: "Canbin",
                            fontWeight: FontWeight.w700,
                            color: NEUTRAL_GREY_5_COLOR,
                            fontSize: 18),
                      ),
                    ),
                  ),
                  Container(width: 1, height: 24, color: NEUTRAL_RADIUS_COLOR),
                  IconButton(
                    icon: const Icon(Icons.add, color: NEUTRAL_GREY_8_COLOR),
                    onPressed: () {},
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
                color: NEUTRAL_GREY_9_COLOR,
                fontSize: 18),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Container(
                child: DateTimeWidget(
                  titleText: 'Select Date and Time',
                  iconSection: Icons.calendar_month_outlined,
                  onDateChanged: (DateTime? dateTime) {
                    if (dateTime != null) {
                      print('Selected date and time: ${dateTime.toString()}');
                    } else {
                      print('No date and time selected.');
                    }
                  },
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
        children: const [
          Text(
            "Chọn tuyến",
            style: TextStyle(
                fontFamily: "Canbin",
                fontWeight: FontWeight.w700,
                color: NEUTRAL_GREY_9_COLOR,
                fontSize: 18),
          ),
          const SizedBox(height: 10),
          InputWidget(
            hintText: 'Chọn tuyến đường',
            suffixIcon: Icon(Icons.keyboard_arrow_right_outlined),
          ),
        ],
      ),
    );
  }

  Widget _choosePickUp() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Chọn điểm đón ( tối đa 2 điểm )",
            style: TextStyle(
                fontFamily: "Canbin",
                fontWeight: FontWeight.w700,
                color: NEUTRAL_GREY_9_COLOR,
                fontSize: 18),
          ),
          const SizedBox(height: 10),
          ValueListenableBuilder<List<ChoosePoint>>(
            valueListenable: _viewController.listChoosePoint,
            builder: (context, listChoosePoint, child) => Wrap(
                runSpacing: 16,
                children: List.generate(
                    listChoosePoint.length,
                    (index) => Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          decoration: BoxDecoration(
                            border: Border.all(color: NEUTRAL_GREY_5_COLOR),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            children: [
                              _buildItemRow(
                                Icons.location_on_rounded,
                                listChoosePoint[index].chooseRoute,
                                iconRight: Icons.clear,
                                readOnly: true,
                                onTap: () =>
                                    _viewController.LocationViewMoidel(),
                              ),
                              const Divider(
                                  thickness: 1,
                                  height: 1,
                                  color: NEUTRAL_RADIUS_COLOR),
                              _buildItemRow(
                                  Icons.phone, listChoosePoint[index].phone),
                            ],
                          ),
                        ))),
          ),
          const SizedBox(width: 10, height: 16),
          GestureDetector(
              onTap: () => _viewController.addPoint(),
              child: Image.asset(AppIcons.imgButtonPickUp)),
        ],
      ),
    );
  }

  Widget _buildItemRow(IconData icon, String title,
      {IconData? iconRight, bool readOnly = false, VoidCallback? onTap}) {
    return Row(
      children: [
        Icon(
          icon,
          size: 20,
          color: NEUTRAL_GREY_5_COLOR,
        ),
        const SizedBox(width: 8),
        Expanded(
          child: InputWidget(
            hintText: title,
            border: InputBorder.none,
            readOnly: readOnly,
            onTap: onTap,
          ),
        ),
        iconRight != null ? Icon(iconRight, size: 20) : const SizedBox(),
      ],
    );
  }

  Widget _choosePickPay() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Chọn điểm ",
            style: TextStyle(
                fontFamily: "Canbin",
                fontWeight: FontWeight.w700,
                color: NEUTRAL_GREY_8_COLOR,
                fontSize: 18),
          ),
          const SizedBox(height: 10),
          ValueListenableBuilder<List<ChoosePoint>>(
            valueListenable: _viewController.listChoosePoint,
            builder: (context, listChoosePoint, child) => Wrap(
              runSpacing: 16,
              children: List.generate(
                listChoosePoint.length,
                (index) => Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                      border: Border.all(color: NEUTRAL_RADIUS_COLOR),
                      borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    children: [
                      _buildItemRow(Icons.location_on_rounded,
                          listChoosePoint[index].chooseRoute,
                          iconRight: Icons.clear,
                          readOnly: true,
                          onTap: () async {}
                          // print('qua màn chọn điểm tr'),
                          ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 10, height: 16),
          GestureDetector(
              onTap: () => _viewController.addPoint(),
              child: Image.asset(AppIcons.imgButtonPickPay)),
        ],
      ),
    );
  }

  Widget _carBookingConfirmation() {
    return Container(
      child: ButtonStyleWidget(
        onPressed: () {},
        text: 'Xác nhận đặt xe',
      ),
    );
  }
}
