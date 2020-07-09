import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ifsports/classes/user.dart';
import 'package:ifsports/components/loading.dart';
import 'package:ifsports/services/database.dart';
import 'package:ifsports/services/world-time.dart';
import 'package:provider/provider.dart';

class PostForm extends StatefulWidget {
  @override
  _PostFormState createState() => _PostFormState();
}

class _PostFormState extends State<PostForm> {
  final _formKey = GlobalKey<FormState>();
  WorldTime worldTime = WorldTime();
  bool loading = false;
  String text;
  String error = '';

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    worldTime.getTime();
    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.uid).membersData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserData userData = snapshot.data;
            return Scaffold(
              appBar: AppBar(
                title: Text('Nova Postagem'),
                centerTitle: true,
                actions: [
                  IconButton(
                    icon: Icon(Icons.publish),
                    onPressed: () {},
                  )
                ],
              ),
              body: ListView(
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 10),
                        Container(
                          height: 120,
                          child: TextFormField(
                            expands: true,
                            minLines: null,
                            maxLines: null,
                            autofocus: true,
                            onChanged: (value) {
                              setState(() => text = value);
                            },
                            validator: (value) =>
                                value.isEmpty ? 'Insira um texto' : null,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              labelText: "Mensagem",
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
                        ),
                        SizedBox(height: 60),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    "PUBLICAR",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Icon(
                                    Icons.check_circle,
                                    color: Colors.black,
                                  ),
                                ],
                              ),
                              onPressed: () async {
                                if (_formKey.currentState.validate()) {
                                  setState(() => loading = true);
                                  dynamic result =
                                      await DatabaseService(uid: user.uid)
                                          .createPost(
                                    text,
                                    userData.avatarUrl ??
                                        'https://cdn.icon-icons.com/icons2/1378/PNG/512/avatardefault_92824.png',
                                    userData.nome,
                                    user.uid,
                                    worldTime.postDateTime,
                                  );
                                  if (result == null) {
                                    setState(
                                        () => error = 'Erro ao publicar...');
                                  }
                                  Navigator.pop(context);
                                }
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(error),
                ],
              ),
            );
          } else {
            return Loading();
          }
        });
  }
}
