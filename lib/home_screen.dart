import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: renderAppBar(),
      body: Text('Home Screen'),
    );
  }
}

AppBar renderAppBar() {
  //AppBar를 구현하는 함수
  return AppBar(
    centerTitle:true,
    title:Text(
      '오늘도 출근',
      style:TextStyle(
        color:Colors.blue,
        fontWeight:FontWeight.w700,
      ),
    ),
    backgroundColor:Colors.white,
  );
}