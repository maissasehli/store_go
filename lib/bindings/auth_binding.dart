import 'package:get/get.dart';
import 'package:store_go/controller/auth/emailsentcontroller%20.dart';
import 'package:store_go/controller/auth/forgetpasswordcontroller.dart';
import 'package:store_go/controller/auth/logincontroller.dart';
import 'package:store_go/controller/auth/signupcontroller.dart';

class AuthBinding implements Bindings {
  @override
  void dependencies() {
    // Enregistrez les contrôleurs pour l'authentification
    Get.lazyPut<LoginController>(() => LoginController());

    
    Get.lazyPut<SignupController>(() => SignupController());
    Get.lazyPut<ForgetPasswordController>(() => ForgetPasswordController());
        Get.lazyPut<EmailSentController>(() => EmailSentController());


  }
}