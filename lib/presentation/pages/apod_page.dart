import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import './loaded_apod_scaffold.dart';
import '../../bloc/apod_bloc.dart';

class ApodPage extends StatefulWidget {
  const ApodPage({Key? key}) : super(key: key);

  @override
  State<ApodPage> createState() => _ApodPageState();
}

class _ApodPageState extends State<ApodPage> {
  late ApodBloc bloc;
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
      initialDate: bloc.date,
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
                date: DateTime(
              bloc.date.year,
              bloc.date.month,
              bloc.date.day - 1,
            )),
          );
    } else if (direction == DismissDirection.endToStart) {
      context.read<ApodBloc>().add(
            LoadApodEvent(
                date: DateTime(
              bloc.date.year,
              bloc.date.month,
              bloc.date.day + 1,
            )),
          );
    }
  }

  @override
  void initState() {
    bloc = context.read<ApodBloc>();
    context.read<ApodBloc>().add(LoadApodEvent(date: bloc.date));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(DateFormat('EEE, MMMM dd, yyyy').format(bloc.date)),
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
          direction: (bloc.date.day == DateTime.now().day)
              ? DismissDirection.startToEnd
              : DismissDirection.horizontal,
          onDismissed: (direction) => _swiping(direction),
          child: BlocConsumer<ApodBloc, ApodState>(
            listener: (ctx, state) {},
            builder: (ctx, state) {
              if (state is InititalApodState) {
                return const Center();
              }
              if (state is LoadingApodState) {
                return const Center(
                    child: CircularProgressIndicator.adaptive());
              }
              if (state is LoadedApodState) {
                return LoadedApodScaffold(
                    apodData: state.apod, date: bloc.date);
              }
              if (state is FailureApodState) {
                return Center(child: Text(state.errorMessage));
              }
              return const Scaffold();
            },
          )),
    );
  }
}
