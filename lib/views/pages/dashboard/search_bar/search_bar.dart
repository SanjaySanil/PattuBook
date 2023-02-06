import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:shopzy/controller/dashboard_controller/dashboard_controller.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12),
      child: TextFormField(
        onChanged:(value){
           DashboardController.instance.runFilter(value);
        },
        decoration:InputDecoration(
          hintText: "Search",
          prefixIcon:Icon(Icons.search),
          focusedBorder:OutlineInputBorder(),
          border:OutlineInputBorder()
        ),
      ),
    );
  }}

