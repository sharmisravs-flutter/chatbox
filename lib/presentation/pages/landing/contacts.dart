import 'package:chatbox/data/models/user_data.dart';
import 'package:chatbox/data/repos/user_repo.dart';
import 'package:chatbox/data/services/user_service.dart';
import 'package:chatbox/presentation/controllers/user_controller.dart';
import 'package:chatbox/presentation/pages/chat/chat_history_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ContactsPage extends StatefulWidget {
  const ContactsPage({super.key});

  @override
  State<ContactsPage> createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  late Future<List<UserData>> users;

  late final UserController userController;

  @override
  void initState() {
    super.initState();
    userController = UserController(UserRepo(UserService()));
    users = userController.getUsers();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return FutureBuilder(
      future: users,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: const CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(snapshot.error.toString())));
        }

        final users = snapshot.data ?? [];

        return ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () async {
                final currentUser = await userController.getUserDetailsByUid(
                  userController.currentUserUid(),
                );
                context.push(
                  '/chatHistory',
                  extra: ChatHistoryArgs(
                    user: users[index],
                    currentUser: currentUser,
                  ),
                );
              },
              child: ListTile(
                title: Text(users[index].name),
                leading: CircleAvatar(
                  radius: screenHeight / 40,
                  child: Icon(Icons.person),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
