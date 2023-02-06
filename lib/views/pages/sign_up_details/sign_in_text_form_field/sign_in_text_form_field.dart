import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopzy/controller/sign_up_controller/sign_up_controller.dart';

class SignInTextFormField extends StatelessWidget {
   SignInTextFormField(
      {Key? key,
        required this.formKey,
      required this.onChanged,
      required this.controller,
      required this.validator,
      required this.iconData,
      required this.hintText,
      required this.suffixIcon})
      : super(key: key);
  final String hintText;
  final bool suffixIcon;
  final IconData iconData;
  final TextEditingController controller;
  String? Function(String? value) validator;
  String? Function(String value)? onChanged;
   Key formKey;
  @override
  Widget build(BuildContext context) {
    SignUpController signUpController = Get.put(SignUpController());
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Obx(
        () => Form(
          key: formKey,
          child: TextFormField(
            onChanged: onChanged,
            validator: validator,
            controller: controller,
            cursorColor: const Color(0xff00726D),
            keyboardType: TextInputType.text,
            obscureText: suffixIcon
                ? signUpController.buttonPressed.value
                : signUpController.buttonPressed.value &&
                    !signUpController.buttonPressed.value,
            decoration: InputDecoration(
              iconColor: const Color(0xff00726D),
              suffixIcon: suffixIcon
                  ? InkWell(
                      onLongPress: () {
                        signUpController.isButtonPressed();
                      },
                      onTap: () {
                        signUpController.isButtonPressed();
                      },
                      child: Icon(
                        signUpController.buttonPressed.value
                            ? CupertinoIcons.eye
                            : CupertinoIcons.eye_slash,
                      ),
                    )
                  : Icon(iconData),
              border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey, width: 2),
                  borderRadius: BorderRadius.circular(30)),
              errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.red, width: 2),
                  borderRadius: BorderRadius.circular(30)),
              prefixStyle: const TextStyle(color: Colors.black),
              prefixIconColor: const Color(0xff00726D),
              contentPadding: const EdgeInsets.fromLTRB(30, 5, 0, 5),
              labelText: hintText,
              labelStyle: TextStyle(color: Colors.grey.shade600),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.grey, width: 2),
                borderRadius: BorderRadius.circular(30),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(
                  width: 2,
                  color: Color(0xff00726D),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
