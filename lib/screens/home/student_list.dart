import 'package:flutter/material.dart';
import 'package:try1/models/student.dart';
import 'package:provider/provider.dart';
import 'package:try1/screens/home/student_tile.dart';

class stulist extends StatefulWidget {
  const stulist({Key? key}) : super(key: key);

  @override
  State<stulist> createState() => _stulistState();
}

class _stulistState extends State<stulist> {
  @override
  Widget build(BuildContext context) {
    final students = Provider.of<List<Student>>(context) ;
    return ListView.builder(
      itemCount: students.length,
      itemBuilder: (context,index){
        return StudentTile(student : students [index]);
      }
    );
  }
}