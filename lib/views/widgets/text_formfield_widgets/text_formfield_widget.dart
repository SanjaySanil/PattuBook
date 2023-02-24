import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../pages/otp_entry_screen/country_code_picker/country_code_picker.dart';

class TextFormFieldWidget extends StatelessWidget {
  TextFormFieldWidget(
      {Key? key,
      required this.validator,
      required this.onChanged,
      required this.controller,
      this.keyboardType = TextInputType.text,
      required this.hintText})
      : super(key: key);
  final String hintText;
  final TextInputType keyboardType;
  final TextEditingController controller;
  String? Function(String? value) validator;
  String? Function(String value)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        validator: validator,
        onChanged: onChanged,
        controller: controller,
        cursorColor: const Color(0xff00726D),
        keyboardType: keyboardType,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey, width: 2),
            borderRadius:BorderRadius.circular(30)
          ),
          errorBorder:OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red, width: 2),
              borderRadius:BorderRadius.circular(30)
          ),
          prefixStyle: const TextStyle(color: Colors.black),
          prefixIconColor: const Color(0xff00726D),
          prefix: CountryPicker(),
          contentPadding: const EdgeInsets.fromLTRB(10, 4, 0, 4),
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

    );
  }
}
