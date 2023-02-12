import 'db.dart';
import 'grocery.dart';
import 'package:flutter/material.dart';

class Page2 extends StatefulWidget {
  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  int? selectedId;
  final textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: textController,
          decoration: InputDecoration(
            labelText:'여기에 오늘 할 운동을 입력해주세요',
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: FutureBuilder<List<Grocery>>(
          future: DatabaseHelper.instance.getGroceries(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Grocery>> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: Text('Loading'),
              );
            }
            return snapshot.data!.isEmpty
                ? Center(child:Text('오늘 할 운동 목록이 비어있습니다.',style:TextStyle(fontSize:20)),
            )
                : ListView(
              children: snapshot.data!.map((grocery) {
                return Center(
                  child: Card(
                    color: selectedId == grocery.id
                        ? Colors.white70
                        : Colors.white,
                    child: ListTile(
                      onTap: () {
                        setState(() {
                          if (selectedId == null) {
                            textController.text = grocery.name;
                            selectedId = grocery.id;
                          } else {
                            textController.text = '';
                            selectedId = null;
                          }
                        });
                      },
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(grocery.name),
                          IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              setState(() {
                                DatabaseHelper.instance
                                    .remove(grocery.id!);
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
            );
          },
        ),
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () async {
          selectedId != null
              ? await DatabaseHelper.instance.update(
            Grocery(id: selectedId, name: textController.text),
          )
              : await DatabaseHelper.instance.add(
            Grocery(name: textController.text),
          );
          setState(() {
            textController.clear();
            selectedId = null;
          });
        },
        child: Text('프로필 저장'),
      ),

    );
  }
}