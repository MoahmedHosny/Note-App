import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../components/build_custom_text.dart';
import '../components/build_colors.dart';
import '../components/build_custom_text_field.dart';
import '../components/build_material_button.dart';
import '../components/build_snack_bar.dart';
import '../components/constants.dart';
import '../helpers/database_helper.dart';
import '../model/user_model.dart';
import '../styles/icons/icon_broken.dart';

class AddUserScreen extends StatefulWidget {
  const AddUserScreen({Key? key}) : super(key: key);
  @override
  State<AddUserScreen> createState() => _AddUserScreenState();
}

String? name, email, phone;

class _AddUserScreenState extends State<AddUserScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKeyAddClient,
        child: Center(
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.42,
            child: Card(
              elevation: 15,
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                  bottom: 10,
                  left: 15,
                  right: 15,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildCustomText(text: 'NEW CLIENT', fontSize: 18),
                    const SizedBox(height: 8),
                    buildCustomTextField(
                      hintText: 'Name',
                      controller: nameAddClientController,
                      type: TextInputType.name,
                      icon: IconBroken.Profile,
                      onSaved: (value) {
                        setState(() {
                          name = value;
                        });
                      },
                      validator: (value) {
                        if (value == '' || value == null || value.isEmpty) {
                          return 'Please name should not be empty';
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(height: 8),
                    buildCustomTextField(
                      hintText: 'Email',
                      controller: emailAddClientController,
                      type: TextInputType.emailAddress,
                      icon: IconBroken.Message,
                      onSaved: (value) {
                        setState(() {
                          email = value;
                        });
                      },
                      validator: (value) {
                        if (value == '' || value == null || value.isEmpty) {
                          return 'Please email should not be empty';
                        } else if (!value.contains('@')) {
                          return 'Do use the @ Char.';
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(height: 8),
                    buildCustomTextField(
                      hintText: 'Phone',
                      controller: phoneAddClientController,
                      type: TextInputType.phone,
                      icon: IconBroken.Call,
                      onSaved: (value) {
                        setState(() {
                          phone = value;
                        });
                      },
                      validator: (value) {
                        if (value == '' || value == null || value.isEmpty) {
                          return 'Please phone should not be empty';
                        } else if (value.length < 11) {
                          return 'Enter a Number 11 Char ..';
                        } else {
                          return null;
                        }
                      },
                    ),
                    const Spacer(),
                    const ColorsList(),
                    const SizedBox(height: 8),
                    buildMaterialButton(
                      text: 'Add Client',
                      onPressed: () => addUser(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Save User
  Future<void> addUser() async {
    if (!formKeyAddClient.currentState!.validate()) {
    } else {
      (formKeyAddClient.currentState!.save());
      try {
        await DbHelper.db.insertDbUser(
          UserModel(
            name: nameAddClientController.text,
            email: emailAddClientController.text,
            phone: phoneAddClientController.text,
            color: colorNumber,
          ),
        );
        colorNumber = 0;
        buildClear();
        Get.offNamedUntil(Home, (route) => false);
        buildSnackBar(
            title: 'Addition Succeeded',
            msg: '${nameAddClientController.text}has been added successfully');
      } catch (error) {
        buildSnackBar(title: 'Error', msg: error.toString());
      }
    }
  }

  /// Clear
  void buildClear() {
    nameAddClientController.clear();
    emailAddClientController.clear();
    phoneAddClientController.clear();
  }
}
