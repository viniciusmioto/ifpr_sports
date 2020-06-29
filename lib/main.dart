import 'package:flutter/material.dart';
import 'package:ifsports/classes/user.dart';
import 'package:ifsports/pages/atleta-form.dart';
import 'package:ifsports/pages/wrapper.dart';
import 'package:ifsports/provider/atleta-provider.dart';
import 'package:ifsports/routes/app-routes.dart';
import 'package:ifsports/provider/settings-provider.dart';
import 'package:ifsports/services/auth.dart';
import 'package:provider/provider.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<AtletasProvider>(
            create: (ctx) => AtletasProvider(),
          ),
          ChangeNotifierProvider<ThemeChanger>(
            create: (_) => ThemeChanger(),
          ),
        ],
        child: MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool darkThemeEnable = Provider.of<ThemeChanger>(context).isDark();
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Sport IF',
        theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.teal,
          backgroundColor: Colors.grey[300],
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.black,
          accentColor: Colors.blueGrey,
          scaffoldBackgroundColor: Colors.black,
          dialogBackgroundColor: Colors.blueGrey,
          backgroundColor: Colors.black,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        themeMode: darkThemeEnable ? ThemeMode.dark : ThemeMode.light,
        home: Wrapper(),
        routes: {
          AppRoutes.USER_FORM: (_) => AtletaForm(),
        },
      ),
    );
  }
}
