import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopzy/views/pages/dashboard/add_transactions/add_transcations.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("E-wallet"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton.extended(
        label:Text("Add new entry"),
        shape:RoundedRectangleBorder(borderRadius:BorderRadius.circular(25)),
        onPressed: () {
          Get.to(()=>AddTransactions());
        },
      ),
      body: Center(
        child: Text("No data"),
      ),
    );
  }
}
