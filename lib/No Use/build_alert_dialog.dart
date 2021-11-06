// import 'package:flutter/material.dart';
//
// void buildOpenAlertBox(BuildContext context) {
//     showDialog(
//       barrierDismissible: false,
//       useSafeArea: false,
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           content: SizedBox(
//             child: Form(
//               key: formKey,
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   buildCustomTextField(
//                     hintText: 'Add Name',
//                     controller: nameController,
//                     type: TextInputType.name,
//                     onSaved: (value) {
//                       name = value;
//                     },
//                     validator: (value) {
//                       if (value == '' || value == null || value.isEmpty) {
//                         return 'Please enter your name';
//                       } else {
//                         return null;
//                       }
//                     },
//                   ),
//                   buildCustomTextField(
//                     hintText: 'Add Email',
//                     controller: emailController,
//                     type: TextInputType.emailAddress,
//                     onSaved: (value) {
//                       email = value;
//                     },
//                     validator: (value) {
//                       if (value == '' || value == null || value.isEmpty) {
//                         return 'Please enter your email';
//                       } else {
//                         return null;
//                       }
//                     },
//                   ),
//                   buildCustomTextField(
//                     hintText: 'Add Phone',
//                     controller: phoneController,
//                     type: TextInputType.phone,
//                     onSaved: (value) {
//                       phone = value;
//                     },
//                     validator: (value) {
//                       if (value == '' || value == null || value.isEmpty) {
//                         return 'Please enter your phone';
//                       } else {
//                         return null;
//                       }
//                     },
//                   ),
//                   const SizedBox(height: 10),
//                   MaterialButton(
//                     elevation: 0,
//                     highlightElevation: 0,
//                     height: 40,
//                     minWidth: MediaQuery.of(context).size.width,
//                     color: yellow.withOpacity(0.55),
//                     onPressed: () {},
//                     child: buildCustomText(text: 'Add User'),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
