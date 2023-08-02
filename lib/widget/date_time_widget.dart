import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DataPickPage extends StatefulWidget {
  const DataPickPage({super.key});

  @override
  State<DataPickPage> createState() => _DataPickPageState();
}

class _DataPickPageState extends State<DataPickPage> {
  DateTime dateTime = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: builDatePicker(),
      ),
    );
  }

  Widget builDatePicker() => SizedBox(
        height: 180,
        child: CupertinoDatePicker(
          initialDateTime: dateTime,
          minimumYear: 2015,
          maximumYear: DateTime.now().year,
          mode: CupertinoDatePickerMode.date,
          onDateTimeChanged: (dateTime) =>
              setState(() => this.dateTime = dateTime),
        ),
      );
}
