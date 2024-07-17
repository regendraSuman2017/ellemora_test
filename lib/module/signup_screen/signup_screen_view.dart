import 'package:almora_test/core/validator.dart';
import 'package:almora_test/module/signup_screen/signup_screen_controller.dart';
import 'package:almora_test/responsive.dart';
import 'package:almora_test/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreenView extends GetView<SignUpScreenController>{
  const SignUpScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    bool obscureText = true;
    double widthSize = Get.width;

    double width = ResponsiveLayout.isSmallScreen(context) ? widthSize/1: widthSize / 2;


    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child:
          SizedBox(
            width: ResponsiveLayout.isSmallScreen(context)
                ? width
                : ResponsiveLayout.isMediumScreen(context)
                ? widthSize/1.5
                : width/1,
            child: Form(
              key: controller.formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Sign Up",
                    style: TextStyle(fontSize: ResponsiveLayout.isSmallScreen(context)
                        ? widthSize*0.07
                        : ResponsiveLayout.isMediumScreen(context)
                        ? widthSize*0.04
                        : widthSize*0.05,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: ResponsiveLayout.isSmallScreen(context)
                        ? 30
                        : ResponsiveLayout.isMediumScreen(context)
                        ? 40
                        : 40,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Enter email id',

                        labelStyle:  TextStyle(
                          fontSize: ResponsiveLayout.isSmallScreen(context)
                              ? widthSize*0.04
                              : ResponsiveLayout.isMediumScreen(context)
                              ? widthSize*0.025
                              : widthSize*0.017,
                        ),
                        contentPadding: EdgeInsets.all(
                            ResponsiveLayout.isSmallScreen(context)
                                ? widthSize*0.035
                                : ResponsiveLayout.isMediumScreen(context)
                                ? widthSize*0.035
                                : widthSize*0.017),
                        border: const OutlineInputBorder()
                    ),


                    controller: controller.emailController,
                    validator: (String? value){
                      return Validator().validateEmail(value!);
                    },
                  ),
                  const SizedBox(height: 10),
                  StatefulBuilder(
                    builder: (BuildContext context, StateSetter setState) {
                      return TextFormField(
                        obscureText: obscureText,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle:  TextStyle(
                            fontSize: ResponsiveLayout.isSmallScreen(context)
                                ? widthSize*0.04
                                : ResponsiveLayout.isMediumScreen(context)
                                ? widthSize*0.025
                                : widthSize*0.017,
                          ),
                          contentPadding: EdgeInsets.all(
                              ResponsiveLayout.isSmallScreen(context)
                                  ? widthSize*0.035
                                  : ResponsiveLayout.isMediumScreen(context)
                                  ? widthSize*0.035
                                  : widthSize*0.017),

                          border: const OutlineInputBorder(),
                          suffixIcon: IconButton(
                            icon: Icon(
                              obscureText
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                            ),
                            onPressed: () {
                              setState(() {
                                obscureText = !obscureText;
                              });
                            },
                          ),
                        ),
                        controller: controller.passwordController,
                        validator: (String? value){
                          return Validator().validatePassword(value!);
                        },
                      );
                    },
                  ),

                  const SizedBox(height: 30),
                  GestureDetector(
                    onTap:  (){
                      bool isValid = controller.formKey.currentState!.validate();

                      if(!isValid){
                        return;
                      }

                      controller.registerUser();();
                    },
                    child: Container(
                      width: double.infinity,
                      height: 45,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize:ResponsiveLayout.isSmallScreen(context)
                                  ? widthSize*0.045
                                  : ResponsiveLayout.isMediumScreen(context)
                                  ? widthSize*0.035
                                  : widthSize*0.021,),
                          )),
                    ),
                  ),
                  const SizedBox(height: 10),

                  Row(children: <Widget>[
                    const Expanded(child: Divider()),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        'OR',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize:ResponsiveLayout.isSmallScreen(context)
                              ? widthSize*0.045
                              : ResponsiveLayout.isMediumScreen(context)
                              ? widthSize*0.035
                              : widthSize*0.021,),
                        textScaler: const TextScaler.linear(1),
                      ),
                    ),
                    const Expanded(child: Divider()),
                  ]),

                  GestureDetector(
                    onTap:  (){
                      controller.signUpWithGoogle();
                    },
                    child: Container(
                      width: double.infinity,
                      height: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                          child: controller.isSigningUp.value
                              ? const CircularProgressIndicator(color: Colors.white,)
                              : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset('assets/google.png',
                              height: ResponsiveLayout.isSmallScreen(context)
                              ? widthSize*0.06
                              : ResponsiveLayout.isMediumScreen(context)
                              ? widthSize*0.035
                              : widthSize*0.017),
                                   Text(
                                                              "Sign with Google",
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                      fontSize:ResponsiveLayout.isSmallScreen(context)
                                          ? widthSize*0.045
                                          : ResponsiveLayout.isMediumScreen(context)
                                          ? widthSize*0.035
                                          : widthSize*0.021,),
                                                            ).paddingSymmetric(horizontal: 10),
                                ],
                              )),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                       Text("Already have an account? ",style: TextStyle( fontSize:ResponsiveLayout.isSmallScreen(context)
                          ? widthSize*0.045
                          : ResponsiveLayout.isMediumScreen(context)
                          ? widthSize*0.03
                          : widthSize*0.017,),),
                      const SizedBox(height: 5),
                      GestureDetector(
                          onTap: () {
                            Get.toNamed(Routes.loginScreen);
                          },
                          child:  Text(
                            "Login",
                            style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold,
                              fontSize:ResponsiveLayout.isSmallScreen(context)
                                  ? widthSize*0.045
                                  : ResponsiveLayout.isMediumScreen(context)
                                  ? widthSize*0.03
                                  : widthSize*0.017,),
                          )),

                    ],
                  )
                ],
              ),
            ),
          )

        ),
      ),
    );
  }
}