import 'package:geolocator/geolocator.dart';

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
      body: FutureBuilder<String> (
       future: checkPermission(),
        builder: (context, snapshot) {
         // 로딩 상태일 때
          if(!snapshot.hasData && snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child:CircularProgressIndicator(),
            );
          }
          // 권한이 허가된 상태
          if(snapshot.data == '위치 권한이 허가 되었습니다.'){
            // 기존 Column 위젯 코드
            return Column(
              children: [
                Expanded(
                  flex:2,
                  child: GoogleMap(
                    initialCameraPosition: CameraPosition(
                      target:companyLatLng,
                      zoom:16,
                    ),
                  ),
                ),
                Expanded( // 1/3만큼 공간 차지
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:[
                          Icon( // 시계아이콘
                            Icons.timelapse_outlined,
                            color:Colors.blue,
                            size:50.0,
                          ),
                          const SizedBox(
                            height:20.0,
                          ),
                          ElevatedButton( // 출근하기 버튼
                            onPressed: (){ },
                            child:Text('출근하기!'),
                          ),
                        ],
                    ),
                ),
              ],
            );
          }
          // 권한이 없는 상태
          return Center(
            child:Text(
              snapshot.data.toString(),
            ),
          );
        }
      )
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

Future<String> checkPermission() async {
  final isLocationEnabled = await Geolocator.isLocationServiceEnabled();

  if(!isLocationEnabled) { // 위치 서비스 활성화 안됨
    return '위치 서비스를 활성화해주세요.';
  }

  LocationPermission checkedPermission = await Geolocator.checkPermission(); // 위치 권한 확인

  if(checkedPermission == LocationPermission.denied) { // 위치 권한 거절됨
    // 위치 권한 요청하기
    checkedPermission = await Geolocator.requestPermission();

    if(checkedPermission == LocationPermission.denied) {
      return '위치 권한을 허가해주세요.';
    }
  }

  // 위치 권한 거절됨 (앱에서 재요청 불가)
  if(checkedPermission == LocationPermission.deniedForever) {
    return '앱의 위치 권한을 설정에서 허가해주세요.';
  }

  // 위 모든 조건이 통과되면 위치 권한 허가 완료
  return '위치 권한이 허가되었습니다.';
}

