import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import './providers/apod_provider.dart';
import './screens/apod_screen.dart';
import './screens/full_screen_image_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ApodProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'NASA APOD',
        theme: ThemeData(
          canvasColor: Colors.black,
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: const Color.fromRGBO(11, 65, 141, 1),
          ),
          textTheme: TextTheme(
            headline6: GoogleFonts.spaceGrotesk(
              fontSize: 24,
              color: Colors.white,
            ),
            headline5: GoogleFonts.spaceGrotesk(
              fontSize: 20,
              color: Colors.white,
            ),
            bodyText2: GoogleFonts.spaceGrotesk(
              wordSpacing: 10.0,
              fontWeight: FontWeight.w200,
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ),
        home: const ApodScreen(),
        routes: {
          FullScreenImage.routeName: (_) => const FullScreenImage(),
        },
      ),
    );
  }
}
