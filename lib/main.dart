import 'package:ifsports/pages/login-page.dart';
import 'package:flutter/material.dart';
import 'package:ifsports/pages/user-form.dart';
import 'package:ifsports/provider/users-provider.dart';
import 'package:ifsports/routes/app-routes.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => UsersProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Sport IF',
        theme: ThemeData(
          primarySwatch: Colors.teal,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: LoginPage(),
        routes: {
          AppRoutes.USER_FORM: (_) => UserForm(),
        },
      ),
    );
  }
}
