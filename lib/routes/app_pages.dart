import 'package:almora_test/module/home_page/home_page.dart';
import 'package:almora_test/module/home_page/home_page_binding.dart';
import 'package:almora_test/module/login_screen/login_screen_binding.dart';
import 'package:almora_test/module/login_screen/login_screen_view.dart';
import 'package:almora_test/module/product_detail_page/product_detail_binding.dart';
import 'package:almora_test/module/product_detail_page/product_detail_page.dart';
import 'package:almora_test/module/signup_screen/signup_screen_binding.dart';
import 'package:almora_test/module/signup_screen/signup_screen_view.dart';
import 'package:almora_test/module/splash/splash_binding.dart';
import 'package:almora_test/module/splash/splash_page.dart';
import 'package:get/get.dart';
part 'app_routes.dart';

class AppPages {
  AppPages._();
  static const  String initial = Routes.splashScreen;

  static final List<GetPage<dynamic>> routes = [
    GetPage(name: _Paths.splashScreen, page: () => const SplashScreen(), binding: SplashBinding()),
    GetPage(name: _Paths.homeScreen, page: () =>  const HomePage(), binding: HomePageBinding()),
    GetPage(name: _Paths.productDetailScreen, page: () =>  const ProductDetailPage(), binding: ProductDetailBinding()),
    GetPage(name: _Paths.signUpScreenView, page: () => const SignUpScreenView(), binding: SignUpScreenBinding()),
    GetPage(name: _Paths.loginScreen, page: () => const LoginScreenView(), binding: LoginScreenBinding()),

  ];
}