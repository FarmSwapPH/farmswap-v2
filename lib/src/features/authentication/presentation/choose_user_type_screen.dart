import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farmswap_v2/src/constants/colors.dart';
import 'package:farmswap_v2/src/features/authentication/presentation/success_screen.dart';
import 'package:farmswap_v2/src/providers/chosen/chosen_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../../main.dart';
import '../../../common_widgets/farm_swap_buttons/farmswap_back_arrow_button.dart';
import '../../../common_widgets/farm_swap_buttons/farmswap_primary_button.dart';
import '../../../constants/typography.dart';
import '../../../providers/user/user_provider.dart';

class ChooseUserTypeScreen extends StatelessWidget {
  const ChooseUserTypeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    FirebaseAuth authInstance = FirebaseAuth.instance;
    FirebaseFirestore firestoreInstance = FirebaseFirestore.instance;
    final storage = FirebaseStorage.instance;
    var userInstance = context.watch<UserProvider>();
    var isFarmer = context.watch<UserProvider>().isFarmer;
    var paymentMethod = context.watch<PaymentChosenProvider>();

    Future<String> uploadImage() async {
      late String imageUrl;
      File theFile = File(userInstance.profilePhoto!.path);
      try {
        final fileName = userInstance.profilePhoto!.path.split('/').last;
        final storageRef = storage.ref().child('userPhotos/$fileName');
        final uploadTask = storageRef.putFile(theFile);

        await uploadTask.whenComplete(() async {
          imageUrl = await storageRef.getDownloadURL();
          print('Image URL: $imageUrl');
        });
      } catch (e) {
        print(e);
      }

      return imageUrl;
    }

    Future<String> uploadFrontID() async {
      late String imageUrl;
      File theFile = File(userInstance.frontId!.path);
      try {
        final fileName = userInstance.frontId!.path.split('/').last;
        final username = userInstance.username;
        final storageRef = storage.ref().child('userDocs/$username/$fileName');
        final uploadTask = storageRef.putFile(theFile);

        await uploadTask.whenComplete(() async {
          imageUrl = await storageRef.getDownloadURL();
        });
      } catch (e) {
        print(e);
      }

      return imageUrl;
    }

    Future<String> uploadBackID() async {
      late String imageUrl;
      File theFile = File(userInstance.backID!.path);
      try {
        final fileName = userInstance.backID!.path.split('/').last;
        final username = userInstance.username;
        final storageRef = storage.ref().child('userDocs/$username/$fileName');
        final uploadTask = storageRef.putFile(theFile);

        await uploadTask.whenComplete(() async {
          imageUrl = await storageRef.getDownloadURL();
        });
      } catch (e) {
        print(e);
      }

      return imageUrl;
    }

    Future<UserCredential> signInUser() async {
      late final UserCredential userCredential;
      try {
        userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: userInstance.email,
          password: userInstance.password,
        );

        final user = userCredential.user;
        if (user != null) {
          print('Successfully signed in user: ${user.uid}');
        }
      } on FirebaseAuthException catch (e) {
        print('Failed to sign in user: ${e.message}');
      }

