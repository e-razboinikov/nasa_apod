import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../providers/apod_provider.dart';
import '../widgets/apod_body.dart';

class ApodScreen extends StatefulWidget {
  const ApodScreen({Key? key}) : super(key: key);

  @override
  State<ApodScreen> createState() => _ApodScreenState();
}

class _ApodScreenState extends State<ApodScreen> {
  var _isLoading = true;
  @override
  Widget build(BuildContext context) {
    final apodData = Provider.of<ApodProvider>(context);
    apodData.fetchApod().then((_) {
      setState(() {
        _isLoading = false;
      });
    });
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
        initialDate: apodData.selectedDate,
        firstDate: DateTime.parse('1995-06-16'),
        lastDate: DateTime.now(),
      ).then((value) {
        if (value == apodData.selectedDate || value == null) {
          return;
        } else {
          setState(() {
            apodData.selectedDate = DateTime.parse(value.toString());
            apodData.fetchApod();
            _isLoading = true;
          });
          // _isLoading = true;
        }
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          DateFormat('EEE, MMMM dd, yyyy').format(apodData.selectedDate),
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
      body: _isLoading
          ? const CircularProgressIndicator()
          : SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Text(apodData.apod.title),
            ),
    );
  }
}
