import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../components/build_custom_text.dart';
import '../components/build_user_item.dart';
import '../components/constants.dart';
import '../helpers/database_helper.dart';
import '../model/user_model.dart';
import '../styles/colors/colors.dart';
import 'update_user_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: buildCustomText(text: 'Contacts', fontSize: 20)),
      body: buildGetAllUsers(context),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Get.toNamed(AddClient),
        label: buildCustomText(
          text: 'NEW CLIENT',
          fontSize: 14,
        ),
        backgroundColor: yellow.withOpacity(0.45),
        elevation: 0,
        highlightElevation: 0,
      ),
    );
  }

  /// GET ALL USER => Widget
  Widget buildGetAllUsers(BuildContext context) {
    return FutureBuilder(
      future: getAllUsers(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return Center(
              child: buildCustomText(
                  text: 'You don\'t have any contacts yet, Create now ..'));
        } else {
          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              usersList = snapshot.data;
              return SizedBox(
                height: MediaQuery.of(context).size.height * 0.126,
                child: Card(
                  elevation: 5,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  color: colors[usersList![index].color],
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Row(
                      children: [
                        CircleAvatar(
                            backgroundColor: yellow.withOpacity(0.65),
                            radius: 24,
                            child: buildCustomText(
                              text: usersList![index]
                                  .name
                                  .toString()
                                  .substring(0, 1),
                            )),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              buildUserItem(
                                icon: Icons.person_rounded,
                                text: usersList![index].name.toString(),
                              ),
                              const SizedBox(height: 8),
                              buildUserItem(
                                icon: Icons.email_rounded,
                                text: usersList![index].email.toString(),
                              ),
                              const SizedBox(height: 8),
                              buildUserItem(
                                icon: Icons.phone_rounded,
                                text: usersList![index].phone.toString(),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            Get.to(
                              UpdateUserScreen(userModel: usersList![index]),
                            );
                          },
                          splashRadius: 25,
                          icon: Icon(
                            Icons.edit,
                            size: 20,
                            color: red.withOpacity(0.65),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        }
      },
    );
  }

  /// GET ALL USER => Method
  List<UserModel>? usersList = [];
  Future<List<UserModel>?> getAllUsers() async {
    DbHelper db = DbHelper.db;
    await db.getAllUsers().then((data) {
      usersList = data;
      //  print('The User Data ' + data.toString());
    }).catchError((error) {
      //   print('The Error ' + error.toString());
    });
    return usersList;
  }
}
