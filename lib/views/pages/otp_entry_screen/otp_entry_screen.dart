import 'package:flutter/material.dart';
import 'package:shopzy/controller/login_screen_controller/conutry_picker_controller.dart';
import 'package:shopzy/controller/login_screen_controller/login_screen_controller.dart';
import 'package:shopzy/views/pages/otp_screen/otp_screen.dart';
import '../../widgets/text_formfield_widgets/text_formfield_widget.dart';
import 'package:get/get.dart';

class LoginSignUp extends StatelessWidget {
  LoginSignUp({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final  textEditingController = TextEditingController();
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        padding: const EdgeInsets.all(20),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SafeArea(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Registration",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const SizedBox(height: 20),
                Text(
                  "We will send a One Time Code on your phone number",
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                TextFormFieldWidget(
                  onChanged: (value) {
                    _formKey.currentState?.validate();
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter a phone number";
                    } else if (!RegExp(
                            r'^\s*(?:\+?(\d{ 1,3}))?[-.(]*(\d{3})[-.)]*(\d{3})[-.]*(\d{4})(?: *x(\d+))?\s*$')
                        .hasMatch(value)) {
                      return "Please enter a valid phone number";
                    }
                    ;
                  },
                  controller: textEditingController,
                  hintText: "Enter you Phone Number",
                  keyboardType: const TextInputType.numberWithOptions(),
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff00726D),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        LoginController.instance.phoneAuthentication(
                            "+${CountryPickerController.instance.countryCode + textEditingController.value.text.trim()}");
                        Get.to(
                          OtpScreen(
                            phoneNumber:
                                "+${CountryPickerController.instance.countryCode + textEditingController.value.text.trim()}",
                          ),
                        );
                        textEditingController.clear();
                      }
                    },
                    child: const Text("GET OTP"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
