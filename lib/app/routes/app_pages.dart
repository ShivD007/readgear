import 'package:nirog_street/app/modules/changePassword/bindings/change_password_binding.dart';
import 'package:nirog_street/app/modules/changePassword/views/change_password_view.dart';
import 'package:nirog_street/app/modules/createAccount/bindings/create_account_binding.dart';
import 'package:nirog_street/app/modules/createAccount/views/create_account_view.dart';
import 'package:nirog_street/app/modules/forgot_password/bindings/forgot_password_binding.dart';
import 'package:nirog_street/app/modules/forgot_password/views/forgot_password_view.dart';
import 'package:nirog_street/app/modules/loginWithOTP/bindings/login_with_o_t_p_binding.dart';
import 'package:nirog_street/app/modules/loginWithOTP/views/login_with_otp_view.dart';
import 'package:nirog_street/app/modules/loginWithPassword/bindings/login_with_password_binding.dart';
import 'package:nirog_street/app/modules/loginWithPassword/views/login_with_password_view.dart';
import 'package:nirog_street/app/modules/splash/bindings/splash_binding.dart';
import 'package:nirog_street/app/modules/splash/views/splash_view.dart';
import 'package:nirog_street/app/modules/verification/bindings/verification_binding.dart';
import 'package:nirog_street/app/modules/verification/views/verification_view.dart';
import 'package:nirog_street/app/modules/walkThrough/bindings/walk_through_binding.dart';
import 'package:nirog_street/app/modules/walkThrough/views/walk_through_view.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN_PASSWORD,
      page: () => LoginWithPasswordView(),
      binding: LoginWithPasswordBinding(),
    ),
    GetPage(
      name: _Paths.CREATE_ACCOUNT,
      binding: CreateAccountBinding(),
      page: () => CreateAccountView(),
    ),
    GetPage(
      name: _Paths.VERIFICATION,
      binding: VerificationBinding(),
      page: () => VerificationView(),
    ),
    GetPage(
      name: _Paths.WALKTHROUGH,
      binding: WalkThroughBinding(),
      page: () => const WalkThroughView(),
    ),
    GetPage(
      name: _Paths.LOGIN_WITH_OTP,
      binding: LoginWithOTPBinding(),
      page: () => LoginWithOTPView(),
    ),
    GetPage(
      name: _Paths.CHANGE_PASWORD,
      binding: ChangePasswordBinding(),
      page: () => ChangePasswordView(),
    ),
    GetPage(
      name: _Paths.FORGOT_PASSWORD,
      binding: ForgotPasswordBinding(),
      page: () => ForgotPasswordView(),
    ),
  ];
}
