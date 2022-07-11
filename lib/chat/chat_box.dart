import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:try1/models/student.dart';
import '../models/user.dart';
import 'Header.dart';
import 'Window.dart';


class chatpage extends StatelessWidget {
  const chatpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Widget buildText(String text) => Center(
        child: Text(
          text,style: TextStyle(fontSize: 24, color: Colors.white)
        ),
      );
    final users = Provider.of<CustomUser?>(context);
    final student = Provider.of<Student>(context);
    return Scaffold(
      body: SafeArea(
        child: StreamBuilder<CustomUser?>(
            // stream: DatabaseService(uid: user?.uid).userData,
           builder: (context, snapshot) {
             switch (snapshot.connectionState) {
               case ConnectionState.waiting:
                 return Center(child: CircularProgressIndicator());
               default:
                 if (snapshot.hasError) {
                   print(snapshot.error);
                   return buildText('Something went wrong :| .. Try later');
                 }
                 else {
                   final chatters = snapshot.data;
                   return Column(
                     children: [
                       ChatHeaderWidget(student: student, users: [users]),
                       // ChatBodyWidget(users: chatters),
                     ],
                   );
                 }
             }
           }
        ),
      ),
    );
  }
}
