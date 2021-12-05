import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../providers/apod_provider.dart';
import '../screens/full_screen_image_screen.dart';

class ApodScaffold extends StatelessWidget {
  const ApodScaffold({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final apodData = Provider.of<ApodProvider>(context);

    Widget imageContent = Stack(
      children: [
        GestureDetector(
          onTap: () =>
              Navigator.of(context).pushNamed(FullScreenImage.routeName),
          child: Image.network(
            apodData.apod.url,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) {
                return child;
              }
              return LinearProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                        loadingProgress.expectedTotalBytes!
                    : null,
              );
            },
          ),
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
    );

    Widget videoContent = Center(
      child: Text(apodData.apod.url),
    );

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
          apodData.apod.dateForBar,
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.change_circle_outlined,
            ),
            onPressed: apodData.setRandomDate,
          ),
          IconButton(
            onPressed: () => _showDatePicker(),
            icon: const Icon(
              Icons.calendar_today_outlined,
            ),
          ),
        ],
      ),
      body: Dismissible(
        key: ValueKey(DateTime.now()),
        direction: (apodData.selectedDate.day == DateTime.now().day)
            ? DismissDirection.startToEnd
            : DismissDirection.horizontal,
        onDismissed: (direction) {
          final selectedDate = apodData.selectedDate;
          if (direction == DismissDirection.startToEnd) {
            apodData.updateSelectedDate(
              DateTime(
                selectedDate.year,
                selectedDate.month,
                selectedDate.day - 1,
              ),
            );
          } else if (direction == DismissDirection.endToStart) {
            apodData.updateSelectedDate(
              DateTime(
                selectedDate.year,
                selectedDate.month,
                selectedDate.day + 1,
              ),
            );
          }
        },
        child: RefreshIndicator(
          onRefresh: apodData.fetchApod,
          child: SlidingUpPanel(
            color: Colors.black,
            collapsed: Container(
              color: Colors.black,
              child: Center(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.arrow_upward_outlined,
                    color: Colors.white,
                  ),
                  Text('Explanation'),
                ],
              )),
            ),
            panel: SingleChildScrollView(
              child: Text(apodData.apod.explanation),
            ),
            body: apodData.isVideo ? videoContent : imageContent,
          ),
        ),
      ),
    );
  }
}
