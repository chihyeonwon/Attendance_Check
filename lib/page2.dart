import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Page2 extends StatefulWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {

  late SharedPreferences prefs;

  Future initPrefs() async {
    prefs = await SharedPreferences.getInstance(); // 사용자의 저장소에 connection
  }

  @override
  void initState() {
    super.initState();
    initPrefs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}
