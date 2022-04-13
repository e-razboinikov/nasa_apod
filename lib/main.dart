import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nasa_apod/features/apod_screen/data/data_sources/api/apod_api.dart';
import 'package:nasa_apod/features/apod_screen/data/data_sources/services/apod_service.dart';
import 'package:nasa_apod/features/apod_screen/data/repositories/apod_repo_impl.dart';
import 'package:nasa_apod/features/apod_screen/domain/use_cases/apod_use_cases.dart';
import 'package:nasa_apod/features/apod_screen/presentation/bloc/apod_bloc.dart';
import 'package:nasa_apod/features/splash/presentation/pages/splash_screen_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ApodBloc>(
      create: (ctx) => ApodBloc(
        apodUseCases: ApodUseCases(
          apodRepo: ApodRepoImpl(
            apodService: ApodService(
              apodApi: ApodApi(
                Dio(),
              ),
            ),
          ),
        ),
      ),
      child: MaterialApp(
        debugShowCheckedModeBanner: true,
        title: 'NASA APOD',
        theme: ThemeData(
          canvasColor: Colors.black,
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: const Color.fromRGBO(11, 65, 141, 1),
          ),
          textTheme: TextTheme(
            headline6:
                GoogleFonts.spaceGrotesk(fontSize: 24, color: Colors.white),
            headline5:
                GoogleFonts.spaceGrotesk(fontSize: 18, color: Colors.white),
            bodyText2: GoogleFonts.spaceGrotesk(
              wordSpacing: 10.0,
              fontWeight: FontWeight.w200,
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ),
        home: const SplashScreenPage(),
      ),
    );
  }
}
