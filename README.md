# Attendance_Check 출석체크 앱 프로젝트

```
개발 툴 : Flutter
개발 언어 : Dart
개발 일시 : 2023-02-09 ~
개발자 : Won Chi Hyeon
```

## 앱 개요
```
기능 : 구글 지도를 활용해서 지도 UI를 구현합니다.
       현재 위치로 이동 버튼을 눌러서 GPS 상의 현재 위치로 이동합니다.
       출근 가능한 위치로 이동하면 [출근하기] 버튼을 눌러서 출근 체크를 할 수 있습니다.
       출근 가능한 위치가 아니라면 [출근하기] 버튼은 보이지 않습니다.
       
사용한 플러그인 : google_maps_flutter, geolocator
```

## 구글 지도 API 발급받기
```
구글 클라우드 사이트에서 프로젝트를 만들고 API를 받는 과정은 전에 google_maps 라이브러리 사용을 학습하면서
한번 경험한 적이 있기에 API 발급받는 과정은 쉽게 해결할 수 있었습니다.
Maps SDK for Android, iOS 모두 사용하고 API를 1개 발급받았습니다.
```
![image](https://user-images.githubusercontent.com/58906858/217715999-37c18b5e-4dc0-400d-9858-7d568b25a1b0.png)   
![image](https://user-images.githubusercontent.com/58906858/217716053-a084640b-c995-4a50-8fd1-a8c8f398c5f5.png)

## 필요한 라이브러리 설치
```
flutter pub add google_maps_flutter, flutter pub add geolocator 명령어로 필요한 라이브러리를 설치하였습니다.
google_maps_flutter와 geolocator의 최신 플러그인을 설치하였습니다.
```
![image](https://user-images.githubusercontent.com/58906858/217716324-6cc260b1-6514-4946-a5a0-e1162747a8a1.png)
