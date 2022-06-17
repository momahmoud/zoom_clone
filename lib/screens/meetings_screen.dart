import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:zoom_clone/resources/firestore_methods.dart';
import 'package:zoom_clone/widgets/text_widget.dart';

class MeetingsScreen extends StatelessWidget {
  const MeetingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirestoreMethods().meetingHistory,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.cyan,
            ),
          );
        }
        return ListView.builder(
          itemCount: (snapshot.data! as dynamic).docs.length,
          itemBuilder: (context, index) {
            return ListTile(
                title: TextWidget(
                  text:
                      'Room Name: ${(snapshot.data! as dynamic).docs[index]['meetingName']}',
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 214, 213, 213),
                  fontSize: 19,
                ),
                subtitle: Text(
                    'Joined on ${DateFormat.yMMMd().format((snapshot.data! as dynamic).docs[index]['createdAt'].toDate())}'));
          },
        );
      },
    );
  }
}
