import 'package:ifsports/pages/login-page.dart';
import 'package:flutter/material.dart';
import 'package:ifsports/provider/users.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => UsersProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'IF Sports',
        theme: ThemeData(
          primarySwatch: Colors.teal,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: LoginPage(),
      ),
    );
  }
}
