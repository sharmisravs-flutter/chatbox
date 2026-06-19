// ignore_for_file: unused_import

import 'package:chatbox/core/utils/dateformats.dart';
import 'package:chatbox/data/models/message.dart';
import 'package:chatbox/data/models/user_data.dart';
import 'package:chatbox/data/models/user_messages_info.dart';
import 'package:chatbox/data/models/user_status.dart';
import 'package:chatbox/data/repos/user_repo.dart';
import 'package:chatbox/data/services/user_service.dart';
import 'package:chatbox/presentation/controllers/user_controller.dart';
import 'package:chatbox/presentation/pages/chat/chat_history_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<UserStatus> userStatusList;

  late UserController userController;

  late Future<List<UserMsgsInfo>> userMsgsInfo;

  @override
  void initState() {
    userStatusList = [
      UserStatus(
        name: "Barbara0",
        postedAt: "2025-12-22T12:32:46.044Z",
        profileImage: "https://picsum.photos/seed/22wvZEoUA/2652/3453",
        status: "https://loremflickr.com/2781/2280?lock=3239396641404604",
        messages: [],
        id: "1",
      ),

      UserStatus(
        name: "Carli_Hayes",
        postedAt: "2025-08-04T23:28:18.244Z",
        profileImage: "https://picsum.photos/seed/gEOfky/3081/284",
        status: "https://loremflickr.com/489/3493?lock=4034843657113024",
        messages: [],
        id: "2",
      ),
      UserStatus(
        name: "Lauryn_Hackett90",
        postedAt: "2026-04-07T11:02:35.229Z",
        profileImage: "https://picsum.photos/seed/KZWTX59PZ/1498/51",
        status: "https://loremflickr.com/380/236?lock=8901454162145577",
        messages: [],
        id: "3",
      ),
      UserStatus(
        name: "Wilhelmine.Gottlieb60",
        postedAt: "2025-07-23T11:10:19.648Z",
        profileImage: "https://loremflickr.com/2600/3401?lock=7955727233085894",
        status: "https://picsum.photos/seed/mQ2gKAPf/1205/2474",
        messages: [],
        id: "4",
      ),
      UserStatus(
        name: "Theo_DAmore64",
        postedAt: "2026-05-18T07:46:45.260Z",
        profileImage: "https://loremflickr.com/1138/1210?lock=2818502834799391",
        status: "https://picsum.photos/seed/eub65H1HfX/1729/2473",
        messages: [],
        id: "5",
      ),
      UserStatus(
        name: "Lisandro_Koepp5",
        postedAt: "2025-07-06T09:52:03.477Z",
        profileImage: "https://picsum.photos/seed/NgwlEb1/912/300",
        status: "https://loremflickr.com/1392/2702?lock=829556971454609",
        messages: [],
        id: "6",
      ),
      UserStatus(
        name: "Earlene88",
        postedAt: "2025-12-13T09:23:41.616Z",
        profileImage: "https://loremflickr.com/2987/1818?lock=5228624314038329",
        status: "https://picsum.photos/seed/TqJb0xFZG/2631/354",
        messages: [],
        id: "7",
      ),
      UserStatus(
        name: "Annie.Cole",
        postedAt: "2025-07-20T12:15:41.716Z",
        profileImage: "https://picsum.photos/seed/S63Nc/3822/283",
        status: "https://loremflickr.com/176/700?lock=800829501263486",
        messages: [],
        id: "8",
      ),
      UserStatus(
        name: "Sharon_Larkin10",
        postedAt: "2026-03-28T08:43:58.225Z",
        profileImage: "https://loremflickr.com/777/3644?lock=4490773414230801",
        status: "https://loremflickr.com/1971/2795?lock=5918740394761195",
        messages: [],
        id: "9",
      ),
      UserStatus(
        name: "Rolando_Vandervort",
        postedAt: "2025-11-10T09:30:08.954Z",
        profileImage: "https://picsum.photos/seed/1n6KZH6r3g/2097/2424",
        status: "https://picsum.photos/seed/qD74VKsl/3315/790",
        messages: [],
        id: "10",
      ),
    ];
    userController = UserController(UserRepo(UserService()));
    userMsgsInfo = userController.getUserMsgInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.search, color: Colors.white),
        ),
        title: Text(
          "Home",
          style: TextStyle(color: Colors.white, fontSize: screenHeight / 40),
          textAlign: TextAlign.center,
        ),
        actionsPadding: EdgeInsets.only(right: 20),
        actions: [
          PopupMenuButton<String>(
            iconColor: Colors.white,
            onSelected: (value) async {
              switch (value) {
                case "logout":
                  await FirebaseAuth.instance.signOut();
                  context.pushReplacement('/onboarding');
                  break;
              }
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                value: "logout",
                child: Row(
                  children: [
                    Icon(
                      Icons.logout,
                      color: Colors.red,
                      size: screenHeight / 40,
                    ),
                    SizedBox(width: 10),
                    Text("Logout"),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            height: screenHeight / 6,
            color: Colors.black,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: userStatusList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8),
                  child: CircleAvatar(
                    radius: screenHeight / 35,
                    backgroundImage: NetworkImage(
                      userStatusList[index].profileImage,
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: FutureBuilder<List<UserMsgsInfo>>(
              future: userMsgsInfo,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: const CircularProgressIndicator());
                }

                if (snapshot.hasError) {
                  print(
                    "===========${snapshot.error.toString()}========================",
                  );
                  return Center(child: Text(snapshot.error.toString()));
                }

                final usersInfo = snapshot.data ?? [];

                return Container(
                  padding: EdgeInsets.all(screenHeight / 40),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(30),
                    ),
                  ),
                  child: usersInfo.isEmpty
                      ? Center(child: Text("No Messages"))
                      : ListView.builder(
                          itemCount: usersInfo.length,
                          itemBuilder: (context, index) {
                            UserData user = getUserByUID(
                              usersInfo[index].userData,
                              false,
                            );
                            UserData currentUser = getUserByUID(
                              usersInfo[index].userData,
                              true,
                            );

                            return InkWell(
                              onTap: () {
                                context.push(
                                  '/chatHistory',
                                  extra: ChatHistoryArgs(
                                    user: user,
                                    currentUser: currentUser,
                                  ),
                                );
                              },
                              child: ListTile(
                                leading: CircleAvatar(
                                  backgroundImage: NetworkImage(
                                    'https://media.istockphoto.com/id/1437816897/photo/business-woman-manager-or-human-resources-portrait-for-career-success-company-we-are-hiring.jpg?s=612x612&w=is&k=20&c=tw9TuTigzhSlLA_b1Avy0X6GNF9ZFVvgTHIZ9i68Q0I=',
                                  ),
                                ),
                                title: Text(
                                  user.name,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(usersInfo[index].lastMessage),
                                    Text(
                                      Dateformats.formatChatTime(
                                        usersInfo[index].lastMessageTime,
                                      ),
                                      style: TextStyle(fontSize: 10),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  UserData getUserByUID(List<UserData> participants, bool isCurrent) {
    String currentUID = userController.currentUserUid();
    UserData user = UserData(name: "", email: "", uid: "");
    for (var participant in participants) {
      if (isCurrent
          ? (participant.uid == currentUID)
          : (participant.uid != currentUID)) {
        user = participant;
      }
    }
    return user;
  }
}
