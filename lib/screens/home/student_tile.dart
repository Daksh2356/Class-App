
import 'package:flutter/material.dart';
import 'package:try1/models/student.dart';

class StudentTile extends StatelessWidget {
  final Student student;

  StudentTile({required this.student});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.only(top: 8.0),
      // key: _scaffoldkey,
      child: Card(
        margin: EdgeInsets .fromLTRB(20, 6, 20, 0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.blue[student.strength],
            backgroundImage: const AssetImage("assets/books.png"),
            child: Text(student.name[0],
            style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          title: Text(student.name),
          subtitle: Text('Likes ${student.subject} subjects'),
        ),
      ),
    );
  }
}

