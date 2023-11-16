import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/my_home_page.dart';
import 'package:todo_app/provider/todo_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
@override
Widget build(BuildContext context) {
  return ChangeNotifierProvider(
    create: ((context) => TodoProvider()),
    child: MaterialApp(
     title: 'Simple ToDo App',
     debugShowCheckedModeBanner: false,
     theme: ThemeData(
      primarySwatch: Colors.deepPurple,
     ),
     home: const MyHomePage(),
    ),
   );
  }
 }

