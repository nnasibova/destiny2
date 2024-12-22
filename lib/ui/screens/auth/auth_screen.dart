// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:n9/helpers/constants/app_colors.dart';
// import 'package:n9/helpers/constants/app_styles.dart';
// import 'package:n9/helpers/constants/app_text_styles.dart';
// import 'package:n9/helpers/constants/extensions.dart';
// import 'package:n9/helpers/utils/utils.dart';
// import 'package:n9/infrastructure/controller/auth_controller.dart';
// import 'package:n9/ui/global/custom_button.dart';
// import 'package:n9/ui/global/custom_text_field.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// class AuthScreen extends StatefulWidget {
//   const AuthScreen({super.key});

//   @override
//   State<AuthScreen> createState() => _AuthScreenState();
// }

// class _AuthScreenState extends State<AuthScreen> {
//   final nameController = TextEditingController();
//   final dateOfBirthController = TextEditingController();
//   final timeController = TextEditingController();
//   final locationController = TextEditingController();
//   final formKey = GlobalKey<FormState>();

//   @override
//   void dispose() {
//     nameController.dispose();
//     dateOfBirthController.dispose();
//     timeController.dispose();
//     locationController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.backgroundColor,
//       body: Container(
//         decoration: AppStyles.backgroundImage,
//         child: Form(
//           key: formKey,
//           child: SafeArea(
//             child: SingleChildScrollView(
//               child: Padding(
//                 padding: const EdgeInsets.all(24),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text('know'.tr,
//                         style: AppTextStyles.heading2.copyWith(
//                             fontWeight: FontWeight.w600, fontSize: 24)),
//                     const SizedBox(
//                       height: 20,
//                     ),
//                     CustomTextField(
//                         validator: (val) {
//                           if (val!.isEmpty) {
//                             return 'noInfo'.tr;
//                           } if (!val.isValidName) {
//                             return 'validName'.tr;
//                           }
//                           return null;
//                         },
//                         inputType: TextInputType.name,
//                         question: 'nameQuestion'.tr,
//                         text: 'name'.tr,
//                         controller: nameController),
//                     CustomTextField(
//                         validator: (val) {
//                           if (val!.isEmpty) {
//                             return 'noInfo'.tr;
//                           }
//                           return null;
//                         },
//                         question: 'birthQuestion'.tr,
//                         text: 'birthOfDate'.tr,
//                         readOnly: true,
//                         suffixIcon: FontAwesomeIcons.calendarWeek,
//                         controller: dateOfBirthController),
//                     CustomTextField(
//                       validator: (val) {
//                         if (val!.isEmpty) {
//                           return 'noInfo'.tr;
//                         }
//                         return null;
//                       },
//                       question: 'timeQuestion'.tr,
//                       text: 'time'.tr,
//                       controller: timeController,
//                       readOnly: true,
//                       suffixIcon: FontAwesomeIcons.clock,
//                     ),
//                     CustomTextField(
//                         validator: (val) {
//                           if (val!.isEmpty) {
//                             return 'noInfo'.tr;
//                           }if (!val.isValidName) {
//                             return 'validCity'.tr;
//                           }

//                           return null;
//                         },
//                         inputType: TextInputType.streetAddress,
//                         question: 'cityQuestion'.tr,
//                         text: 'city'.tr,
                        
//                         controller: locationController),
//                     Center(
//                       child: CustomButton(
//                           text: 'start'.tr,
//                           onTap: () {
//                             if (formKey.currentState!.validate()) {
//                               AuthController().signInAnonymously(
//                                   nameController.text,
//                                   convertDateStringToDateTime(
//                                       dateOfBirthController.text),
//                                   timeController.text,
//                                   locationController.text);
//                             }
//                           }),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
