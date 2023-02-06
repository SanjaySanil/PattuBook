import 'package:get/get.dart';

class DashboardController extends GetxController {
  static DashboardController get instance => Get.put(DashboardController());

  RxList<Map<String, dynamic>> allUser = (List<Map<String, dynamic>>.of([
    {"id": 1, "name": "Andy", "age": 22},
    {"id": 2, "name": "Anand", "age": 22},
    {"id": 3, "name": "Shihab", "age": 22},
    {"id": 4, "name": "Sanjay", "age": 22},
    {"id": 5, "name": "Andy", "age": 22},
    {"id": 6, "name": "Andy", "age": 22},
    {"id": 7, "name": "Andy", "age": 22},
    {"id": 8, "name": "Andy", "age": 22},
    {"id": 9, "name": "Andy", "age": 22},
    {"id": 10, "name": "Andy", "age": 22},
  ])).obs;
  RxList<Map<String, dynamic>> foundUser =
      (List<Map<String, dynamic>>.of([])).obs;

  RxList<Map<String, dynamic>> result = (List<Map<String, dynamic>>.of([])).obs;

  @override
  void onInit() {
    foundUser.value = allUser;
    // TODO: implement onInit
    super.onInit();
  }

  void runFilter(String keyWord) {
    if (keyWord.isEmpty || keyWord == null) {
      result.value = allUser;
    } else {
      result.value= allUser
          .where((user) =>
              user["name"].toLowerCase().contains(keyWord.toLowerCase()))
          .toList();
      result= foundUser;
    }
  }
}
