import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopzy/controller/dashboard_controller/dashboard_controller.dart';
import 'package:shopzy/views/pages/dashboard/search_bar/search_bar.dart';

import 'details_screen/details_screen.dart';
import 'header_balance_section/header_balance_section.dart';

class Dashboard extends StatelessWidget {
  Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      floatingActionButton: FloatingActionButton.extended(
          label: Text("Add New entry"),
          isExtended: true,
          onPressed: () {
            Get.bottomSheet(BottomSheet(
              constraints: BoxConstraints(
                  maxHeight: 300, maxWidth: double.infinity, minHeight: 300),
              onClosing: () {},
              builder: (context) => Container(),
            ));
          },
          icon: Icon(Icons.person_add)),
      appBar: AppBar(
        title: Text("PattuBook"),
        centerTitle: true,
        elevation: 0,
        leading: IconButton(icon: const Icon(Icons.menu), onPressed: () {}),
      ),
      body: Column(
        children: [
          HeaderBalanceSection(height: height, width: width),
          SearchBar(),
          Expanded(
            child: Obx(
              () => DashboardController.instance.foundUser.value.isNotEmpty
                  ? ListView.builder(
                      itemCount: DashboardController.instance.foundUser.length,
                      itemBuilder: (context, index) => GestureDetector(
                        onTap:(){
                          Get.to(DetailsScreen(index: index,),);
                        },
                        child: Card(
                          child: ListTile(
                            title: Text(DashboardController
                                .instance.foundUser[index]["name"]),
                            subtitle: Text(DashboardController
                                .instance.foundUser[index]["age"]
                                .toString()),
                            leading: Text(DashboardController
                                .instance.foundUser[index]["id"]
                                .toString()),
                          ),
                        ),
                      ),
                    )
                  : Text("No User Found"),
            ),
          ),
        ],
      ),
    );
  }
}
