// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

const String TABLE_USER = 'user';

const String Home = '/Home';
const String AddClient = '/AddUser';
const String UpdateClient = '/UpdateUser';

/// Add New User
TextEditingController nameAddClientController = TextEditingController();
TextEditingController emailAddClientController = TextEditingController();
TextEditingController phoneAddClientController = TextEditingController();
final GlobalKey<FormState> formKeyAddClient = GlobalKey<FormState>();

/// Update User
TextEditingController nameUpdateClientController = TextEditingController();
TextEditingController emailUpdateClientController = TextEditingController();
TextEditingController phoneUpdateClientController = TextEditingController();
final GlobalKey<FormState> formKeyUpdateClient = GlobalKey<FormState>();

/// Colors
int colorNumber = 0;
List<Color?> colors = [
  Colors.white,
  Colors.teal[50],
  Colors.pink[50],
  Colors.yellow[50],
  Colors.lightBlue[100],
  Colors.indigo[100],
  Colors.orange[100],
  Colors.deepPurple[100],
  Colors.red[100],
  Colors.lightGreen[200],
  Colors.blue[200],
];
