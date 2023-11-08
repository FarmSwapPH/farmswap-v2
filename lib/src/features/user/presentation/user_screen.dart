import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../common_widgets/farm_swap_buttons/farmswap_back_arrow_button.dart';
import '../../../common_widgets/input/farmswap_text_field.dart';
import '../../../constants/typography.dart';
import '../../../providers/user/user_provider.dart';

class UserAccountScreen extends StatefulWidget {
  const UserAccountScreen({super.key});

  @override
  State<UserAccountScreen> createState() => _UserAccountScreenState();
}

class _UserAccountScreenState extends State<UserAccountScreen> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  final theKey = GlobalKey<FormState>();

  bool isValidFirstName(String firstName) {
    final RegExp regex = RegExp(r"^[a-zA-Z]{2,25}(?: [a-zA-Z]{2,25}){0,2}$");
    return regex.hasMatch(firstName);
  }

  bool isValidLastName(String lastName) {
    final RegExp regex = RegExp(r"^[a-zA-Z]{2,25}$");
    return regex.hasMatch(lastName);
  }

  bool isValidPhilippineMobileNumber(String mobileNumber) {
    final RegExp regex = RegExp(r"^09[0-9]{9}$");
    return regex.hasMatch(mobileNumber);
  }

  Future initValues() async {
    var user = context.read<UserProvider>();
    String firstName = user.firstName;
    String lastName = user.lastName;
    String mobileNumber = user.mobileNumber;

    if (firstName != null || firstName != "") {
      firstNameController.text = firstName;
    }
    if (lastName != null || lastName != "") {
      lastNameController.text = lastName;
    }
    if (mobileNumber != null || mobileNumber != "") {
      mobileNumberController.text = mobileNumber;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await initValues();
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    firstNameController.dispose();
    lastNameController.dispose();
    mobileNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SizedBox(
          child: Stack(
            children: [
              Positioned.fill(
                top: 0,
                right: 0,
                child: SvgPicture.asset(
                  "assets/svg/bio/bio-pattern.svg",
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                child: Container(
                  padding: const EdgeInsets.all(25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const FarmSwapBackArrowButton(),
                          SizedBox(width: 20.h),
                          screenTitle(
                            value: "Profile",
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Center(
                        child: Stack(
                          children: [
                            CircleAvatar(
                              radius: 50,
                              backgroundImage:
                                  FirebaseAuth.instance.currentUser!.photoURL !=
                                          null
                                      ? NetworkImage(
                                          FirebaseAuth.instance.currentUser!
                                              .photoURL as String,
                                        ) as ImageProvider
                                      : const AssetImage(
                                          "assets/images/png/farmer.png"),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Container(
                        decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(
                                  90, 108, 234, 0.05), // Color with opacity
                              blurRadius: 50.0, // Blur radius
                            ),
                          ],
                        ),
                        child: FarmSwapTextField(
                          isReadOnly: true,
                          hintText: 'First Name',
                          controller: firstNameController,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter a value';
                            } else if (value.length < 2) {
                              return 'Value must be at least 2 characters long';
                            } else if (!isValidFirstName(
                                firstNameController.text.trim())) {
                              return 'Not a valid first name!';
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(
                                  90, 108, 234, 0.05), // Color with opacity
                              blurRadius: 50.0, // Blur radius
                            ),
                          ],
                        ),
                        child: FarmSwapTextField(
                          isReadOnly: true,
                          hintText: 'Last Name',
                          controller: lastNameController,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter a value';
                            } else if (value.length < 2) {
                              return 'Value must be at least 2 characters long';
                            } else if (!isValidFirstName(
                                firstNameController.text.trim())) {
                              return 'Not a valid first name!';
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(
                                  90, 108, 234, 0.05), // Color with opacity
                              blurRadius: 50.0, // Blur radius
                            ),
                          ],
                        ),
                        child: FarmSwapTextField(
                          isReadOnly: true,
                          hintText: 'Date of Birth',
                          controller: lastNameController,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter a value';
                            } else if (value.length < 2) {
                              return 'Value must be at least 2 characters long';
                            } else if (!isValidFirstName(
                                firstNameController.text.trim())) {
                              return 'Not a valid first name!';
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(
                                  90, 108, 234, 0.05), // Color with opacity
                              blurRadius: 50.0, // Blur radius
                            ),
                          ],
                        ),
                        child: FarmSwapTextField(
                          isReadOnly: true,
                          hintText: 'Mobile Number',
                          controller: lastNameController,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter a value';
                            } else if (value.length < 2) {
                              return 'Value must be at least 2 characters long';
                            } else if (!isValidFirstName(
                                firstNameController.text.trim())) {
                              return 'Not a valid first name!';
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(
                                  90, 108, 234, 0.05), // Color with opacity
                              blurRadius: 50.0, // Blur radius
                            ),
                          ],
                        ),
                        child: FarmSwapTextField(
                          isReadOnly: true,
                          hintText: 'Location',
                          controller: lastNameController,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter a value';
                            } else if (value.length < 2) {
                              return 'Value must be at least 2 characters long';
                            } else if (!isValidFirstName(
                                firstNameController.text.trim())) {
                              return 'Not a valid first name!';
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
