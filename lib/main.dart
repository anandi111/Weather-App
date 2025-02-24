import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:weather_app/utils/global_bindings.dart';
import 'package:weather_app/utils/route_names.dart';
import 'utils/route_generator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Weather App",
      debugShowCheckedModeBanner: false,
      initialBinding: GlobalBinding(),
      getPages: RouteGenerator.generator(),
      initialRoute: RouteNames.homeScreen,
    );
  }
}
