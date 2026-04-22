import 'package:flutter/material.dart';
import 'package:modelhandling/model/studentdata.dart';
import 'package:modelhandling/model/studentmodel.dart';

class Studentslist extends StatefulWidget {
  const Studentslist({super.key});

  @override
  State<Studentslist> createState() => _StudentslistState();
}

class _StudentslistState extends State<Studentslist> {
  final StudentService studentService = StudentService();
  List<Student> students = [];
  //Errorhandling
  bool isloading = true;
  String? errormessage;

  Future<void> loadStudents() async {
    //capturing data
    try {
      final loadStudent = await studentService.fetchStudents();
      setState(() {
        students = loadStudent;
        isloading = false;
      });
    } catch (e) {
      setState(() {
        isloading = false;
        errormessage = "Failed to load student data $e";
      });
    }
  }

  @override
  void initState() {
    loadStudents();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: students.length,
        itemBuilder: (context, index) {
          final student = students[index];
          return ListTile(
            title: Text(student.name),
            subtitle: Text(
              "${student.average.toStringAsFixed(1)} ${student.status}",
            ),
          );
        },
      ),
    );
  }
}
