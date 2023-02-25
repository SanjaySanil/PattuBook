
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {

  RxInt totalBalance=0.obs;
  RxInt totalIncome=0.obs;
  RxInt totalExpense=0.obs;

  getTotalBalance(Map entireData){
    totalBalance.value=0;
    totalExpense.value=0;
    totalIncome.value=0;
    entireData.forEach((key, value) {
      if(value['type']=='income'){
        totalBalance+=(value['amount']as int);
        totalIncome+=(value['amount']as int);
      }
      else{
        totalBalance-=(value['amount']as int);
        totalExpense+=(value['amount']as int);
      }
    });
  }









  final  brightness = SchedulerBinding.instance.window.platformBrightness;
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


  @override
  void update([List<Object>? ids, bool condition = true]) {
    currentThem();
  }

  Future currentThem()async {
    if(brightness==ThemeMode.dark){
      return true;
    }
    else{
      return false;
    }
  }

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
