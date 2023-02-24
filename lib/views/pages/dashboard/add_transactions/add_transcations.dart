import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shopzy/controller/dashboard_controller/dashboard_controller.dart';
import 'package:shopzy/services/hive_db/hive_db.dart';

class AddTransactions extends StatelessWidget {
  const AddTransactions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Obx(
        () => ListView(
          padding: EdgeInsets.all(12),
          children: [
            Text("Add Transcations",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineMedium),
            SizedBox(height: 20),
            RefactoredTextFormField(
              type: true,
              onChanged: (val) {
                try {
                  DashboardController.instance.amount.value = int.parse(val);
                } catch (e) {}
              },
              hintText: "0",
              iconData: Icons.attach_money,
            ),
            SizedBox(height: 10),
            RefactoredTextFormField(
              onChanged: (val) {
                try {
                  DashboardController.instance.note.value = val;
                } catch (e) {}
              },
              iconData: Icons.description_outlined,
              hintText: "Note on transcatin",
              textInputType: TextInputType.text,
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.only(left: 10, right: 5, top: 10, bottom: 10),
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.grey),
              ),
              child: Row(
                children: [
                  Icon(Icons.select_all),
                  SizedBox(width: 20),
                  ChoiceChip(
                    label: Text("Income"),
                    selected:
                        DashboardController.instance.type.value == "income"
                            ? true
                            : false,
                    selectedColor:
                        DashboardController.instance.type.value == "income"
                            ? Colors.red
                            : Colors.grey,
                    onSelected: (val) {
                      if (val) {
                        DashboardController.instance.type.value = "income";
                      }
                    },
                  ),
                  SizedBox(width: 20),
                  ChoiceChip(
                    label: Text("Expense"),
                    selected:
                        DashboardController.instance.type.value == "Expense"
                            ? true
                            : false,
                    selectedColor:
                        DashboardController.instance.type.value == "Expense"
                            ? Colors.red
                            : Colors.grey,
                    onSelected: (val) {
                      if (val) {
                        DashboardController.instance.type.value = "Expense";
                      }
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.only(left: 10, right: 5, top: 10, bottom: 10),
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.grey),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.date_range,
                    color: Colors.grey,
                  ),
                  SizedBox(width: 20),
                  TextButton(
                    onPressed: () {
                      DashboardController.instance.selectDate(context);
                    },
                    child: Text(
                        "${DashboardController.instance.selectedDate.value.day} ${DashboardController.instance.months[DashboardController.instance.selectedDate.value.month - 1]}}"),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  if (DashboardController.instance.amount.value != null &&
                      DashboardController.instance.note.value.isNotEmpty) {
                    final hiveDb = HiveDb();
                    hiveDb.addData(
                        DashboardController.instance.amount.value,
                        DashboardController.instance.selectedDate.value,
                        DashboardController.instance.note.value,
                        DashboardController.instance.type.value);
                  } else {
                    print("Not all values added");
                  }
                },
                child: Text("Add"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RefactoredTextFormField extends StatelessWidget {
  const RefactoredTextFormField({
    this.type = false,
    required this.onChanged,
    this.textInputType = TextInputType.number,
    required this.iconData,
    required this.hintText,
    super.key,
  });

  final String hintText;
  final IconData iconData;
  final TextInputType textInputType;
  final Function(String)? onChanged;
  final bool type;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      keyboardType: textInputType,
      inputFormatters: [
        type
            ? FilteringTextInputFormatter.digitsOnly
            : FilteringTextInputFormatter.singleLineFormatter
      ],
      decoration: InputDecoration(
        prefixIcon: Icon(iconData),
        hintText: hintText,
        border: OutlineInputBorder(),
      ),
      style: TextStyle(fontSize: 24),
    );
  }
}
