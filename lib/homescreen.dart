import 'package:flutter/material.dart';
import 'package:hive_practice_1/main.dart';
import 'package:hive_practice_1/screen.dart';
import 'package:hive_practice_1/student.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

TextEditingController nameController = TextEditingController();
TextEditingController ageController = TextEditingController();
TextEditingController hobbyController = TextEditingController();
TextEditingController schoolController = TextEditingController();

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Builder(
              builder: (context) => ListView(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), labelText: "Enter Name"),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: ageController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), labelText: "Enter Age"),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: hobbyController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), labelText: "Enter Hobby"),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: schoolController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Enter School"),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 270),
                    child: TextButton(
                        onPressed: () {
                          setState(() {
                            nameController.clear();
                            ageController.clear();
                            hobbyController.clear();
                            schoolController.clear();
                          });
                        },
                        child: Text("Clear")),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      setState(() {
                        if (nameController.text.isEmpty ||
                            ageController.text.isEmpty ||
                            hobbyController.text.isEmpty ||
                            schoolController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("enter data for all fields")));
                        } else {
                          boxPersons.add(Student(
                              name: nameController.text,
                              age: ageController.text,
                              hobby: hobbyController.text,
                              school: schoolController.text));
                          // nameController.clear();
                          //ageController.clear();
                          //hobbyController.clear();
                          //schoolController.clear();

                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (ctx) => Screen()));
                        }
                      });
                    },
                    label: Text("Add Student"),
                    icon: Icon(Icons.add),
                    style: ButtonStyle(
                      minimumSize: WidgetStatePropertyAll(Size(400, 50)),
                      side: WidgetStatePropertyAll(
                        BorderSide(
                            style: BorderStyle.solid,
                            color: Colors.purpleAccent),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        appBar: AppBar(
          title: Text("Register Students"),
          centerTitle: true,
          actions: [
            Builder(
              builder: (context) => IconButton(
                  onPressed: () {
                    setState(() {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (ctx) => Screen()));
                    });
                  },
                  icon: Icon(Icons.feed_outlined)),
            ),
          ],
        ),
      ),
    );
  }
}
