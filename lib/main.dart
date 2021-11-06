import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'components/constants.dart';
import 'styles/colors/colors.dart';
import 'view/add_user_screen.dart';
import 'view/home_screen.dart';
import 'view/update_user_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: white,
        fontFamily: 'Lato',
        appBarTheme: AppBarTheme(
          backgroundColor: yellow.withOpacity(0.45),
          elevation: 0,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: transparent,
            statusBarIconBrightness: Brightness.dark,
          ),
        ),
      ),
      initialRoute: Home,
      getPages: [
        GetPage(name: Home, page: () => const HomeScreen()),
        GetPage(name: AddClient, page: () => const AddUserScreen()),
        GetPage(name: UpdateClient, page: () => const UpdateUserScreen()),
      ],
    );
  }
}
