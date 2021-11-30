import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import '../models/apod.dart';

class ApodProvider with ChangeNotifier {
  final apiKey = 'urwoHdDcZWy1wssi8rT4LaM3erpDzszqhIbSoFYT';
  var selectedDate = DateTime.now();
  late Apod apod;

  Future<void> fetchApod() async {
    final dateFormatted = DateFormat('yyyy-MM-dd').format(selectedDate);
    final apodUri = Uri.parse(
        'https://api.nasa.gov/planetary/apod?api_key=$apiKey&date=$dateFormatted');
    final response = await http.get(apodUri);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as Map;
      final decodedApod = Apod.fromJson(json);
      apod = decodedApod;
      notifyListeners();
    } else {
      throw ('Cant fetch APOD');
    }
  }
}

// Future<String> fetchImage(DateTime selectedDate) async {
//   final dateFormatted = DateFormat('yyyy-MM-dd').format(selectedDate);
//   final apodUri = Uri.parse(
//       'https://api.nasa.gov/planetary/apod?api_key=$apiKey&date=$dateFormatted');
//   final response = await http.get(apodUri);
//   if (response.statusCode == 200) {
//     final json = jsonDecode(response.body);
//     return json['url'];
//   } else {
//     throw ('Cant fetch image url');
//   }
// }

// Future<String> fetchTitle(DateTime selectedDate) async {
//   final dateFormatted = DateFormat('yyyy-MM-dd').format(selectedDate);
//   final apodUri = Uri.parse(
//       'https://api.nasa.gov/planetary/apod?api_key=$apiKey&date=$dateFormatted');
//   final response = await http.get(apodUri);
//   if (response.statusCode == 200) {
//     final json = jsonDecode(response.body);
//     return json['title'];
//   } else {
//     throw ('Cant fetch title');
//   }
// }

// Future<String> fetchExplanation(DateTime selectedDate) async {
//   final dateFormatted = DateFormat('yyyy-MM-dd').format(selectedDate);
//   final apodUri = Uri.parse(
//       'https://api.nasa.gov/planetary/apod?api_key=$apiKey&date=$dateFormatted');
//   final response = await http.get(apodUri);
//   if (response.statusCode == 200) {
//     final json = jsonDecode(response.body);
//     return json['explanation'];
//   } else {
//     throw ('Cant fetch explanation');
//   }
// }
