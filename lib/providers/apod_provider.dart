import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import '../models/apod.dart';

class ApodProvider with ChangeNotifier {
  final apiKey = 'urwoHdDcZWy1wssi8rT4LaM3erpDzszqhIbSoFYT';
  var _selectedDate = DateTime.now();
  late Apod apod;
  var isLoading = false;

  DateTime get selectedDate => _selectedDate;

  ApodProvider() {
    fetchApod();
  }

  Future<void> updateSelectedDate(DateTime newDate) async {
    if (newDate == _selectedDate || newDate == null) {
      return;
    } else {
      _selectedDate = DateTime.parse(newDate.toString());
      await fetchApod();
      notifyListeners();
    }
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

  Future<void> fetchApod() async {
    isLoading = true;
    notifyListeners();
    final dateFormatted = DateFormat('yyyy-MM-dd').format(_selectedDate);
    final apodUri = Uri.parse(
        'https://api.nasa.gov/planetary/apod?api_key=$apiKey&date=$dateFormatted');
    final response = await http.get(apodUri);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as Map;
      apod = Apod.fromJson(json);
      notifyListeners();
    } else {
      throw ('Cant fetch APOD');
    }
    isLoading = false;
    notifyListeners();
  }
}
