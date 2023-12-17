import 'package:flutter/material.dart';
import 'package:provide_database_example/provider/database_provider.dart';
import 'package:provider/provider.dart';

import 'screens/splash_screens.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => UserDataProvider(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Provider Todo List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreens(),
    );
  }
}
