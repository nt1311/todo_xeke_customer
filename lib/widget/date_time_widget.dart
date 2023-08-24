import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_xeke_customer/config/constants/app_colors.dart';

// class DateTimeWidget extends StatelessWidget {
//   DateTimeWidget({
//     Key? key,
//     required this.titleText,
//     required this.iconSection,
//     required this.onDateChanged,
//   }) : super(key: key);

//   final String titleText;
//   final IconData iconSection;
//   final void Function(DateTime?) onDateChanged;

//   final Rx<DateTime?> selectedDate = Rx<DateTime?>(null);
//   final DateTime defaultDate = DateTime.now();

//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           GestureDetector(
//             onTap: () => _selectDate(context),
//             child: Container(
//               width: 164,
//               height: 48,
//               padding: const EdgeInsets.symmetric(
//                 horizontal: 12,
//                 vertical: 8,
//               ),
//               decoration: BoxDecoration(
//                 borderRadius: const BorderRadius.all(
//                   Radius.circular(12),
//                 ),
//                 border: Border.all(color: Colors.black26),
//               ),
//               child: Row(
//                 children: [
//                   Obx(
//                     () {
//                       final date = selectedDate.value;
//                       return Text(
//                         date != null
//                             ? "${date.day}/${date.month}/${date.year}"
//                             : "dd/mm/yyyy",
//                       );
//                     },
//                   ),
//                   const SizedBox(height: 8, width: 8),
//                   Icon(iconSection),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Future<void> _selectDate(BuildContext context) async {
//     final pickedDate = await showCupertinoModalPopup(
//       context: context,
//       builder: (context) {
//         return Container(
//           height: 250,
//           child: CupertinoDatePicker(
//             backgroundColor: Colors.white,
//             initialDateTime: selectedDate.value ?? defaultDate,
//             minimumDate: DateTime(2000),
//             maximumDate: DateTime(2101),
//             mode: CupertinoDatePickerMode.date,
//             onDateTimeChanged: (DateTime date) {
//               selectedDate.value = date;
//               onDateChanged(date);
//             },
//           ),
//         );
//       },
//     );

//     if (pickedDate != null && pickedDate != selectedDate.value) {
//       selectedDate.value = pickedDate;
//       onDateChanged(pickedDate);
//     }
//   }
// }

class DateTimeWidget extends StatelessWidget {
  DateTimeWidget({
    Key? key,
    required this.titleText,
    required this.iconSection,
    required this.onDateChanged,
  }) : super(key: key);

  final String titleText;
  final IconData iconSection;

  final void Function(DateTime?) onDateChanged;

  final Rx<DateTime?> selectedDate = Rx<DateTime?>(null);
  final Rx<TimeOfDay?> selectedTime = Rx<TimeOfDay?>(null);
  final DateTime defaultDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          GestureDetector(
            onTap: () => _selectDate(context),
            child: Container(
              width: 164,
              height: 48,
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 8,
              ),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(12),
                ),
                border: Border.all(color: Colors.black26),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Obx(
                    () {
                      final date = selectedDate.value;
                      return Text(
                        date != null
                            ? "${date.day}/${date.month}/${date.year}"
                            : "dd/mm/yyyy",
                      );
                    },
                  ),
                  Icon(iconSection),
                ],
              ),
            ),
          ),
          SizedBox(height: 16, width: 10),
          GestureDetector(
            onTap: () => _selectTime(context),
            child: Container(
              width: 164,
              height: 48,
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 8,
              ),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(12),
                ),
                border: Border.all(color: Colors.black26),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Obx(
                    () {
                      final time = selectedTime.value;
                      return Text(
                        time != null ? time.format(context) : "hh : mm",
                      );
                    },
                  ),
                  const Icon(Icons.keyboard_arrow_down_outlined,
                      color: NEUTRAL_GREY_8_COLOR),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final pickedDate = await showCupertinoModalPopup(
      context: context,
      builder: (context) {
        return Container(
          height: 250,
          child: CupertinoDatePicker(
            backgroundColor: Colors.white,
            initialDateTime: selectedDate.value ?? defaultDate,
            minimumDate: DateTime(2000),
            maximumDate: DateTime(2101),
            mode: CupertinoDatePickerMode.date,
            onDateTimeChanged: (DateTime date) {
              selectedDate.value = date;
              onDateChanged(date);
            },
          ),
        );
      },
    );

    if (pickedDate != null && pickedDate != selectedDate.value) {
      selectedDate.value = pickedDate;
      onDateChanged(pickedDate);
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final pickedTime = await showTimePicker(
      context: context,
      initialTime: selectedTime.value ?? TimeOfDay.now(),
    );

    if (pickedTime != null && pickedTime != selectedTime.value) {
      selectedTime.value = pickedTime;
      onDateChanged(_combineDateAndTime(selectedDate.value, pickedTime));
    }
  }

  DateTime _combineDateAndTime(DateTime? date, TimeOfDay? time) {
    if (date == null || time == null) return DateTime.now();
    return DateTime(date.year, date.month, date.day, time.hour, time.minute);
  }
}
