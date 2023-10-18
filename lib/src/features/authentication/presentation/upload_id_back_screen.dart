import 'package:cross_file_image/cross_file_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../../common_widgets/farm_swap_buttons/farmswap_back_arrow_button.dart';
import '../../../common_widgets/farm_swap_buttons/farmswap_primary_button.dart';
import '../../../constants/typography.dart';
import '../../../providers/user/user_provider.dart';
import 'set_location_screen.dart';
import 'upload_photo_screen.dart';

class UploadIdBackScreen extends StatefulWidget {
  const UploadIdBackScreen({super.key});

  @override
  State<UploadIdBackScreen> createState() => _UploadIdBackScreenState();
}

class _UploadIdBackScreenState extends State<UploadIdBackScreen> {
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
      profile.setBackId = XFile(returnedImage!.path);
    }

    Future _pickImageFromCamera() async {
      returnedImage = await picker.pickImage(source: ImageSource.camera);
      profile.setBackId = XFile(returnedImage!.path);
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
                        value: "Back Picture of\n Your Valid ID",
                      ),
                      SizedBox(height: height * 0.024),
                      baseText(
                        value:
                            "Take a picture of the back part of your identification card",
                      ),
                      SizedBox(height: height * 0.024),
                      watchProfile.backID != null
                          ? Center(
                              child: Container(
                                height: 238.h,
                                width: 245.w,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: XFileImage(
                                      watchProfile.backID as XFile,
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
                                          profile.setBackIdToNull();
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
                                builder: (context) => const SetLocationScreen(),
                              ),
                            );
                          },
                          isEnabled: watchProfile.backID != null,
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
