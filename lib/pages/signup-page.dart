import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ifsports/components/loading.dart';
import 'package:ifsports/services/auth.dart';
import 'package:ifsports/services/wrapper.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  bool loading = false;
  String email = '';
  String password = '';
  String nome = '';
  String modalidade = 'Atletismo';
  String avatarUrl = '';
  String error = '';

  final List<String> modalidades = [
    'Treinador',
    'Atletismo',
    'Basquete',
    'Futebol',
    'Futsal',
    'Handebol',
    'Tênis',
    'Tênis de Mesa',
    'Vôlei',
    'Xadrez',
  ];

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.teal,
              title: Text("Cadastro de Usuário"),
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                color: Colors.white70,
                onPressed: () => Navigator.pop(context, false),
              ),
            ),
            body: ListView(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(
                    left: 40,
                    right: 40,
                    top: 20,
                    bottom: 30,
                  ),
                  color: Colors.white,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: 80,
                          height: 80,
                          alignment: Alignment(0.0, 1.15),
                          decoration: new BoxDecoration(
                            image: new DecorationImage(
                              image: AssetImage("assets/profile.png"),
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          autofocus: true,
                          onChanged: (value) {
                            setState(() => nome = value);
                          },
                          validator: (value) =>
                              value.isEmpty ? 'Insira um nome' : null,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            labelText: "NOME",
                            labelStyle: TextStyle(
                              color: Colors.black45,
                              fontWeight: FontWeight.w400,
                              fontSize: 20,
                            ),
                          ),
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          validator: (value) =>
                              value.isEmpty ? 'Insira um email' : null,
                          autofocus: false,
                          onChanged: (value) {
                            setState(() => email = value);
                          },
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            labelText: "EMAIL",
                            labelStyle: TextStyle(
                              color: Colors.black45,
                              fontWeight: FontWeight.w400,
                              fontSize: 20,
                            ),
                          ),
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          autofocus: false,
                          obscureText: true,
                          validator: (value) => value.length < 6
                              ? 'Deve ter mais que 6 dígitos'
                              : null,
                          onChanged: (value) {
                            setState(() => password = value);
                          },
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            labelText: "SENHA",
                            labelStyle: TextStyle(
                              color: Colors.black45,
                              fontWeight: FontWeight.w400,
                              fontSize: 20,
                            ),
                          ),
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(height: 10),
                        DropdownButtonFormField(
                          decoration: InputDecoration(
                            labelText: "MODALIDADE",
                            labelStyle: TextStyle(
                              color: Colors.black45,
                              fontWeight: FontWeight.w400,
                              fontSize: 18,
                            ),
                          ),
                          value: modalidade ?? 'Futebol',
                          items: modalidades.map((modalidade) {
                            return DropdownMenuItem(
                              value: modalidade,
                              child: Text('$modalidade'),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() => modalidade = value);
                          },
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          autofocus: false,
                          onChanged: (value) {
                            setState(() => avatarUrl = value);
                          },
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            labelText: "URL DO AVATAR",
                            labelStyle: TextStyle(
                              color: Colors.black45,
                              fontWeight: FontWeight.w400,
                              fontSize: 20,
                            ),
                          ),
                          style: TextStyle(
                            fontSize: 20,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text("CADASTRAR"),
                                  Icon(Icons.add_circle),
                                ],
                              ),
                              onPressed: () async {
                                if (_formKey.currentState.validate()) {
                                  setState(() => loading = true);
                                  dynamic result =
                                      await _auth.registerEmailAndPassword(
                                    email,
                                    password,
                                    nome,
                                    modalidade,
                                    avatarUrl ??
                                        'https://cdn.icon-icons.com/icons2/1378/PNG/512/avatardefault_92824.png',
                                  );
                                  if (result == null) {
                                    setState(() {
                                      error = 'Erro ao validar campos!';
                                      loading = false;
                                    });
                                  } else {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Wrapper(),
                                      ),
                                    );
                                  }
                                }
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          error,
                          style: TextStyle(
                            color: CupertinoColors.systemRed,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}
