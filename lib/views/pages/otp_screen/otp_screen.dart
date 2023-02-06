import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:shopzy/controller/login_screen_controller/otp_controller/otp_controller.dart';
import 'package:shopzy/services/firebase_auth_repository/authentication_repository.dart';

class OtpScreen extends StatelessWidget {
  OtpScreen({Key? key, required this.phoneNumber}) : super(key: key);
  final String phoneNumber;
  var otp;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(20),
        child: SafeArea(
          child: Column(
            children: [
              Text(
                "Verification",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(height: 10),
              Text(
                "Enter the otp sent to ${phoneNumber} ",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 30),
          OtpTextField(
                  decoration:
                      const InputDecoration(labelStyle: TextStyle(color: Colors.black)),
                  cursorColor: const Color(0xff00726D),
                  numberOfFields: 6,
                  enabledBorderColor: const Color(0xff00726D),
                  borderColor: const Color(0xff00726D),
                  showFieldAsBox: true,
                  onCodeChanged: (String code) {
                  },
                  onSubmit: (code) {
                    otp=code;
                      OtpController.instance.verifyOtp(otp);
                  }, // end onSubmit
                ),
              const SizedBox(height: 20),
              SizedBox(
                height: 50,
                width: double.infinity,
                child:
                   ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff00726D),
                    ),
                    onPressed: () {
                        OtpController.instance.verifyOtp(otp);
                        print("Otp is = $otp}");
                    },
                    child: const Text("Get Start"),
                  ),
                ),
              const SizedBox(height: 30),
              Text("Didn't you receive any code",
                  style: Theme.of(context).textTheme.bodySmall),
              Obx(
                () => OtpController.instance.timeCompleted.value
                    ? TextButton(
                        onPressed: () {
                          AuthenticationRepository.instance.phoneAuthentication(
                            phoneNumber,
                          );
                          OtpController.instance.startCountDown();
                          OtpController.instance.timeCompleted.value=false;
                        },
                        child: const Text(
                          "Resend New Code",
                          style: TextStyle(
                            color: Color(0xff00726D),
                          ),
                        ),
                      )
                    : Text(
                        "Resend New Code in ${OtpController.instance.timeLeft}"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
