import 'dart:async';
import 'package:get/get.dart';
import 'package:shopzy/main.dart';
import 'package:shopzy/services/firebase_auth_repository/authentication_repository.dart';
import 'package:shopzy/services/user_repository/user_repository.dart';

class SignUpController extends GetxController {
  static SignUpController get instance=> Get.find();
  // final userRepos=Get.put(UserRepository());
  RxBool buttonPressed = true.obs;
  RxBool passwordHint=false.obs;

  void isButtonPressed() {
    buttonPressed.value = !buttonPressed.value;
    Timer(const Duration(seconds: 1), () {
      buttonPressed.value = true;
      print("hii");
    });
  }

  void registerUser(String email,String password)async{
   final value= AuthenticationRepository.instance.createUserWithEmailPassword(email, password);
   if(AuthenticationRepository.firebaseUser.value!=null){
     // await userRepos.createUser(user);
     Get.toNamed(Routes.dashBoard);
   }
    }
}
