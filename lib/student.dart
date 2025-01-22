import 'package:hive/hive.dart';
part 'student.g.dart';

@HiveType(typeId: 1)
class Student {
  @HiveField(0)
  String name;
  @HiveField(1)
  String age;
  @HiveField(2)
  String hobby;
  @HiveField(3)
  String school;
  Student(
      {required this.name,
      required this.age,
      required this.hobby,
      required this.school});
}
