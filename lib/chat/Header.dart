
import 'package:flutter/material.dart';
import 'package:try1/models/student.dart';
import '../models/user.dart';

class ChatHeaderWidget extends StatelessWidget {

  final Student student;
  final List<CustomUser?> users;

  const ChatHeaderWidget({Key? key, required this.student, required this.users})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 24),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery
                .of(context)
                .size
                .width * 0.75,
            child: Text(
              'ChatoApp',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          SizedBox(height: 12),
          Container(
            height: 60,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: users.length,
                itemBuilder: (context, index) {
                  final user = users[index];
                  if (index == 0) {
                    return Container(
                      margin: const EdgeInsets.only(right: 12),
                      child: CircleAvatar(
                        radius: 25.0,
                        child: const Icon(Icons.search),
                      ),
                    );
                  } else {
                    return Container
                      (
                      margin: const EdgeInsets.only(right: 12),
                      child: GestureDetector(
                        onTap: () {},
                        child: CircleAvatar(
                          radius: 25.0,
                          backgroundColor: Colors.blue[student.strength],
                          backgroundImage: const AssetImage("assets/books.png"),
                          child: Text(student.name[0],
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                      ),
                    );
                  }
                }
            ),
          ),
        ],
      ),
    );
  }
}
