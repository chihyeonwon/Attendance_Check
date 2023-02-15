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

  final _formKey = GlobalKey<FormState>(); // 폼의 상태를 얻기 위한 키

  final _nameController = TextEditingController(); // 이름 컨트롤러 객체
  final _deptController = TextEditingController(); // 학과 컨트롤러 객체


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        children: [
          Expanded(
            child: Container(
              child: Form(
                  key:_formKey, // 키 할당
                  child: Column(
                    children:<Widget>[
                      TextFormField(
                        decoration: InputDecoration( // 외곽선이 있고 힌트로 '이름'를 표시
                          border:OutlineInputBorder(),
                          hintText:'이름', // placeholder 이름
                        ),
                        controller: _nameController, // 이름 컨트롤러 연결
                        keyboardType: TextInputType.text, // 텍스트만 입력할 수 있음
                        validator: (value) {
                          if (value!.trim().isEmpty) {
                            return '이름을 입력해 주세요';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height:16.0,
                      ),
                      TextFormField(
                        decoration: InputDecoration( // 외곽선이 있고 힌트로 '학과'를 표시
                          border:OutlineInputBorder(),
                          hintText:'학과', // placeholder 학과
                        ),
                        controller: _deptController,
                        keyboardType: TextInputType.text, // 텍스트만 입력할 수 있음
                        validator: (value) {
                          if(value!.trim().isEmpty) {
                            return '학과를 입력하세요';
                          }
                          return null;
                        },
                      ),
                      Container( // 버튼 여백,배치
                        margin:const EdgeInsets.only(top:16.0), // 위 쪽에만 16크기의 여백
                        alignment: Alignment.centerRight, // 오른쪽 가운데에 위치
                        child:ElevatedButton(
                          onPressed: () async {
                            if(_formKey.currentState!.validate()) { // 이름과 학과 값이 검증되었다면 결과를 핸드폰 저장소에 저장
                              prefs = await SharedPreferences.getInstance(); // 사용자의 저장소에 connection
                              prefs.setString('name', _nameController.text.trim()); // 사용자의 저장소에 이름 저장
                              prefs.setString('dept', _deptController.text.trim()); // 사용자의 저장소에 학과 저장
                            }
                          },
                          child:Text('저장'),
                        ),
                      ),
                    ],
                  ),
                ),
            ),
          ),
           Column(
             mainAxisAlignment: MainAxisAlignment.end,
              children: [Text('자유(自由, Freedom) / 진리(眞理, Truth) / 창조(創造, Creativity)',
                style:TextStyle(fontSize:14,)),]
           ),
        ],
      ),
      );
  }
}

