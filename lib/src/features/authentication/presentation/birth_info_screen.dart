import 'package:farmswap_v2/src/features/authentication/presentation/upload_id_screen.dart';
import 'package:farmswap_v2/src/providers/user/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../common_widgets/farm_swap_buttons/farmswap_back_arrow_button.dart';
import '../../../common_widgets/farm_swap_buttons/farmswap_primary_button.dart';
import '../../../common_widgets/input/farmswap_text_field.dart';
import '../../../constants/typography.dart';

class BirthInfoScreen extends StatefulWidget {
  const BirthInfoScreen({super.key});

  @override
  State<BirthInfoScreen> createState() => _BirthInfoScreenState();
}

class _BirthInfoScreenState extends State<BirthInfoScreen> {
  final theKey = GlobalKey<FormState>();
  TextEditingController _birthDateController = TextEditingController();
  TextEditingController _birthPlaceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var user = context.watch<UserProvider>();

    void _showDatePicker() {
      showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2025),
      ).then(
        (value) {
          user.setBirthDate = "${value?.month}/${value?.day}/${value?.year}";
          _birthDateController.text = user.birthDate!;
        },
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
                        Row(
                          children: [
                            SizedBox(
                              width: 200.w,
                              child: FarmSwapTextField(
                                isReadOnly: true,
                                hintText: "Enter your birthdate",
                                controller: _birthDateController,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter a value';
                                  } else if (value.length < 2) {
                                    return 'Value must be at least 2 characters long';
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                            ),
                            SizedBox(
                              width: 120.w,
                              child: FarmSwapPrimaryButton(
                                isEnabled: true,
                                buttonTitle: "Pick Date",
                                onPress: () {
                                  _showDatePicker();
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 40.h,
                        ),
                        FarmSwapTextField(
                          hintText: "Enter your birth place",
                          controller: _birthPlaceController,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter a value';
                            } else if (value.length < 2) {
                              return 'Value must be at least 2 characters long';
                            } else {
                              return null;
                            }
                          },
                        ),
                        const Spacer(),
                        Center(
                          child: FarmSwapPrimaryButton(
                            isEnabled: true,
                            buttonTitle: "Continue",
                            onPress: () {
                              showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (context) => const Center(
                                  child: CircularProgressIndicator(),
                                ),
                              );
                              user.setBirthPlace =
                                  _birthPlaceController.text.trim();
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const UploadIdScreen(),
                                ),
                              );
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
