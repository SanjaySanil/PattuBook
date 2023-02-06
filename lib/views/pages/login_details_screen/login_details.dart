import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopzy/controller/login_screen_controller/login_screen_controller.dart';
import 'package:shopzy/main.dart';
import '../sign_up_details/sign_in_text_form_field/sign_in_text_form_field.dart';

class LoginDetails extends StatelessWidget {
  LoginDetails({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  final _formKey1 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    final controller1 = TextEditingController();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Form(
              child: Column(
                children: [
                  Text(
                    "Login",
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  const SizedBox(height: 30),
                  SignInTextFormField(
                      formKey: _formKey,
                      controller: controller,
                      onChanged: (value) {
                        _formKey.currentState?.validate();
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
                      hintText: "Email",
                      iconData: Icons.email_outlined,
                      suffixIcon: false),
                  SignInTextFormField(
                      formKey: _formKey1,
                      controller: controller1,
                      onChanged: (value) {
                        _formKey1.currentState?.validate();
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter a password";
                        } else if (!RegExp(
                                r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                            .hasMatch(value)) {
                          return "Please enter a valid password";
                        }
                        ;
                      },
                      hintText: "Password",
                      iconData: Icons.person,
                      suffixIcon: true),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Forgot Password",
                          style: TextStyle(color: Colors.red, fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff00726D)),
                      onPressed: () {
                        if (_formKey1.currentState!.validate() &&
                            _formKey.currentState!.validate()){
                          LoginController.instance.loginWithEmailPassword(
                            controller.text.trim(),
                            controller1.text.trim(),
                          );
                        }
                      },
                      child: const Text("Login"),
                    ),
                  ),
                  const SizedBox(height: 30),
                  SizedBox(height:20),
                  Row(
                    crossAxisAlignment:CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                     Text("Dont have Account?")  ,
                      TextButton(onPressed:(){
                        Get.toNamed(Routes.signUpScreen);
                      }, child:Text("SignIn"),),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
