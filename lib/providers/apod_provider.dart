import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

const _apiKey = 'urwoHdDcZWy1wssi8rT4LaM3erpDzszqhIbSoFYT';
const _defaultImageUrl =
    'https://sbis.perm.ru/wp-content/uploads/2019/09/placeholder.png';

class ApodProvider with ChangeNotifier {
  late String _title;
  late String _explanation;
  late String _url;
  late String _hdurl;
  DateTime _selectedDate = DateTime.now();

  String get title => _title;
  String get explanation => _explanation;
  String get url => _url;
  String get hdurl => _hdurl;
  DateTime get selectedDate => _selectedDate;
  String get _dateForApi => DateFormat('yyyy-MM-dd').format(_selectedDate);
  String get dateForBar =>
      DateFormat('EEE, MMMM dd, yyyy').format(_selectedDate);
  bool get isVideo => _url.contains('youtube');

  bool isLoading = false;

  ApodProvider() {
    fetchApod();
  }

  Future<void> fetchApod() async {
    isLoading = true;
    notifyListeners();

    final apodUri = Uri.parse(
        'https://api.nasa.gov/planetary/apod?api_key=$_apiKey&date=$_dateForApi');
    final response = await http.get(apodUri);

    if (response.statusCode == 200) {
      _parseApod(response.body);
    } else {
      throw (response.statusCode);
    }

    isLoading = false;
    notifyListeners();
  }

  void _parseApod(String responseBody) {
    final json = jsonDecode(responseBody) as Map;

    _title = json['title'] ?? 'Unknown APOD';
    _explanation = json['explanation'] ?? 'Cant load APOD, try again';
    _url = json['url'] ?? _defaultImageUrl;
    _hdurl = json['hdurl'] ?? _defaultImageUrl;
  }

  Future<void> setRandomDate() async {
    final startDate = DateTime(1995, 6, 16);
    final endDate = DateTime.now();
    final randomRange = DateTimeRange(start: startDate, end: endDate);

    await updateSelectedDateAndFetchApod(
      DateTime(
        startDate.year,
        startDate.month,
        startDate.day + Random().nextInt(randomRange.duration.inDays),
      ),
    );
  }

  Future<void> updateSelectedDateAndFetchApod(DateTime newDate) async {
    if (newDate == _selectedDate) {
      return;
    } else {
      _selectedDate = newDate;
      await fetchApod();
      notifyListeners();
    }
  }
}
