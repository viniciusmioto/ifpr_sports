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
              backgroundColor: Theme.of(context).backgroundColor,
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
