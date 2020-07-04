import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ifsports/classes/post.dart';
import 'package:ifsports/components/custom-list-tile.dart';
import 'package:ifsports/components/post-form.dart';
import 'package:ifsports/components/post-list.dart';
import 'package:ifsports/pages/members-page.dart';
import 'package:ifsports/pages/profile-page.dart';
import 'package:ifsports/pages/settings-page.dart';
import 'package:ifsports/services/auth.dart';
import 'package:ifsports/services/database.dart';
import 'package:provider/provider.dart';

class NewsPage extends StatefulWidget {
  NewsPage({Key key}) : super(key: key);

  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage>
    with AutomaticKeepAliveClientMixin {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    super.build(context);
    void _showPostPanel() {
      showDialog(
        context: context,
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(20, 40, 20, 100),
            child: Scaffold(
              body: Padding(
                padding: const EdgeInsets.all(20.0),
                child: PostForm(),
              ),
            ),
          );
        },
      );
    }

    return StreamProvider<List<Post>>.value(
      value: DatabaseService().posts,
      child: Scaffold(
        backgroundColor: Colors.grey.shade300,
        appBar: AppBar(
          title: Text(
            'SPORTIF',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {},
            ),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: <Color>[Colors.green, Colors.greenAccent],
                  ),
                ),
                child: Container(
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 100,
                        width: 100,
                        child: Image.asset("assets/logo.png"),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Text(
                          'SPORTIF',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              CustomListTile(
                Icons.person,
                'Perfil',
                () => {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => ProfilePage(),
                    ),
                  ),
                },
              ),
              CustomListTile(Icons.people, 'Membros', () async {
                await Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => MembersPage(),
                  ),
                );
              }),
              CustomListTile(
                Icons.notifications,
                'Notificaçoes',
                () => {},
              ),
              CustomListTile(
                Icons.settings,
                'Configurações',
                () => {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => SettingsPage(),
                    ),
                  ),
                },
              ),
              CustomListTile(Icons.exit_to_app, 'Logout', () async {
                await _auth.signOut();
              }),
            ],
          ),
        ),
        body: PostList(),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            _showPostPanel();
          },
          backgroundColor: Theme.of(context).accentColor,
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
