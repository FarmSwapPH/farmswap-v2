import 'dart:io';

import 'package:farmswap_v2/src/common_widgets/farm_swap_buttons/farmswap_back_arrow_button.dart';
import 'package:farmswap_v2/src/features/authentication/presentation/birth_info_screen.dart';
import 'package:farmswap_v2/src/features/authentication/presentation/set_location_screen.dart';
import 'package:farmswap_v2/src/providers/user/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cross_file_image/cross_file_image.dart';
import 'package:provider/provider.dart';
import '../../../common_widgets/farm_swap_buttons/farmswap_primary_button.dart';
import '../../../constants/typography.dart';

class UploadPhotoScreen extends StatefulWidget {
  const UploadPhotoScreen({super.key});

  @override
  State<UploadPhotoScreen> createState() => _UploadPhotoScreenState();
}

class _UploadPhotoScreenState extends State<UploadPhotoScreen> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final ImagePicker picker = ImagePicker();
    XFile? returnedImage;

    var profile = context.read<UserProvider>();
    var watchProfile = context.watch<UserProvider>();

    Future _pickImageFromGallery() async {
      returnedImage = await picker.pickImage(source: ImageSource.gallery);
      profile.setProfilePhoto = XFile(returnedImage!.path);
    }

    Future _pickImageFromCamera() async {
      returnedImage = await picker.pickImage(source: ImageSource.camera);
      profile.setProfilePhoto = XFile(returnedImage!.path);
    }

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SizedBox(
          height: height,
          width: width,
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
                      const FarmSwapBackArrowButton(),
                      SizedBox(height: height * 0.024),
                      screenTitle(
                        value: "Upload Your Photo\nProfile",
                      ),
                      SizedBox(height: height * 0.024),
                      baseText(
                        value:
                            "This data will be displayed in your\naccount profile for security",
                      ),
                      SizedBox(height: height * 0.024),
                      watchProfile.profilePhoto != null
                          ? Center(
                              child: Container(
                                height: 238.h,
                                width: 245.w,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: XFileImage(
                                      watchProfile.profilePhoto as XFile,
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.circular(15.r),
                                ),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      top: 10,
                                      right: 11,
                                      child: IconButton(
                                        onPressed: () {
                                          profile.setProfilePhotoNull();
                                        },
                                        icon: const Icon(Icons.close),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          : Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    _pickImageFromGallery();
                                  },
                                  child: CustomPicturePicker(
                                    height: height,
                                    width: width,
                                    imagePath:
                                        "assets/svg/upload photo/Gallery.svg",
                                    title: 'From Gallery',
                                  ),
                                ),
                                SizedBox(height: height * 0.024),
                                GestureDetector(
                                  onTap: () {
                                    _pickImageFromCamera();
                                  },
                                  child: CustomPicturePicker(
                                    height: height,
                                    width: width,
                                    imagePath:
                                        "assets/svg/upload photo/camera.svg",
                                    title: 'From Camera',
                                  ),
                                ),
                              ],
                            ),
                      const Spacer(),
                      Center(
                        child: FarmSwapPrimaryButton(
                          buttonTitle: "Next",
                          onPress: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const BirthInfoScreen(),
                              ),
                            );
                          },
                          isEnabled: watchProfile.profilePhoto != null,
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

class CustomPicturePicker extends StatelessWidget {
  const CustomPicturePicker({
    super.key,
    required this.height,
    required this.width,
    required this.imagePath,
    required this.title,
  });

  final double height;
  final double width;
  final String imagePath;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.158,
      width: width,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(22),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x115A6CEA),
            blurRadius: 50,
            offset: Offset(0, 0),
            spreadRadius: 0,
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            imagePath,
          ),
          SizedBox(height: height * 0.024),
          poppinsText(value: title, size: 14),
        ],
      ),
    );
  }
}
