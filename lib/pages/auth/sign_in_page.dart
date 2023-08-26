// import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:foody/base/custom_loader.dart';
import 'package:foody/base/show_custom_snackbar.dart';
import 'package:foody/controllers/auth_controller.dart';
import 'package:foody/pages/auth/sign_up_page.dart';
import 'package:foody/routes/route_helper.dart';
import 'package:foody/utils/dimensions.dart';
import 'package:foody/widgets/app_text_field.dart';
import 'package:foody/widgets/big_text.dart';
import 'package:get/get.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    void _login(AuthController authController) {
      // var authController = Get.find<AuthController>();

      String email = emailController.text.trim();
      String password = passwordController.text.trim();

      if (email.isEmpty) {
        showCustomSnackBar("Type in your email address",
            title: "Email address");
      } else if (!GetUtils.isEmail(email)) {
        showCustomSnackBar("Type in a valid email address",
            title: "Valid email address");
      } else if (password.isEmpty) {
        showCustomSnackBar("Type in your password", title: "password");
      } else if (password.length < 6) {
        showCustomSnackBar("Password can not be less than six characters",
            title: "Password");
      } else {
        // showCustomSnackBar("All went well ", title: "Perfect");

        authController.login(email, password).then((status) {
          if (status.isSuccess) {
            Get.toNamed(RouteHelper.getIntitial());

            // Get.toNamed(RouteHelper.getCartPage());
          } else {
            print("failed to load");
            showCustomSnackBar(status.message);
          }
        });
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<AuthController>(
        builder: (authController) {
          return !authController.isLoading
              ? SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      SizedBox(
                        height: Dimensions.screenHeigth * 0.1,
                      ),
                      //app logo
                      Container(
                        child: Center(
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 80,
                            backgroundImage: AssetImage("assets/image/sp.jpeg"),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Dimensions.height30,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: Dimensions.width20),
                        width: double.maxFinite,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Hello",
                              style: TextStyle(
                                fontSize: Dimensions.font20 * 3 +
                                    Dimensions.font20 / 2,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Sign into your account",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: Dimensions.font20,
                                // fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ),
                      //your email
                      SizedBox(
                        height: Dimensions.height20,
                      ),
                      AppTextField(
                          hintText: "Email",
                          icon: Icons.email,
                          textController: emailController),
                      SizedBox(
                        height: Dimensions.height20,
                      ),
                      //your password
                      AppTextField(
                          hintText: "Password",
                          icon: Icons.password_sharp,
                          isObscure: true,
                          textController: passwordController),

                      //sign up button

                      SizedBox(
                        height: Dimensions.height20,
                      ),
                      //tagline
                      Row(
                        children: [
                          Expanded(child: Container()),
                          RichText(
                              text: TextSpan(
                                  text: "sign into your account",
                                  style: TextStyle(
                                      color: Colors.grey[500],
                                      fontSize: Dimensions.font20))),
                          SizedBox(
                            width: Dimensions.width20,
                          )
                        ],
                      ),

                      SizedBox(
                        height: Dimensions.screenHeigth * 0.05,
                      ),
                      //sign in
                      GestureDetector(
                        onTap: () {
                          _login(authController);
                        },
                        child: Container(
                          width: Dimensions.screenWidth / 2,
                          height: Dimensions.screenHeigth / 13,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(Dimensions.radius30),
                              color: Colors.amber),
                          child: Center(
                              child: BigText(
                            text: "Sign In",
                            size: Dimensions.font20 + Dimensions.font20 / 2,
                            color: Colors.white,
                          )),
                        ),
                      ),
                      SizedBox(
                        height: Dimensions.screenHeigth * 0.05,
                      ),

                      RichText(
                          text: TextSpan(
                              text: "Don\'t have an account?",
                              style: TextStyle(
                                  color: Colors.grey[500],
                                  fontSize: Dimensions.font20 / 1.1),
                              children: [
                            TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => Get.to(() => SignUpPage(),
                                    transition: Transition.fade),
                              text: "Create",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: Dimensions.font20 / 1.1),
                            )
                          ])),
                    ],
                  ),
                )
              : CustomLoader();
        },
      ),
    );
  }
}
