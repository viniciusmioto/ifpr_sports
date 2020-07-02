import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ifsports/pages/profile-page.dart';

class EditProfileForm extends StatefulWidget {
  @override
  _EditProfileForm createState() => _EditProfileForm();
}

class _EditProfileForm extends State<EditProfileForm> {
  final _fornKey = GlobalKey<FormState>();
  final List<String> modalidades = [
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
  String _currentName;
  String _currentEmail;
  String _currentAvatarUrl;
  String _currentModalidade;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EDITAR PERFIL'),
        actions: [
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              Navigator.pop(
                context,
                CupertinoPageRoute(
                  builder: (context) => ProfilePage(),
                ),
              );
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
        child: ListView(
          children: <Widget>[
            Form(
              key: _fornKey,
              child: Column(
                children: [
                  TextFormField(
                    autofocus: false,
                    onChanged: (value) {
                      setState(() => _currentName = value);
                    },
                    validator: (value) =>
                        value.isEmpty ? 'Insira um nome' : null,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: "NOME",
                      labelStyle: TextStyle(
                        color: Colors.black45,
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                      ),
                    ),
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    validator: (value) =>
                        value.isEmpty ? 'Insira um email' : null,
                    autofocus: false,
                    onChanged: (value) {
                      setState(() => _currentEmail = value);
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: "EMAIL",
                      labelStyle: TextStyle(
                        color: Colors.black45,
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                      ),
                    ),
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 10),
                  SizedBox(height: 10),
                  TextFormField(
                    autofocus: false,
                    onChanged: (value) {
                      setState(() => _currentAvatarUrl = value);
                    },
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: "AVATAR URL",
                      labelStyle: TextStyle(
                        color: Colors.black45,
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                      ),
                    ),
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 20),
                  DropdownButtonFormField(
                    decoration: InputDecoration(
                      labelText: "MODALIDADE",
                      labelStyle: TextStyle(
                        color: Colors.black45,
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                      ),
                    ),
                    value: _currentModalidade,
                    items: modalidades.map((modalidade) {
                      return DropdownMenuItem(
                        value: modalidade,
                        child: Text('$modalidade'),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() => _currentModalidade = value);
                    },
                  ),
                  SizedBox(height: 20),
                ],
              ),
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
                      Text(
                        "SALVAR",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Icon(
                        Icons.save,
                        color: Colors.black,
                      ),
                    ],
                  ),
                  onPressed: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
