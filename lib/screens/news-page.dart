import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
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

  void getTime() async {
    Response response =
        await get('http://worldtimeapi.org/api/timezone/America/Sao_Paulo');
    Map data = jsonDecode(response.body);
    String datetime = data['datetime'];
    String utcOffset = data['utc_offset'].substring(1, 3);
    DateTime now = DateTime.parse(datetime);
    print(utcOffset);
    now = now.add(Duration(hours: int.parse(utcOffset) * -1));
    String date = now.toString().substring(0, 16);
    print(date);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    void _showPostPanel() {
      showDialog(
        context: context,
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(20, 40, 20, 200),
            child: Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: Text('Nova Postagem'),
                actions: [
                  IconButton(
                    icon: Icon(Icons.public),
                    onPressed: () {},
                  )
                ],
              ),
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
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'SPORTIF',
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
                      applicationName: 'SportIF',
                      children: [
                        Text(
                          'Resposáveis:',
                        ),
                        ListTile(
                          title: Text('Josimara Moreira'),
                          subtitle: Text('IFPR'),
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(
                              'https://scontent.fbfh8-1.fna.fbcdn.net/v/t1.0-1/p160x160/87069033_2919716804754337_8236447801307824128_o.jpg?_nc_cat=108&_nc_sid=dbb9e7&_nc_ohc=gaoEOdyk4VkAX9Vfunl&_nc_ht=scontent.fbfh8-1.fna&_nc_tp=6&oh=ff8fe3815d3ddff5d0ea36e7c54fef38&oe=5F24BC5B',
                            ),
                          ),
                        ),
                        ListTile(
                          title: Text('Vantuir Mioto'),
                          subtitle: Text('IFPR'),
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(
                              'https://lh3.googleusercontent.com/a-/AOh14Gje3OAWJVNS22i4mpIsh0Xc2bfNsOFmQoqcAcODlg=s80-p-k-rw-no',
                            ),
                          ),
                        ),
                        ListTile(
                          title: Text('Vinícius Mioto'),
                          subtitle: Text('UFPR'),
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(
                              'https://media-exp1.licdn.com/dms/image/C4E03AQFdc-V_PxeFow/profile-displayphoto-shrink_200_200/0?e=1599091200&v=beta&t=ckcWMu0GRkJtgiCtUY4e2A45zKi5wvpNst0MphWKULU',
                            ),
                          ),
                        ),
                      ],
                      applicationVersion: '1.5.8'),
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
            getTime();
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
