import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:nasa_apod/application/features/apod_screen/presentation/bloc/apod_bloc.dart';
import 'package:nasa_apod/application/features/apod_screen/presentation/pages/full_screen_image.dart';
import 'package:nasa_apod/application/features/apod_screen/presentation/widgets/custom_image_loader.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class ApodPage extends StatefulWidget {
  const ApodPage({Key? key}) : super(key: key);

  @override
  State<ApodPage> createState() => _ApodPageState();
}

class _ApodPageState extends State<ApodPage> {
  DateTime date = DateTime.now();

  void _showDatePicker() {
    showDatePicker(
      builder: (context, child) => Theme(
        data: ThemeData.dark(),
        child: child!,
      ),
      fieldHintText: 'MM-DD-YYYY',
      context: context,
      initialDate: date,
      firstDate: DateTime.parse('1995-06-16'),
      lastDate: DateTime.now(),
    ).then((value) {
      if (value != null) {
        context.read<ApodBloc>().add(LoadApodEvent(date: value));
      }
    });
  }

  void _swiping(DismissDirection direction) {
    if (direction == DismissDirection.startToEnd) {
      context.read<ApodBloc>().add(
            LoadApodEvent(
              date: DateTime(date.year, date.month, date.day - 1),
            ),
          );
    } else if (direction == DismissDirection.endToStart) {
      context.read<ApodBloc>().add(
            LoadApodEvent(
              date: DateTime(date.year, date.month, date.day + 1),
            ),
          );
    }
  }

  @override
  void initState() {
    context.read<ApodBloc>().add(LoadApodEvent(date: date));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ApodBloc, ApodState>(
      listener: (ctx, state) =>
          state.maybeMap(loading: (state) => date = state.date, orElse: () {}),
      builder: (ctx, state) => Scaffold(
        appBar: AppBar(
            title: Text(DateFormat('dd MMM yyyy').format(date)),
            actions: [
              IconButton(
                  icon: const Icon(Icons.change_circle_outlined),
                  onPressed: () => context
                      .read<ApodBloc>()
                      .add(const LoadRandomApodEvent())),
              IconButton(
                  onPressed: () => _showDatePicker(),
                  icon: const Icon(Icons.calendar_today_outlined)),
            ]),
        body: Dismissible(
          key: ValueKey(DateTime.now()),
          direction: (date.day == DateTime.now().day)
              ? DismissDirection.startToEnd
              : DismissDirection.horizontal,
          onDismissed: (direction) => _swiping(direction),
          child: state.map(
            initial: (state) =>
                const Center(child: Text('Init state has occurred')),
            loading: (state) =>
                const Center(child: CircularProgressIndicator.adaptive()),
            loaded: (state) => SlidingUpPanel(
              color: Colors.black,
              collapsed: Container(
                color: Colors.black,
                child: Center(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.arrow_upward_outlined, color: Colors.white),
                        SizedBox(width: 16.0),
                        Text('Explanation')
                      ]),
                ),
              ),
              panel: SingleChildScrollView(
                child: Column(children: [
                  Text(state.apod.explanation),
                  const SizedBox(height: 50.0),
                ]),
              ),
              body: Stack(children: [
                GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (ctx) =>
                              FullScreenImage(imageUrl: state.apod.imageUrl))),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 56, horizontal: 28),
                    child: Hero(
                        transitionOnUserGestures: true,
                        tag: 'apod',
                        child:
                            CustomImageLoader(imageUrl: state.apod.imageUrl)),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  color: Colors.black45,
                  width: double.infinity,
                  child: Text(state.apod.title,
                      style: Theme.of(context).textTheme.headline5,
                      textAlign: TextAlign.end),
                ),
              ]),
            ),
            failure: (state) => Center(child: Text(state.errorMessage)),
          ),
        ),
      ),
    );
  }
}
