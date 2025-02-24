import 'package:get/get.dart';
import 'package:weather_app/controllers/home_controller.dart';

class GlobalBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
