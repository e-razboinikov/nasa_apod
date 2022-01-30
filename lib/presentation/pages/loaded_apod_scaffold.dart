import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:nasa_apod/bloc/apod_bloc.dart';
import 'package:nasa_apod/data/models/apod.dart';
import 'package:nasa_apod/presentation/pages/full_screen_image.dart';
import 'package:nasa_apod/presentation/widgets/custom_image_loader.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class LoadedApodScaffold extends StatelessWidget {
  final Apod apodData;

  const LoadedApodScaffold({required this.apodData, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime currentDate = context.read<ApodBloc>().date;

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
        initialDate: currentDate,
        firstDate: DateTime.parse('1995-06-16'),
        lastDate: DateTime.now(),
      ).then((value) {
        if (value != null) {
          context.read<ApodBloc>().date = value;
          context.read<ApodBloc>().add(LoadApodEvent());
        }
      });
    }

    void _swiping(DismissDirection direction) {
      if (direction == DismissDirection.startToEnd) {
        context.read<ApodBloc>().date = DateTime(
          currentDate.year,
          currentDate.month,
          currentDate.day - 1,
        );
        context.read<ApodBloc>().add(LoadApodEvent());
      } else if (direction == DismissDirection.endToStart) {
        context.read<ApodBloc>().date = DateTime(
          currentDate.year,
          currentDate.month,
          currentDate.day + 1,
        );
        context.read<ApodBloc>().add(LoadApodEvent());
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(DateFormat('EEE, MMMM dd, yyyy').format(currentDate)),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.change_circle_outlined,
            ),
            onPressed: () =>
                context.read<ApodBloc>().add(LoadRandomApodEvent()),
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
        direction: (currentDate.day == DateTime.now().day)
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
          body: Stack(
            children: [
              GestureDetector(
                onTap: () => MaterialPageRoute(
                    builder: (ctx) =>
                        FullScreenImage(imageUrl: apodData.imageUrl)),
                child: CustomImageLoader(
                  imageUrl: apodData.imageUrl,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10.0),
                color: Colors.black45,
                width: double.infinity,
                child: Text(
                  apodData.title,
                  style: Theme.of(context).textTheme.headline5,
                  textAlign: TextAlign.end,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
