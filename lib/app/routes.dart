import 'package:get/get.dart';
import 'package:noctua_obox/app/view/controllers/splash/splash_dependencies.dart';
import 'package:noctua_obox/app/view/pages/splash_page.dart';

class Routes {
  static const splash = '/';
  static const home = '/home';
  static final pageList = [
    GetPage(
      name: Routes.splash,
      binding: SplashDependencies(),
      page: () => const SplashPage(),
    ),
  ];
}
