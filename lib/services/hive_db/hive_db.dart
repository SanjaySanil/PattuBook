import 'package:hive_flutter/hive_flutter.dart';

class HiveDb {
  late Box box;

  HiveDb() {
    openBox();
  }

  openBox() {
    box = Hive.box('money');
  }

  Future addData(int amount, DateTime date, String note, String type) async {
    var value = {
      'note': note,
      'type': type,
      'amount': amount,
      'date': date,
    };
    box.add(value);
  }
  Future<Map> fetch(){
    if(box.values.isEmpty){
      return Future.value({});
    }
    else{
      return Future.value(box.toMap());
    }
  }
}
