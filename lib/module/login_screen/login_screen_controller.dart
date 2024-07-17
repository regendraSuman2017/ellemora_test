import 'package:almora_test/routes/app_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LoginScreenController extends GetxController{

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FocusNode? focusNode;

  static final formKey = GlobalKey<FormState>();

  final GoogleSignIn googleSignIn = GoogleSignIn();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    focusNode!.dispose();
    super.dispose();
  }

  RxBool isSigningUp = false.obs;

@override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    focusNode = FocusNode();
  }


  void loginUser() async {
    showDialog(
        context: Get.context!,
        builder: (BuildContext _) => Center(
          child: LoadingAnimationWidget.threeArchedCircle(
            color: const Color.fromARGB(255, 255, 177, 41),
            size: Get.width*0.12,
          ),
        )
    );


    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      Navigator.of(Get.context!).pop();
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool('isLogin', true);
      await Future.delayed(const Duration(seconds: 1));
      Get.offAllNamed(Routes.homeScreen);

    } catch (e) {
      Navigator.of(Get.context!).pop();
      await Future.delayed(const Duration(seconds: 1));
      Fluttertoast.showToast(msg:  "Some error happened");
    }
  }

  Future<UserCredential?> signInWithGoogle() async {
    showDialog(
        context: Get.context!,
        builder: (BuildContext _) => Center(
          child: LoadingAnimationWidget.threeArchedCircle(
            color: const Color.fromARGB(255, 255, 177, 41),
            size: Get.width*0.12,
          ),
        )
    );
    final FirebaseAuth _auth = FirebaseAuth.instance;
    try {
      final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();

      if (googleSignInAccount != null) {

        final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        await _auth.signInWithCredential(credential);
        Navigator.of(Get.context!).pop();
        await Future.delayed(const Duration(seconds: 1));
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setBool('isLogin', true);
          await Future.delayed(const Duration(seconds: 1));
          Get.offAllNamed(Routes.homeScreen);

        await googleSignIn.disconnect();

      }
    } catch (error) {
      if (kDebugMode) {
        print(error);
      }
    }
  }


}