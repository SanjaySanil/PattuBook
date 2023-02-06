import 'dart:async';

import 'package:get/get.dart';
import 'package:shopzy/services/firebase_auth_repository/authentication_repository.dart';
import 'package:shopzy/views/pages/dashboard/dashboard.dart';
import 'package:shopzy/views/pages/otp_entry_screen/otp_entry_screen.dart';
import 'package:shopzy/views/pages/sign_up_details/sign_up_details.dart';

class OtpController extends GetxController {
  static OtpController get instance => Get.put(OtpController());
  RxInt timeLeft=60.obs;
  RxBool timeCompleted=true.obs;
  void startCountDown(){
    Timer.periodic(const Duration(seconds:1), (timer) {
      if(timeLeft>0){
        timeLeft.value--;
      }
      else{
        timer.cancel();
        timeCompleted.value=true;
      }
    });
  }
  void verifyOtp(String otp) async {
    try{
      var isVerified = await AuthenticationRepository.instance.verifyOtp(otp);
      isVerified
          ? Get.offAll(SignupDetails())
          : Get.snackbar("Error", "Enter valid otp");
    }
    catch(e){
      print(e);
    }

  }
}
