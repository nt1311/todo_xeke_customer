import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:rxdart/rxdart.dart';

import '../../config/constants/app_colors.dart';

abstract class BaseViewModel extends GetxController {
  final loadingSubject = BehaviorSubject<bool>.seeded(false);
  final errorSubject = BehaviorSubject<String>();

  void setLoading(bool loading) {
    if (loading != isLoading) loadingSubject.add(loading);
  }

  bool get isLoading => loadingSubject.value;

  void setError(String message) {
    errorSubject.add(message);
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;

  Future showToastNormal(String msg) async {
    await Fluttertoast.showToast(
      msg: msg,
      backgroundColor: NEUTRAL_GREY_5_COLOR,
      textColor: NEUTRAL_GREY_5_COLOR,
      gravity: ToastGravity.BOTTOM,
      toastLength: Toast.LENGTH_SHORT,
    );
  }

  Future showToastError(String msg) async {
    await Fluttertoast.showToast(
      msg: msg,
      backgroundColor: NEUTRAL_ORANGE_5_COLOR,
      textColor: NEUTRAL_GREY_1_COLOR,
      gravity: ToastGravity.BOTTOM,
      toastLength: Toast.LENGTH_LONG,
    );
  }

  Future showToastSuccess(String msg) async {
    await Fluttertoast.showToast(
      msg: msg,
      backgroundColor: NEUTRAL_GREY_1_COLOR,
      textColor: NEUTRAL_ORANGE_5_COLOR,
      gravity: ToastGravity.BOTTOM,
      toastLength: Toast.LENGTH_SHORT,
    );
  }

  @override
  void onClose() async {
    await loadingSubject.drain();
    loadingSubject.close();
    await errorSubject.drain();
    errorSubject.close();
    super.onClose();
  }
}
