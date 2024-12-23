import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../core/utils/app_style.dart';
import 'admin_chat.dart';
import 'chat_service.dart';

class AdminChatRoomsScreen extends StatefulWidget {
  const AdminChatRoomsScreen({super.key});

  @override
  State<AdminChatRoomsScreen> createState() => _AdminChatRoomsScreenState();
}

class _AdminChatRoomsScreenState extends State<AdminChatRoomsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Chat Rooms",
          style: TextStyle(
              fontSize: AppStyle.responsiveFont(fontSize: 24, context: context),
              color: Colors.white,
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.cyan,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: ChatService().getChats(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text("Error loading chat rooms"));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: SizedBox(
                width: 30,
                height: 30,
                child: CircularProgressIndicator(
                  color: Colors.cyan,
                ),
              ),
            );
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text("No chat rooms available"));
          }

          var chatRooms = snapshot.data!.docs;

          return ListView.builder(
            itemCount: chatRooms.length,
            itemBuilder: (context, index) {
              var chatRoom = chatRooms[index];
              var name = chatRoom.get("name");
              var id = chatRoom.id;

              return Card(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ListTile(
                    title: Text(
                      '$name',
                      style: TextStyle(
                          fontSize: AppStyle.responsiveFont(
                              fontSize: 24, context: context),
                          color: Colors.black),
                    ),
                    subtitle: const Text('Tap to view conversation'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AdminChat(
                            name: name,
                            id: id,
                          ),
                        ),
                      );
                    },
                  ));
            },
          );
        },
      ),
    );
  }
}
