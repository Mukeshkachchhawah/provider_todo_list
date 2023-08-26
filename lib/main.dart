import 'package:flutter/material.dart';
import 'package:provide_database_example/provider/database_provider.dart';
import 'package:provide_database_example/screens/homepage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp( ChangeNotifierProvider(create: (context) => DataBase_Provider(),child: MyApp(),));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
      
        primarySwatch: Colors.blue,
      ),
      home: HomaPage(),
    );
  }
}

