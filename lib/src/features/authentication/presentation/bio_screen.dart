import 'package:farmswap_v2/src/common_widgets/farm_swap_buttons/farmswap_back_arrow_button.dart';
import 'package:farmswap_v2/src/common_widgets/input/farmswap_text_field.dart';
import 'package:farmswap_v2/src/constants/typography.dart';
import 'package:farmswap_v2/src/features/authentication/presentation/birth_info_screen.dart';
import 'package:farmswap_v2/src/features/authentication/presentation/payment_method_screen.dart';
import 'package:farmswap_v2/src/features/authentication/presentation/upload_photo_screen.dart';
import 'package:farmswap_v2/src/providers/user/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../../../common_widgets/farm_swap_buttons/farmswap_primary_button.dart';

class BioScreen extends StatefulWidget {
  const BioScreen({super.key});

  @override
  State<BioScreen> createState() => _BioScreenState();
}

class _BioScreenState extends State<BioScreen> {
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
    var user = context.read<UserProvider>();

    void fillBio() {
      user.setFirstName = firstNameController.text.trim();
      user.setLastName = lastNameController.text.trim();
      user.setMobileNumber = mobileNumberController.text.trim();

      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(
          child: CircularProgressIndicator(),
        ),
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: ((context) => const UploadPhotoScreen()),
        ),
      );
    }

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
                  child: Form(
                    key: theKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const FarmSwapBackArrowButton(),
                        SizedBox(height: 20.h),
                        screenTitle(
                          value: "Fill in your bio to get\nstarted",
                        ),
                        SizedBox(height: 20.h),
                        baseText(
                          value:
                              "This data will be displayed in your\naccount profile for security",
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
                            hintText: 'Last Name',
                            controller: lastNameController,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter a value';
                              } else if (value.length < 2) {
                                return 'Value must be at least 2 characters long';
                              } else if (!isValidLastName(
                                  lastNameController.text.trim())) {
                                return 'Not a valid last name!';
                              } else {
                                return null;
                              }
                            },
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
                            hintText: 'Mobile Number',
                            controller: mobileNumberController,
                            isNumber: true,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter a value';
                              } else if (value.length < 3) {
                                return 'Value must be at least 3 characters long';
                              } else if (!isValidPhilippineMobileNumber(
                                  mobileNumberController.text.trim())) {
                                return 'Not a valid PH mobile number.';
                              } else {
                                return null;
                              }
                            },
                          ),
                        ),
                        const Spacer(),
                        Center(
                          child: FarmSwapPrimaryButton(
                            isEnabled: true,
                            buttonTitle: "Next",
                            onPress: () {
                              if (theKey.currentState!.validate()) {
                                fillBio();
                              }
                            },
                          ),
                        ),
                      ],
                    ),
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
