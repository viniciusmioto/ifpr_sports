import 'package:flutter/material.dart';
import 'package:ifsports/classes/user.dart';
import 'package:ifsports/pages/login-page.dart';
import 'package:ifsports/screens/home-page.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    
    //return either Home or Login widget
    if (user == null) {
      return LoginPage();
    } else {
      return HomePage();
    }
  }
}
