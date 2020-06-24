import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ifsports/pages/home-page.dart';
import 'package:ifsports/pages/reset-password.dart';
import 'package:ifsports/pages/signup-page.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
          top: 50,
          left: 40,
          right: 40,
        ),
        color: Colors.teal,
        child: ListView(
          children: <Widget>[
            SizedBox(
              width: 120,
              height: 120,
              child: Image.asset("assets/logo.png"),
            ),
            SizedBox(
              height: 30,
              ),
              TextFormField(
                autofocus: false,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
                ),
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: "EMAIL",
                  labelStyle: TextStyle(
                    color: Colors.white70,
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  )
                ),
              ),
              SizedBox(
                height: 12,
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                obscureText: true,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
                ),
                decoration: InputDecoration(
                  labelText: "SENHA",
                  labelStyle: TextStyle(
                    color: Colors.white70,
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  )
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 30,
                alignment: Alignment.centerRight,
                child: FlatButton(
                  child: Text("Recuperar Senha",
                  style: TextStyle(
                    color: Colors.white70,
                  ),),
                  onPressed: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => ResetPasswordPage(),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                height: 40,
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.bottomRight,
                    stops: [0.3, 1],
                    colors: [
                      Colors.greenAccent,
                      Colors.green,
                      ],
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(7),
                  ),
                ),
                child: SizedBox.expand(
                  child: FlatButton(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("LOGIN"),
                        Icon(Icons.account_circle),
                      ],
                    ),
                    onPressed: () {
                      Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ),
                    );
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
             Container(
                height: 40,
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.bottomRight,
                    stops: [0.3, 1],
                    colors: [
                      Colors.green,
                      Colors.greenAccent,
                      ],
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(7),
                  ),
                ),
                child: SizedBox.expand(
                  child: FlatButton(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Icon(Icons.person_add),
                        Text("CADASTRAR-SE"),
                      ],
                    ),
                    onPressed: () {
                      Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => SignUpPage(),
                      ),
                    );
                    },
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
