import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopzy/models/user_model.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();
  final _db = FirebaseFirestore.instance;

  createUser(UserModel userModel) async {
    await _db
        .collection("User")
        .add(userModel.toJson())
        .whenComplete(
          () => Get.snackbar("Success", "Account created successfully",
              snackPosition: SnackPosition.BOTTOM),
        )
        .catchError((error, stackTrace) {
      Get.snackbar(
        "Error",
        "Someting went wrong .Try again",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.withOpacity(0.1),
      );
      print(error.toString());
    });
  }
}
