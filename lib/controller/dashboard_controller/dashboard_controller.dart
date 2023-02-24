import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  static DashboardController get instance => Get.put(DashboardController());
  List<String> months = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];
  RxInt amount = 0.obs;
  RxString note = "Some Expense".obs;
  RxString type = "Income".obs;
  Rx<DateTime> selectedDate = DateTime.now().obs;

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate.value,
      firstDate: DateTime(2023, 01),
      lastDate: DateTime(2050, 12),
    );
    if (picked != null && picked != selectedDate) {
      selectedDate.value = picked;
    }
  }
}
