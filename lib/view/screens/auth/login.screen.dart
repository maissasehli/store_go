import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:store_go/core/constants/color.dart';
import 'package:store_go/core/constants/imageasset.dart';
import 'package:store_go/core/functions/validinput.dart';
import 'package:store_go/controller/auth/login.controller.dart';
import 'package:store_go/view/screens/auth/forgetpassword.screen.dart';
import 'package:store_go/view/widgets/auth/customtextformauth.widgets.dart';
import 'package:store_go/view/widgets/auth/customauthbutton.widgets.dart';
import 'package:store_go/view/widgets/auth/customtextbodyauth.widgets.dart';
import 'package:store_go/view/widgets/auth/customtexttitle.widgets.dart';
import 'package:store_go/core/functions/alertexitapp.dart';
import 'package:store_go/view/widgets/extensions/text.extensions.dart';
import 'package:store_go/view/widgets/ui/theme_toggle.dart';
import 'package:store_go/core/services/authsupabase.service.dart'; // Import AuthService

class Login extends GetView<LoginController> {
  Login({Key? key}) : super(key: key);

  // Initialize GoogleAuthController
  // Initialize AuthService
  final AuthService _authService = Get.find<AuthService>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Show the exit confirmation dialog when the user presses the back button
        return await alertExitApp() ?? false;
      },
      child: Scaffold(
        appBar: AppBar(actions: const [ThemeToggle()]),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Form(
              key: controller.loginFormKey,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: AppColor.spacingM),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 60),
                    const Text('log in').heading1(context),
                    const SizedBox(height: 40),
                    CustomTextFormAuth(
                      controller: controller.emailController,
                      hintText: 'Email Address',
                      validator: (val) => validInput(val!, 5, 100, "email"),
                    ),
                    const SizedBox(height: 20),
                    CustomTextBodyAuth(
                      controller: controller.passwordController,
                      hintText: 'Password',
                      obscureText: true,
                      validator: (val) => validInput(val!, 8, 30, "password"),
                    ),
                    const SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: controller.goToForgetPassword,
                        child: Text(
                          'Forgot Password?',
                          style: AppColor.bodySmall.copyWith(
                            color: Colors.black,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    CustomAuthButton(
                      onPressed: controller.login,
                      text: 'Continue',
                    ),

                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: controller.goToSignup,
                      child: Text(
                        "Don't have an Account? Create One",
                        style: AppColor.bodyMedium.copyWith(
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 40),
                    Row(
                      children: [
                        Expanded(child: Divider(color: Colors.grey.shade300)),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            'or',
                            style: TextStyle(color: Colors.grey.shade600),
                          ),
                        ),
                        Expanded(child: Divider(color: Colors.grey.shade300)),
                      ],
                    ),
                    const SizedBox(height: 40),
                    // Google Sign-In Button with loading state
                    _buildSocialLoginButton(
                      icon: ImageAsset.googleIcon,
                      text: 'Continue With Google',
                      onPressed: () => _authService.signInWithGoogle(),
                    ),
                    const SizedBox(height: 20),
                    _buildSocialLoginButton(
                      icon: ImageAsset.appleIcon,
                      text: 'Continue With Apple',
                      onPressed: () {},
                    ),
                    const SizedBox(height: 20),
                    _buildSocialLoginButton(
                      icon: ImageAsset.facebookIcon,
                      text: 'Continue With Facebook',
                      onPressed:
                          () =>
                              _authService.loginWithFacebook(context: context),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSocialLoginButton({
    required String icon,
    required String text,
    required VoidCallback? onPressed,
    bool isLoading = false,
  }) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: Colors.grey.shade300),
        padding: const EdgeInsets.symmetric(vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppColor.globalBorderRadius),
        ),
      ),
      child:
          isLoading
              ? CircularProgressIndicator(color: Colors.black)
              : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(icon, width: 24, height: 24),
                  const SizedBox(width: 10),
                  Text(
                    text,
                    style: AppColor.bodyMedium.copyWith(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
    );
  }
}
