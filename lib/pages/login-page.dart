import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ifsports/components/loading.dart';
import 'package:ifsports/pages/reset-password.dart';
import 'package:ifsports/pages/signup-page.dart';
import 'package:ifsports/services/auth.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  bool loading = false;
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      body: Form(
        key: _formKey,
        child: Container(
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
                child: FlatButton(
                  child: Image.asset("assets/logo.png"),
                  onPressed: () async {
                    dynamic result = await _auth.signInAnon();
                    if (result == null) {
                      print('ERROR sign in');
                    } else {
                      print(result.uid);
                    }
                  },
                ),
              ),
              SizedBox(height: 30),
              TextFormField(
                autofocus: false,
                validator: (value) => value.isEmpty ? 'Insira um email' : null,
                onChanged: (value) {
                  setState(() => email = value);
                },
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
                    )),
              ),
              SizedBox(height: 12),
              TextFormField(
                keyboardType: TextInputType.text,
                obscureText: true,
                validator: (value) =>
                    value.length < 6 ? 'Deve ter mais que 6 dígitos' : null,
                onChanged: (value) {
                  setState(() => password = value);
                },
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
                    )),
              ),
              SizedBox(height: 10),
              Container(
                height: 30,
                alignment: Alignment.centerRight,
                child: FlatButton(
                  child: Text(
                    "Recuperar Senha",
                    style: TextStyle(
                      color: Colors.white70,
                    ),
                  ),
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
              SizedBox(height: 40),
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
                        Text(
                          "LOGIN",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Icon(
                          Icons.account_circle,
                          color: Colors.black,
                        ),
                      ],
                    ),
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        setState(() => loading = true);
                        dynamic result =
                            await _auth.signInEmailAndPassword(email, password);
                        if (result == null) {
                          setState(() {
                            error = 'Email ou Senha incorretos!';
                            loading = false;
                          });
                        }
                      }
                    },
                  ),
                ),
              ),
              SizedBox(height: 20),
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
                        Icon(
                          Icons.person_add,
                          color: Colors.black,
                        ),
                        Text(
                          "CADASTRAR-SE",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
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
              SizedBox(height: 10),
              Text(
                error,
                style: TextStyle(
                  color: Colors.redAccent,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
