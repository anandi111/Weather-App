import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/models/weather_data_model.dart';
import 'package:weather_app/utils/global_constants.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  TextEditingController searchController = TextEditingController();
  Rx<WeatherDataModel> weatherDataModel = WeatherDataModel().obs;

  void onSearchCalled(String cityName) async {
    final Uri url = Uri.parse('${Constants.baseUrl}?q=$cityName&appid=${Constants.apiKey}&units=metric');

    try {
      final response = await http.get(url);

      Map<String, dynamic> data = json.decode(response.body);
      print(data);

      weatherDataModel.value = WeatherDataModel.fromJson(data);
      print(weatherDataModel.toString());
    } on SocketException catch (e) {
      Get.snackbar("OOpps!!", "No Internet connection. Please check your network: $e");
    } on TypeError catch (e) {
      Get.snackbar("OOpps!!", "Type Error: $e");
    } on FormatException catch (e) {
      Get.snackbar("OOpps!!", "Data format error. Unable to process the response: $e");
    } catch (e) {
      Get.snackbar("OOpps!!", "$e");
    }
  }
}
