import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home_screen.dart';

class Page2 extends StatefulWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {

  late SharedPreferences prefs;

  Future getPrefs() async {
    prefs = await SharedPreferences.getInstance(); // 사용자의 저장소에 connection
    final int? counter = prefs.getInt('attendanceCount');
    return Text(
      '${counter}',
      style:TextStyle(fontSize:100.0),
    );
  }

  @override
  void initState() {
    super.initState();
    getPrefs();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Row(
        children: [
          Text(
            '등교한 횟수 : ',
            style: TextStyle(fontSize: 50.0),
          ),
          FutureBuilder(
           future: getPrefs(),
           builder:(context, snapshot) {
           return snapshot.data;
           }
          ),
        ],
      ),
      );
  }
}
