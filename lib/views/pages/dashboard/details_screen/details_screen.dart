import 'package:flutter/material.dart';
import 'package:shopzy/controller/dashboard_controller/dashboard_controller.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(130),
        child: AppBar(
          titleSpacing: 0,
          title: Row(
            children: [
              const CircleAvatar(
                radius: 25,
                backgroundColor: Colors.grey,
              ),
              const SizedBox(width: 15),
              Text(
                DashboardController.instance.foundUser[index]["name"],
              ),
            ],
          ),
          excludeHeaderSemantics: true,
          flexibleSpace: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.only(left: 12, right: 12),
                margin: const EdgeInsets.all(12),
                height: 50,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text("You will give"), Text("250")],
                ),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) => Container(),
            ),
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: null,
                child: Text("You Give"),
              ),
              ElevatedButton(onPressed: null, child: Text("You Got"))
            ],
          )
        ],
      ),
    );
  }
}
