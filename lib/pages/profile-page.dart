import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ifsports/classes/user.dart';
import 'package:ifsports/components/edit-profile.dart';
import 'package:ifsports/services/database.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Perfil"),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => EditProfileForm(),
                ),
              );
            },
          ),
        ],
      ),
      body: StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.uid).membersData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserData userData = snapshot.data;
            return ListView(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: 200,
                    child: CircleAvatar(
                      radius: 50.0,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.network("${snapshot.data.avatarUrl}"),
                      ),
                      backgroundColor: Colors.transparent,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Card(
                  child: ListTile(
                    title: Text(userData.nome),
                    leading: Icon(Icons.person),
                  ),
                ),
                Card(
                  child: ListTile(
                    title: Text(userData.email),
                    leading: Icon(Icons.email),
                  ),
                ),
                Card(
                  child: ListTile(
                    title: Text(userData.modalidade),
                    leading: Icon(Icons.fitness_center),
                  ),
                ),
              ],
            );
          } else {
            return Container(
              child: Text('usuário anônimo'),
            );
          }
        },
      ),
    );
  }
}
