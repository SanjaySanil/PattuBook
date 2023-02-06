
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AuthRepository extends GetxController {
  String userUid = '';
  var verId = '';
  int? resendTokenId;
  bool phoneAuthCheck = false;
  dynamic credentials;

  phoneAuth(String phone) async {
    try {
      credentials = null;
      await FirebaseAuth.instance.verifyPhoneNumber(
          phoneNumber: phone,
          timeout:const Duration(seconds:60),
          verificationCompleted: (PhoneAuthCredential credential) async {
            credentials = credential;
            await FirebaseAuth.instance.signInWithCredential(credentials);
          },
          forceResendingToken: resendTokenId,
          verificationFailed: (FirebaseAuthException e) {
            if (e.code == 'invalid-phone-number') {
              debugPrint('The provided phone number is not Valid');
            }
          },
          codeSent: (String verificationId, int?resendToken) {
            verId=verificationId;
            resendTokenId=resendToken;
          },
          codeAutoRetrievalTimeout:(String verificationId){

          });
    }
    catch (e) {}
  }


}