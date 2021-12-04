import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:transparent_image/transparent_image.dart';

import '../providers/apod_provider.dart';

class ApodScaffold extends StatelessWidget {
  const ApodScaffold({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final apodData = Provider.of<ApodProvider>(context);

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
        apodData.updateSelectedDate(value ?? apodData.selectedDate);
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
      body: RefreshIndicator(
        onRefresh: apodData.fetchApod,
        child: ListView(
          children: [
            Column(
              children: [
                Stack(
                  children: [
                    FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image: apodData.apod.url,
                    ),
                    Container(
                      padding: const EdgeInsets.all(10.0),
                      color: Colors.black45,
                      width: double.infinity,
                      child: Text(
                        apodData.apod.title,
                        style: Theme.of(context).textTheme.headline5,
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(apodData.apod.explanation),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
