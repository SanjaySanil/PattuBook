import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopzy/main.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance =>
      Get.put(AuthenticationRepository());
  final _auth = FirebaseAuth.instance;
  static late final Rx<User?> firebaseUser;

  @override
  void onReady() {
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitializeScreen);
  }

  _setInitializeScreen(User? user) {
    user != null
        ? Get.offAllNamed(Routes.dashBoard)
        : Get.offAllNamed(Routes.onBoardingScreen);
  }

  Future<void> createUserWithEmailPassword(
      String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      firebaseUser.value != null
          ? Get.offAllNamed(Routes.dashBoard)
          : Get.toNamed(Routes.loginSignUp);
    } catch (e) {
      Get.snackbar("Error", e.toString(),backgroundColor:Colors.red);
      print("Firebase Exception  ${e}");
    }
  }

  Future<void> loginUserWithEmailPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      if (e == 'email-already-in-use')
        Get.snackbar("Error", "Email is already in use ",backgroundColor:Colors.red);
      else {
        Get.snackbar("Error", e.toString(),backgroundColor:Colors.red);
      }
      print("Firebase Exception  ${e}");
    }
  }

  Future<void> logout() async {
    await _auth.signOut();
    Get.offAllNamed(Routes.loginScreen);
  }

  var verificationId = "".obs;
  int? resendTokenId;

  Future<void> phoneAuthentication(String phoneNo) async {
    try {
      await _auth.verifyPhoneNumber(
        timeout: const Duration(seconds: 60),
        phoneNumber: phoneNo,
        forceResendingToken: resendTokenId,
        verificationCompleted: (credentials) async {
          await _auth.signInWithCredential(credentials);
        },
        verificationFailed: (e) {
          if (e.code == 'invalid-phone-number') {
            Get.snackbar("Error", "The Provide Phone Number is not valid",
                backgroundColor: Colors.red);
          } else {
            Get.snackbar("Error", "Something went wrong ,Try again",
                backgroundColor: Colors.red);
          }
        },
        codeSent: (verificationId, int? resendToken) {
          this.verificationId.value = verificationId;
          resendTokenId = resendToken;
        },
        codeAutoRetrievalTimeout: (verificationId) {
          this.verificationId.value = verificationId;
        },
      );
    } catch (e) {
      Get.snackbar("error", e.toString(), backgroundColor: Colors.red);
    }
  }

  Future<bool> verifyOtp(String otp) async {
    late bool value;
    try {
      var credentials = await _auth.signInWithCredential(
          PhoneAuthProvider.credential(
              verificationId: verificationId.value, smsCode: otp));
      value = credentials.user != null ? true : false;
    } catch (e) {
      Get.snackbar("Error", e.toString(),backgroundColor:Colors.red);
    }
    return value;
  }
}
