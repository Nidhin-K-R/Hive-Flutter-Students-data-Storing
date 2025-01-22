import 'package:flutter/material.dart';
import 'package:hive_practice_1/main.dart';
import 'package:hive_practice_1/student.dart';

import 'package:hive_practice_1/homescreen.dart';

class Screen extends StatefulWidget {
  const Screen({super.key});

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Records"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  boxPersons.clear();
                });
              },
              icon: Icon(
                Icons.delete_forever,
                color: Colors.red,
              ))
        ],
      ),
      body: SafeArea(
        child: Center(
          child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: boxPersons.length,
              itemBuilder: (context, index) {
                Student student = boxPersons.getAt(index)!;
                return Card(
                  borderOnForeground: true,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text("Name : ${student.name}"),
                      Text("age : ${student.age}"),
                      Text("hobby : ${student.hobby}"),
                      Text("school : ${student.school}"),
                      Padding(
                        padding: EdgeInsets.only(left: 250),
                        child: Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    Navigator.pop(context);
                                    boxPersons.deleteAt(index);

                                    boxPersons.putAt(
                                        index,
                                        Student(
                                            name: nameController.text,
                                            age: ageController.text,
                                            hobby: hobbyController.text,
                                            school: schoolController.text));
                                  });
                                },
                                icon: Icon(
                                  Icons.edit,
                                  color: Colors.green,
                                )),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    boxPersons.deleteAt(index);
                                  });
                                },
                                icon: Icon(
                                  Icons.delete,
                                )),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              }),
        ),
      ),
    );
  }
}
