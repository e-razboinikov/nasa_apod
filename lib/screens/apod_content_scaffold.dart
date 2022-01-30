import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../providers/apod_provider.dart';
import '../widgets/image_content.dart';
import '../widgets/video_content.dart';

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
        apodData.updateSelectedDateAndFetchApod(value ?? apodData.selectedDate);
      });
    }

    void _swiping(DismissDirection direction) {
      final selectedDate = apodData.selectedDate;
      if (direction == DismissDirection.startToEnd) {
        apodData.updateSelectedDateAndFetchApod(
          DateTime(
            selectedDate.year,
            selectedDate.month,
            selectedDate.day - 1,
          ),
        );
      } else if (direction == DismissDirection.endToStart) {
        apodData.updateSelectedDateAndFetchApod(
          DateTime(
            selectedDate.year,
            selectedDate.month,
            selectedDate.day + 1,
          ),
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          apodData.dateForBar,
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
        onDismissed: (direction) => _swiping(direction),
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
              ),
            ),
          ),
          panel: SingleChildScrollView(
            child: Text(apodData.explanation),
          ),
          body: apodData.isVideo ? const VideoContent() : const ImageContent(),
        ),
      ),
    );
  }
}
