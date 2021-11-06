import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../components/build_custom_text_field.dart';
import '../components/build_material_button.dart';
import '../components/build_snack_bar.dart';
import '../components/build_colors.dart';
import '../components/constants.dart';
import '../helpers/database_helper.dart';
import '../model/user_model.dart';
import '../styles/icons/icon_broken.dart';

class UpdateUserScreen extends StatefulWidget {
  const UpdateUserScreen({Key? key, this.userModel}) : super(key: key);
  final UserModel? userModel;
  @override
  State<UpdateUserScreen> createState() => _UpdateUserScreenState();
}

class _UpdateUserScreenState extends State<UpdateUserScreen> {
  @override
  void initState() {
    super.initState();
// لا يمكن استخدام ال userModel مباشراً لان انا ف class اخر لذلك نقوم باستخدام كلمة widget
    nameUpdateClientController.text = widget.userModel!.name!;
    emailUpdateClientController.text = widget.userModel!.email!;
    phoneUpdateClientController.text = widget.userModel!.phone!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKeyUpdateClient,
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
                    Text(
                      'UPDATE CLIENT',
                      style: GoogleFonts.merriweatherSans(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    buildCustomTextField(
                      labelText: 'Name',
                      controller: nameUpdateClientController,
                      type: TextInputType.name,
                      icon: IconBroken.Profile,
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
                      labelText: 'Email',
                      controller: emailUpdateClientController,
                      type: TextInputType.emailAddress,
                      icon: IconBroken.Message,
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
                      labelText: 'Phone',
                      controller: phoneUpdateClientController,
                      type: TextInputType.phone,
                      icon: IconBroken.Call,
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
                      text: 'Update Client',
                      onPressed: () => updateClient(),
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

  /// Update User
  Future<void> updateClient() async {
    if (!formKeyUpdateClient.currentState!.validate()) {
    } else {
      (formKeyUpdateClient.currentState!.save());
      try {
        await DbHelper.db.updateDb(
          UserModel(
            id: widget.userModel!.id,
            name: nameUpdateClientController.text,
            email: emailUpdateClientController.text,
            phone: phoneUpdateClientController.text,
            color: colorNumber,
          ),
        );
        Get.offNamedUntil(Home, (route) => false);
        buildSnackBar(
            title: 'Update Succeeded',
            msg: '${nameUpdateClientController.text}updated successfully');
        colorNumber = 0;
      } catch (error) {
        buildSnackBar(title: 'Error', msg: error.toString());
      }
    }
  }
}
