import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../widgets/apod_body.dart';

class ApodScreen extends StatefulWidget {
  const ApodScreen({Key? key}) : super(key: key);

  @override
  State<ApodScreen> createState() => _ApodScreenState();
}

class _ApodScreenState extends State<ApodScreen> {
  var _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    void _showDatePicker() {
      showDatePicker(
        context: context,
        initialDate: _selectedDate,
        firstDate: DateTime.parse('1995-06-16'),
        lastDate: DateTime.now(),
      ).then((value) {
        setState(() {
          _selectedDate = value ?? _selectedDate;
        });
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          DateFormat('dd.MM.yyyy').format(_selectedDate),
        ),
        actions: [
          IconButton(
            onPressed: () => _showDatePicker(),
            icon: const Icon(
              Icons.calendar_today_outlined,
            ),
          ),
        ],
      ),
      body: ApodBody(selectedDate: _selectedDate),
    );
  }
}
