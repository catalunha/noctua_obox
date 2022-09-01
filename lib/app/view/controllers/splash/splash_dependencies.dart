import 'package:get/get.dart';
import 'package:noctua_obox/app/view/controllers/splash/splash_controller.dart';

class SplashDependencies implements Bindings {
  @override
  void dependencies() {
    // Get.put<AuthRepository>(
    //   AuthRepositoryB4a(),
    // );
    // Get.put<AuthUseCase>(
    //   AuthUseCaseImpl(
    //     authRepository: Get.find(),
    //   ),
    // );
    Get.put<SplashController>(
      SplashController(
          // authUseCase: Get.find(),
          ),
      permanent: true,
    );
  }
}
