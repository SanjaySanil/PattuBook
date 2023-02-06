import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:shopzy/consts/image_const.dart';
import 'package:shopzy/consts/string_const.dart';
import 'package:shopzy/controller/on_boarding_controller/on_boarding_controller.dart';
import 'package:shopzy/views/pages/on_boariding_screen/on_boarding_content/on_boarding_content.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../otp_entry_screen/otp_entry_screen.dart';

class OnBoardingScreen extends StatelessWidget {
  List<Widget> pages = [
    OnBoardingContent(
        color: const Color(0xffEBD5C5),
        subtitle:
            "We make it fast and easy to get the products you want and love. ShippingCart is the #1 trusted international shipping consolidation provider in the India. We combine multiple packages from the US,UK into one shipment, helping our customers save up to 70% on their shipping costs.",
        title: "Explaore many products",
        image: OnBoardingImages.imgA),
    OnBoardingContent(
        color: const Color(0xffF2B49B),
        subtitle:
            "Although 61% of shoppers would rather shop with brands that also have a physical location over brands that are online only, more than 70% of surveyed consumers said the checkout experience is their biggest pain point.",
        title: "Choose and checkout",
        image: OnBoardingImages.imgB),
    OnBoardingContent(
        color: const Color(0xffF5E9D3),
        subtitle:
            "Free delivery, early access during sales and shopping festivals, exchange offers and priority customer service are the top benefits to a Shopzy Plus member. ",
        title: "Get it delivered",
        image: OnBoardingImages.imgC),
  ];
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final obController = OnBoardingController();
    return SafeArea(
      child: Stack(
        alignment: Alignment.center,
        children: [
          LiquidSwipe(
            initialPage: 0,
            liquidController: obController.controller,
            onPageChangeCallback: obController.onPageChangedCallback,
            pages: pages,
          ),
          Positioned(
            bottom: 65,
            left: 20,
            child: Obx(
              () => AnimatedSmoothIndicator(
                activeIndex: obController.currentPage.value,
                count: 3,
                effect: const WormEffect(
                    dotHeight: 10, spacing: 8.0, activeDotColor: Colors.white),
              ),
            ),
          ),
          Positioned(
            top: 10,
            right: 20,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
              onPressed: () {
                obController.skip();
              },
              child: const Text(OnBoardingStrings.skip),
            ),
          ),
          Positioned(
            bottom: 50,
            right: 20,
            child: Obx(
              () => SizedBox(
                height: height * .05,
                width: width * .5,
                child: ElevatedButton(
                  onPressed: () {
                    obController.animateToNextSlide();
                    if (obController.currentPage.value == 2) {
                      Get.offAll(LoginSignUp());
                    }
                  },
                  child: Text(
                    obController.currentPage.value == 2
                        ? OnBoardingStrings.getStarted
                        : OnBoardingStrings.next,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
