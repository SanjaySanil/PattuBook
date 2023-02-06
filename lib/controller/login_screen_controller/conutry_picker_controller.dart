import 'package:get/get.dart';

class CountryPickerController extends GetxController{
  static CountryPickerController get instance=> Get.put(CountryPickerController());
  RxString countryCode="91".obs;
  String country="";
  void countryCodes(String cd){
    countryCode.value=cd;
  }
}