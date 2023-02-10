import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  
  static final LatLng companyLatLng = LatLng(
    37.5233273, // 위도
    126.921252, // 경도
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: renderAppBar(),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target:companyLatLng,
          zoom:16,
        ),
      ),
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