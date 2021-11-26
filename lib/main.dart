import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:google_sign_in_flutter_app/newScreen.dart';
import 'package:get/get.dart';

import 'common_widgets/custom_raised_button.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // auth object
  final FirebaseAuth _auth = FirebaseAuth.instance;
// signinobject
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  bool isSigned = false;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      textDirection: TextDirection.rtl,
      home: Scaffold(
        body: Center(
          child: Column(
            //محاور العمود
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            //التوابع
            children: <Widget>[
              Text(
                "Taza Store",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              CustomRaisedButton(
                color: Colors.red,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("تسجيل الدخول"),
                    Icon(Icons.login),
                  ],
                ),
                onPressed: () async {
                  await signInWithGoogle();
                },
              ),
              SizedBox(
                width: double.infinity,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> signInWithGoogle() async {
    // signin

    GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;
    AuthCredential authCredential = GoogleAuthProvider.getCredential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);
    AuthResult authResult = await _auth.signInWithCredential(authCredential);
    // user
    FirebaseUser user = await _auth.currentUser();
    // email
    isSigned = true;
    print('user email = ${user.email}');
    Get.to(HomePage(
      userMail: user.email,
    ));
  }

  Future<void> signOut() async {
    await _googleSignIn.signOut();
    print('sign out');
  }
}
