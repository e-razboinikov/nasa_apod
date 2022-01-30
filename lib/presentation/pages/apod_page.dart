import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './loaded_apod_scaffold.dart';
import '../../bloc/apod_bloc.dart';

class ApodPage extends StatefulWidget {
  const ApodPage({Key? key}) : super(key: key);

  @override
  State<ApodPage> createState() => _ApodPageState();
}

class _ApodPageState extends State<ApodPage> {
  @override
  void initState() {
    context.read<ApodBloc>().add(LoadApodEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ApodBloc, ApodState>(
      builder: (ctx, state) {
        if (state is InititalApodState) {
          return const Scaffold();
        }
        if (state is LoadingApodState) {
          return Scaffold(
            appBar: AppBar(),
            body: const Center(child: CircularProgressIndicator.adaptive()),
          );
        }
        if (state is LoadedApodState) {
          return LoadedApodScaffold(apodData: state.apod);
        }
        if (state is FailureApodState) {
          return Scaffold(
            appBar: AppBar(),
            body: Center(child: Text(state.errorMessage)),
          );
        }
        return const Scaffold();
      },
    );
  }
}
