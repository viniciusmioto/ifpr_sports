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
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    void _showPostPanel() {
      showDialog(
        context: context,
        builder: (context) {
          return PostForm();
        },
      );
    }

    return StreamProvider<List<Post>>.value(
      value: DatabaseService().posts,
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Sportif',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
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
              CustomListTile(
                Icons.info,
                'Sobre',
                () => {
                  showAboutDialog(
                      context: context,
                      applicationIcon: Container(
                        height: 40,
                        child: Image.asset('assets/logo.png'),
                      ),
                      applicationName: 'Sportif',
                      children: [
                        Text(
                          'Responsáveis:',
                        ),
                        ListTile(
                          title: Text('VS Mioto'),
                          subtitle: Text('Josimara, Vantuir e Vinícius'),
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(
                              'https://pbs.twimg.com/profile_images/1285741502849744901/Ok-kIwJV_400x400.jpg',
                            ),
                          ),
                        ),
                        ListTile(
                          title: Text('IFPR'),
                          subtitle: Text('Campus Colombo'),
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(
                              'https://media-exp1.licdn.com/dms/image/C4D0BAQF6OET0cbhmEA/company-logo_200_200/0?e=2159024400&v=beta&t=drxGIuRWVRH0crTRkg846OJ_iOhLLy_r_FZgHr5VGSo',
                            ),
                            backgroundColor: Colors.black,
                          ),
                        ),
                      ],
                      applicationVersion: '1.0.0 (beta)'),
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
