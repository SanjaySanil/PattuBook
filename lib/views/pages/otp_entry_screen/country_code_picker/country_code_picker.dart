import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopzy/controller/login_screen_controller/conutry_picker_controller.dart';

class CountryPicker extends StatelessWidget {
   CountryPicker({Key? key}) : super(key: key);
 var countryCode;
  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    final countryCodeController = Get.put(CountryPickerController());
    return TextButton(
      onPressed: () {
        showCountryPicker(
          context: context,
          countryListTheme: CountryListThemeData(
            flagSize: 25,
            backgroundColor: isDarkMode ? Colors.black54 : Colors.white,
            textStyle: TextStyle(
                fontSize: 16,
                color: isDarkMode ? Colors.white38 : Colors.black54),
            bottomSheetHeight: 500,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
            inputDecoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: isDarkMode ? Colors.white54 : Colors.black54,
                    width: 2),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xff00726D), width: 2),
              ),
              labelText: 'Search',
              labelStyle: TextStyle(
                  color: isDarkMode ? Colors.white54 : Colors.black54),
              hintText: 'Start typing to search',
              hintStyle: TextStyle(
                  color: isDarkMode ? Colors.white54 : Colors.black54),
              prefixIcon: const Icon(Icons.search),
              prefixIconColor:const Color(0xff00726D),
            ),
          ),
          onSelect: (Country country) =>
              countryCodeController.countryCodes(country.phoneCode),
        );
      },
      child: Obx(
        () => Text(
          "+${countryCodeController.countryCode.value}",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }
}
