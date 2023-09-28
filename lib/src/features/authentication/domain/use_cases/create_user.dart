import 'package:firebase_auth/firebase_auth.dart';

Future<void> createUser(String email, String password, String username) async {
  // Create a new instance of the FirebaseAuth class.
  final auth = FirebaseAuth.instance;
  final user = auth.currentUser;

  // Create a new user with the user's email address and password.
  final userCredential = await auth.createUserWithEmailAndPassword(
    email: email,
    password: password,
  );

  await userCredential.user?.sendEmailVerification();
  await userCredential.user?.updateDisplayName(username);

  // await user?.sendEmailVerification();

  // // Update the user's username.
  // await user?.updateDisplayName(username);
}
