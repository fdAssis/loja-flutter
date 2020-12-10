import 'package:flutter/material.dart';
import 'package:loja/models/user_model.dart';
import 'package:loja/screens/home_screen.dart';
import 'package:scoped_model/scoped_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final Color primaryColor = const Color(0xFF092532);

  @override
  Widget build(BuildContext contex) {
    return ScopedModel<UserModel>(
      model: UserModel(),
      child: MaterialApp(
        title: 'flutter',
        theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: primaryColor,
      ),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    ));
  }
}
