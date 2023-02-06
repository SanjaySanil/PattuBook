import 'package:flutter/material.dart';
class HeaderBalanceSection extends StatelessWidget {
  const HeaderBalanceSection({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(color: Colors.grey, blurRadius: 5),
        ],
        color: Color(0xff00726D),
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      margin: const EdgeInsets.all(20),
      height: height * .08,
      width: width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '₹ $myNumber',
                style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
              Text(
                "You Should give",
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ],
          ),
          VerticalDivider(color:Colors.grey,thickness:1,endIndent:5,indent:5),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '₹ $myNumber',
                style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
              Text(
                "You will get",
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ],
          ),
          VerticalDivider(color:Colors.grey,thickness:1,endIndent:5,indent:5),
          TextButton(onPressed: () {}, child: Text("View Report"))
        ],
      ),
    );
  }
}
var myNumber=numberFormat(1220);
String numberFormat(int n) {
  String num = n.toString();
  int len = num.length;

  if (n >= 1000 && n < 1000000) {
    return num.substring(0, len - 3) + '.' + num.substring(len - 3, 1 + (len - 3)) + 'k';
  } else if (n >= 1000000 && n < 1000000000) {
    return num.substring(0, len - 6) + '.' + num.substring(len - 6, 1 + (len - 6)) + 'm';
  } else if (n > 1000000000) {
    return num.substring(0, len - 9) + '.' + num.substring(len - 9, 1 + (len - 9)) + 'b';
  } else {
    return num.toString();
  }
}