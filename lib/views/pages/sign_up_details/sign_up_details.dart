import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopzy/controller/sign_up_controller/sign_up_controller.dart';
import 'package:shopzy/main.dart';
import 'package:shopzy/models/user_model.dart';
import 'sign_in_text_form_field/sign_in_text_form_field.dart';

class SignupDetails extends StatelessWidget {
  SignupDetails({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  final _formKey1 = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  final _formKey3 = GlobalKey<FormState>();
  final controller = TextEditingController();
  final controller1 = TextEditingController();
  final controller2 = TextEditingController();
  final controller3 = TextEditingController();
  bool info = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Text(
                  "Sign Up",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const SizedBox(height: 30),
                SignInTextFormField(
                    formKey: _formKey,
                    controller: controller,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please enter your name";
                      }
                      ;
                    },
                    onChanged: (value) {
                      _formKey.currentState?.validate();
                    },
                    hintText: "Full Name",
                    iconData: Icons.person,
                    suffixIcon: false),
                SignInTextFormField(
                    formKey: _formKey1,
                    onChanged: (value) {
                      _formKey1.currentState?.validate();
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please enter a your email";
                      } else if (!RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value)) {
                        return "Please enter a valid email";
                      }
                      ;
                    },
                    controller: controller1,
                    hintText: "Email",
                    iconData: Icons.email_outlined,
                    suffixIcon: false),
                SignInTextFormField(
                    formKey: _formKey2,
                    controller: controller2,
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
                    onChanged: (value) {
                      _formKey2.currentState?.validate();
                    },
                    hintText: "Phone No",
                    iconData: Icons.phone,
                    suffixIcon: false),
                Obx(
                  () => Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: SignInTextFormField(
                            formKey: _formKey3,
                            onChanged: (value) {
                              _formKey3.currentState?.validate();
                              _formKey3.currentState!.validate()
                                  ? SignUpController
                                      .instance.passwordHint.value = false
                                  : SignUpController
                                      .instance.passwordHint.value = true;
                              ;
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please enter a password";
                              } else if (!RegExp(
                                      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                                  .hasMatch(value)) {
                                return "invalid password format";
                              }
                              ;
                            },
                            controller: controller3,
                            hintText: "Password",
                            iconData: Icons.person,
                            suffixIcon: true),
                      ),
                      SignUpController.instance.passwordHint.value
                          ? IconButton(
                              onPressed: () {
                                Get.defaultDialog(
                                  actions: [
                                    const Text(
                                        style: TextStyle(color: Colors.white),
                                        "• Anything from A to Z counts. You might be required to mix uppercase and lowercase versions."),
                                    const Align(
                                      alignment:
                                          AlignmentDirectional.centerStart,
                                      child: Text(
                                        style: TextStyle(color: Colors.white),
                                        "• Anything from 0 to 10 works.",
                                        textAlign: TextAlign.start,
                                      ),
                                    ),
                                    const Text(
                                        style: TextStyle(color: Colors.white),
                                        "• Unusual symbols from dashes to dollar signs to parenthesis are included."),
                                  ],
                                  middleText: "Password Should Contain",
                                  title: "Info",
                                  backgroundColor: const Color(0xff00726D),
                                  titleStyle:
                                      const TextStyle(color: Colors.white),
                                  middleTextStyle: const TextStyle(
                                    color: Colors.white,
                                  ),
                                );
                              },
                              icon: const Icon(
                                Icons.info_outline,
                                color: Colors.red,
                              ),
                            )
                          : SizedBox(),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff00726D)),
                    onPressed: () {
                      if (_formKey.currentState!.validate() &&
                          _formKey1.currentState!.validate() &&
                          _formKey2.currentState!.validate() &&
                          _formKey3.currentState!.validate()) {
                        final user = UserModel(
                            phoneNo: controller2.text.trim(),
                            email: controller1.text.trim(),
                            fullName: controller.text.trim(),
                            password: controller3.text.trim());
                        SignUpController.instance.registerUser(controller1.text.trim(),controller3.text.trim(),user);
                      }
                    },
                    child: const Text("Sign Up"),
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have account?"),
                    TextButton(
                      onPressed: () {
                        Get.toNamed(Routes.loginScreen);
                      },
                      child: const Text("Login"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
