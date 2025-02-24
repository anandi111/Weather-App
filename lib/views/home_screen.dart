import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/controllers/home_controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather App"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: controller.searchController,
              decoration: InputDecoration(
                hintText: "Enter City Name",
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () => controller.onSearchCalled(controller.searchController.text.trim()),
                ),
              ),
              onSubmitted: (value) {
                controller.onSearchCalled(value);
              },
            ),
            const SizedBox(height: 20),
            Obx(() {
              if (controller.weatherDataModel.value.name == null) {
                return const Text("Enter a city name and search!", style: TextStyle(fontSize: 18));
              }
              if (controller.weatherDataModel.value.message != null) {
                return const Text("No Data Found.", style: TextStyle(fontSize: 18));
              }

              final weather = controller.weatherDataModel.value;

              return Column(
                children: [
                  Text(
                    "${weather.name}, ${weather.sys?.country ?? ''}",
                    style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "${weather.main?.temp?.toStringAsFixed(1) ?? '--'}°C",
                    style: const TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    weather.weather?.isNotEmpty == true ? weather.weather![0].description ?? "" : "No description",
                    style: const TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.water_drop, color: Colors.blue),
                      Text(" Humidity: ${weather.main?.humidity ?? '--'}%"),
                      const SizedBox(width: 20),
                      const Icon(Icons.air, color: Colors.grey),
                      Text(" Wind: ${weather.wind?.speed?.toStringAsFixed(1) ?? '--'} m/s"),
                    ],
                  ),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}
