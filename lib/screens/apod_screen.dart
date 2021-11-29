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
        builder: (context, child) {
          return Theme(
            data: ThemeData.dark(),
            child: child!,
          );
        },
        fieldHintText: 'MM-DD-YYYY',
        context: context,
        initialDate: _selectedDate,
        firstDate: DateTime.parse('1995-06-16'),
        lastDate: DateTime.now(),
      ).then((value) {
        if (value == _selectedDate || value == null) {
          return;
        } else {
          setState(() {
            _selectedDate = DateTime.parse(value.toString());
          });
        }
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          DateFormat('EEE, MMMM dd, yyyy').format(_selectedDate),
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
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: ApodBody(selectedDate: _selectedDate),
      ),
    );
  }
}
