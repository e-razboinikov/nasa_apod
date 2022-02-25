import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nasa_apod/application/features/apod_screen/data/repositories/apod_repo_impl.dart';
import 'package:nasa_apod/application/features/apod_screen/presentation/bloc/apod_bloc.dart';
import 'package:nasa_apod/application/features/splash/presentation/pages/splash_screen_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ApodBloc>(
      create: (ctx) => ApodBloc(repository: ApodRepoImpl()),
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
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ),
        home: const SplashScreenPage(),
      ),
    );
  }
}
