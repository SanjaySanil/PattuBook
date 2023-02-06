import 'package:get/get.dart';
import 'package:shopzy/services/firebase_auth_repository/authentication_repository.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.put(LoginController());
  static AuthenticationRepository repository =
      Get.put(AuthenticationRepository());

  void phoneAuthentication(String phoneNumber) {
    AuthenticationRepository.instance.phoneAuthentication(phoneNumber);
  }
  void loginWithEmailPassword(String email ,String password){
    AuthenticationRepository.instance.loginUserWithEmailPassword(email, password);
  }
}
