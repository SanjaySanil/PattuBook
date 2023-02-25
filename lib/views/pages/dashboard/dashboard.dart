import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:shopzy/controller/dashboard_controller/dashboard_controller.dart';
import 'package:shopzy/services/hive_db/hive_db.dart';
import 'package:shopzy/views/pages/dashboard/add_transactions/add_transcations.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    var brightness = SchedulerBinding.instance.window.platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    final hiveDb = HiveDb();
    return Scaffold(
      resizeToAvoidBottomInset: true,
      floatingActionButton: FloatingActionButton.extended(
        label: Text("Add new entry"),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        onPressed: () {
          Get.to(() => AddTransactions())?.whenComplete(() {setState(() {

          });});
        },
      ),
      body: FutureBuilder<Map>(
        future: hiveDb.fetch(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text("UnExpected Error!"));
          }
          if (snapshot.hasData) {
            if (snapshot.data!.isEmpty) {
              return Center(child: Text("No Values Found!"));
            }
            DashboardController.instance.getTotalBalance(snapshot.data!);
            return Obx(()=>
                SingleChildScrollView(
                  child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: isDarkMode
                          ? [Colors.redAccent, Colors.red, Colors.pinkAccent]
                          : [Colors.blueGrey, Colors.lightBlue, Colors.blue],
                    ),
                  ),
                  child: SafeArea(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                Icons.menu,
                                size: 32,
                              ),
                              Text(
                                "Sanjay",
                                style: Theme.of(context).textTheme.headlineMedium,
                              ),
                              Icon(
                                Icons.settings,
                                size: 32,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        Column(
                          children: [
                            Text(
                              "Total Balance ",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20),
                            ),
                            SizedBox(height: 10),
                            Text(
                              "Rs ${DashboardController.instance.totalBalance}",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              cardIncome(DashboardController.instance.totalIncome.toString()),
                              cardExpense(DashboardController.instance.totalExpense.toString()),
                            ],
                          ),
                        ),
                        Spacer(),
                        Container(
                          height: MediaQuery.of(context).size.height * .6,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: isDarkMode ? Colors.black87 : Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40),
                              topRight: Radius.circular(40),
                            ),
                          ),
                          child: ListView(
                            children: [],
                          ),
                        ),
                      ],
                    ),
                  ),
              ),
                ),
            );
          } else {
            return Center(
              child: Text("Unexpected error"),
            );
          }
        },
      ),
    );
  }

  Widget cardIncome(String value) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white70,
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          padding: EdgeInsets.all(6),
          child: Icon(
            Icons.arrow_downward,
            size: 30,
            color: Colors.green,
          ),
          margin:EdgeInsets.only(right:10),
        ),
        Column(
          crossAxisAlignment:CrossAxisAlignment.start,
          children: [
            Text("Income",style:TextStyle(fontWeight:FontWeight.w300,color:Colors.white,fontSize:16),),
            Text(value,style:TextStyle(fontWeight:FontWeight.w500,color:Colors.white,fontSize:20)),
          ],
        )
      ],
    );
  }

  Widget cardExpense(String value) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white70,
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          padding: EdgeInsets.all(6),
          child: Icon(
            Icons.arrow_upward,
            size: 30,
            color: Colors.red,
          ),
          margin:EdgeInsets.only(right:10),
        ),
        Column(
          crossAxisAlignment:CrossAxisAlignment.start,
          children: [
            Text("Expense",style:TextStyle(fontWeight:FontWeight.w300,color:Colors.white,fontSize:16),),
            Text(value,style:TextStyle(fontWeight:FontWeight.w500,color:Colors.white,fontSize:20)),
          ],
        )
      ],
    );
  }
}
