import 'package:get/get.dart';
import 'package:weather_app/utils/global_bindings.dart';
import 'package:weather_app/utils/route_names.dart';
import 'package:weather_app/views/home_screen.dart';

class RouteGenerator {
  static List<GetPage<dynamic>>? generator() => <GetPage<dynamic>>[
        GetPage(
          name: RouteNames.homeScreen,
          page: () => const HomeScreen(),
          binding: GlobalBinding(),
        ),
      ];
}
