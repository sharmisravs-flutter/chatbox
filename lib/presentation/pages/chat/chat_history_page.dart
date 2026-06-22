import 'package:chatbox/core/utils/dateformats.dart';
import 'package:chatbox/data/models/message.dart';
import 'package:chatbox/data/models/user_data.dart';
import 'package:chatbox/data/repos/chat_repo.dart';
import 'package:chatbox/data/services/chat_service.dart';
import 'package:chatbox/presentation/controllers/chat_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// ignore: must_be_immutable
class ChatHistory extends StatefulWidget {
  UserData user;
  UserData currentUser;

  ChatHistory({required this.user, required this.currentUser});

  @override
  State<ChatHistory> createState() => _ChatHistoryState();
}

class _ChatHistoryState extends State<ChatHistory> {
  late TextEditingController msgController;

  late final ChatController _chatController;

  bool isSending = false;

  @override
  void initState() {
    msgController = TextEditingController();
    _chatController = ChatController(ChatRepo(ChatService()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Icon(Icons.arrow_back, size: screenHeight / 40),
        ),
        title: Row(
          children: [
            CircleAvatar(
              radius: screenHeight / 40,
              backgroundImage: NetworkImage(
                'https://media.istockphoto.com/id/1437816897/photo/business-woman-manager-or-human-resources-portrait-for-career-success-company-we-are-hiring.jpg?s=612x612&w=is&k=20&c=tw9TuTigzhSlLA_b1Avy0X6GNF9ZFVvgTHIZ9i68Q0I=',
              ),
            ),
            SizedBox(width: 20),
            Text(
              widget.user.name,
              style: TextStyle(
                fontSize: screenHeight / 40,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_vert, size: screenHeight / 40),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
              child: StreamBuilder<List<Message>>(
                stream: _chatController.getMessages(widget.user.uid!),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: const CircularProgressIndicator());
                  }

                  if (snapshot.hasError) {
                    return Center(child: Text(snapshot.error.toString()));
                  }

                  final messages = snapshot.data ?? [];

                  return ListView.builder(
                    reverse: true,
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      final message = messages[messages.length - 1 - index];
                      final isMe =
                          message.messageFrom ==
                          FirebaseAuth.instance.currentUser?.uid;
                      print("Is Me" + "$isMe");

                      return Align(
                        alignment: isMe
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                            vertical: 4,
                            horizontal: 8,
                          ),
                          padding: const EdgeInsets.all(12),
                          constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width * 0.7,
                          ),
                          decoration: BoxDecoration(
                            color: isMe ? Colors.blue : Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                message.msg,
                                style: TextStyle(
                                  color: isMe ? Colors.white : Colors.black,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                Dateformats.formatChatTime(message.dateTime),
                                style: TextStyle(
                                  fontSize: 10,
                                  color: isMe ? Colors.white70 : Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            TextFormField(controller: msgController),
            SizedBox(height: 15),
            InkWell(
              onTap: () async {
                setState(() {
                  isSending = true;
                });
                Message message = Message(
                  msg: msgController.text,
                  dateTime: DateTime.now().toString(),
                  messageStatus: MessageStatus.sent.label,
                  messageFrom: FirebaseAuth.instance.currentUser?.uid,
                );
                try {
                  await _chatController.sendMessage(
                    currentUser: widget.currentUser,
                    user: widget.user,
                    msg: message,
                  );
                  msgController.clear();

                  setState(() {
                    isSending = false;
                  });
                } catch (e) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(e.toString())));
                }
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: isSending
                    ? SizedBox(
                        height: screenHeight / 40,
                        width: screenHeight / 40,
                        child: CircularProgressIndicator(),
                      )
                    : Text("Send", style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChatHistoryArgs {
  final UserData user;
  final UserData currentUser;

  ChatHistoryArgs({required this.user, required this.currentUser});
}
