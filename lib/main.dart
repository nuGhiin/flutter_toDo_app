import 'package:flutter/material.dart';
import 'package:todo_app_8/home.dart';


void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({Key? key}) : super(key:key);
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ToDo',
      home: const HomeScreen(),
      themeMode: ThemeMode.light ,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
            backgroundColor: Colors.pink,
            elevation: 4.0
        ),
        brightness: Brightness.light,
        primarySwatch: Colors.pink,

      ),
      darkTheme: ThemeData(
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.pink,
            elevation: 4.0,
          ),
          brightness: Brightness.dark,
          primarySwatch: Colors.red,
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: Colors.purple,
          )
      ),
    );
  }
}


