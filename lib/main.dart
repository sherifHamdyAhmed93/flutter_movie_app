import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_movie_app/firebase_options.dart';
import 'package:flutter_movie_app/home/home_screen.dart';
import 'package:flutter_movie_app/movie_details_screen/movie_details_screen.dart';
import 'package:flutter_movie_app/my_theme/my_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        MovieDetailsScreen.routeName:(context) => MovieDetailsScreen()
      },
      theme: MyThemeData.MainMode,
      title: 'Flutter Demo',
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale('en'),
    );
  }
}