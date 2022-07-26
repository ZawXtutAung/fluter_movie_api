import 'package:flutter/material.dart';
import 'package:flutter_movies/screen/home.dart';
import 'package:flutter_movies/screen/splash.dart';

import 'service/route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: Routes.splash,
      routes: {
        Routes.splash: (context) => WellCome(),
        Routes.home: (_) => Home(),
      },
    );
  }
}
