import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class Apod {
  final DateTime date;
  final String explanation;
  final String title;
  final String url;
  final String hdurl;

  String get dateForBar => DateFormat('EEE, MMMM dd, yyyy').format(date);

  bool get isVideo => url.contains('youtube');

  Apod({
    required this.date,
    required this.explanation,
    required this.title,
    required this.url,
    required this.hdurl,
  });

  factory Apod.fromJson(Map json) {
    return Apod(
      date: DateTime.parse(json['date']),
      explanation: json['explanation'],
      title: json['title'],
      url: json['url'],
      hdurl: json['hdurl'] ?? '',
    );
  }
}

class ApodProvider with ChangeNotifier {
  static const apiKey = 'urwoHdDcZWy1wssi8rT4LaM3erpDzszqhIbSoFYT';
  late Apod apod;
  var selectedDate = DateTime.now();
  var isLoading = false;

  ApodProvider() {
    fetchApod();
  }

  Future<void> fetchApod() async {
    final dateForApi = DateFormat('yyyy-MM-dd').format(selectedDate);
    isLoading = true;
    notifyListeners();
    final apodUri = Uri.parse(
        'https://api.nasa.gov/planetary/apod?api_key=$apiKey&date=$dateForApi');
    final response = await http.get(apodUri);
    if (response.statusCode == 200) {
      await _parseApod(response.body);
    } else {
      print(response.statusCode);
      throw (response.statusCode);
    }
    isLoading = false;
    notifyListeners();
  }

  Future<void> _parseApod(String responseBody) async {
    final json = await jsonDecode(responseBody) as Map;
    apod = Apod.fromJson(json);
  }

  Future<void> setRandomDate() async {
    final startDate = DateTime(1995, 6, 16);
    final endDate = DateTime.now();
    final randomRange = DateTimeRange(start: startDate, end: endDate);

    await updateSelectedDate(
      DateTime(
        startDate.year,
        startDate.month,
        startDate.day + Random().nextInt(randomRange.duration.inDays),
      ),
    );
  }

  Future<void> updateSelectedDate(DateTime newDate) async {
    if (newDate == selectedDate) {
      return;
    } else {
      selectedDate = newDate;
      await fetchApod();
      notifyListeners();
    }
  }
}