      return userCredential;
    }

    Future createUserAndSaveToFirestore() async {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(
          child: CircularProgressIndicator(),
        ),
      );
      final uploadedProfilePhoto = await uploadImage();
      final uploadedFrontId = await uploadFrontID();
      final uploadedBackId = await uploadBackID();
      await authInstance.createUserWithEmailAndPassword(
        email: userInstance.email,
        password: userInstance.password,
      );
      await authInstance.currentUser!.updateDisplayName(
          "${userInstance.firstName} ${userInstance.lastName}");
      await authInstance.currentUser!.updatePhotoURL(uploadedProfilePhoto);

      final userCreds = await signInUser();
      userCreds.user!.sendEmailVerification();

      try {
        final loggedinUserID = authInstance.currentUser;
        final db = firestoreInstance;
        String collectionToSave =
            userInstance.isFarmer == true ? "FarmerUsers" : "CustomerUsers";
        final customerInstance = db.collection(collectionToSave);

        final dataToInsert = <String, dynamic>{
          "address": userInstance.address,
          "birthDate": userInstance.birthDate,
          "birthPlace": userInstance.birthplace,
          "email": loggedinUserID!.email,
          "userId": loggedinUserID.uid,
          "userRole": userInstance.isFarmer == true ? "farmer" : "consumer",
          "registrationDate": Timestamp.now(),
          "accountStatus": "active",
          "contactNumber": userInstance.mobileNumber,
          "firstName": userInstance.firstName,
          "lastName": userInstance.lastName,
          "swapCoins": 100,
          "username": userInstance.username,
          "profileUrl": uploadedProfilePhoto,
          "isEmailConfirmed": false,
          "paymentMethod": paymentMethod.gcash != null ? "gcash" : "maya",
          "docRequirements": [uploadedFrontId, uploadedBackId]
        };

        await customerInstance.add(dataToInsert);
        navigatorKey.currentState!.pushReplacement(
          MaterialPageRoute(builder: (context) => SuccessScreen()),
        );
      } catch (e) {
        print(e);
      }
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
                        value: "What best describes\nyou?",
                      ),
                      SizedBox(height: height * 0.024),
                      baseText(
                        value:
                            "Pick your role so you can start using the\nFarmSwap app.",
                      ),
                      SizedBox(height: height * 0.048),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              context.read<UserProvider>().setIsFarmer = true;
                            },
                            child: Column(
                              children: [
                                UserTypeCard(
                                  user: Image.asset(
                                    "assets/images/png/farmer.png",
                                  ),
                                  decoration: isFarmer,
                                ),
                                SizedBox(height: height * 0.024),
                                Text(
                                  'Farmer',
                                  style: TextStyle(
                                    color: isFarmer
                                        ? FarmSwapGreen.normalGreen
                                        : const Color(0xFF3B3B3B),
                                    fontSize: height * 0.024,
                                    fontFamily: 'Poppins',
                                    fontWeight: isFarmer
                                        ? FontWeight.w700
                                        : FontWeight.normal,
                                    letterSpacing: 0.50,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 37,
                            child: Text(
                              'or',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: const Color(0xFF3B3B3B),
                                fontSize: height * 0.024,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w700,
                                height: 1.31,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              context.read<UserProvider>().setIsFarmer = false;
                            },
                            child: Column(
                              children: [
                                UserTypeCard(
                                  user: Align(
                                    child: SvgPicture.asset(
                                      "assets/images/png/consumer.svg",
                                    ),
                                  ),
                                  decoration: !isFarmer,
                                ),
                                SizedBox(height: height * 0.024),
                                Text(
                                  'Consumer',
                                  style: TextStyle(
                                    color: !isFarmer
                                        ? FarmSwapGreen.normalGreen
                                        : const Color(0xFF3B3B3B),
                                    fontSize: height * 0.024,
                                    fontFamily: 'Poppins',
                                    fontWeight: !isFarmer
                                        ? FontWeight.w700
                                        : FontWeight.normal,
                                    letterSpacing: 0.50,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Center(
                        child: FarmSwapPrimaryButton(
                          buttonTitle: "Next",
                          // ignore: unnecessary_null_comparison
                          isEnabled: isFarmer != null,
                          onPress: () {
                            createUserAndSaveToFirestore();
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

class UserTypeCard extends StatelessWidget {
  const UserTypeCard({
    super.key,
    required this.user,
    required this.decoration,
  });

  final Widget user;
  final bool decoration;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 128,
      width: 128,
      decoration: decoration != true
          ? BoxDecoration(
              color: FarmSwapGreen.lightGreen,
              borderRadius: BorderRadius.circular(16.r),
            )
          : ShapeDecoration(
              gradient: const LinearGradient(
                begin: Alignment(0.00, -1.00),
                end: Alignment(0, 1),
                colors: [Color(0xFF27CB7D), Color(0xFF4EE48A)],
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.r),
              ),
            ),
      child: user,
    );
  }
}
