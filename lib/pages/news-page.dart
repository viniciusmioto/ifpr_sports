import 'package:flutter/material.dart';

class NewsPage extends StatefulWidget {
  NewsPage({Key key}) : super(key: key);

  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        title: Text('SPORTIF'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Icon(Icons.search),
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
                      padding: const EdgeInsets.only(top:4.0),
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
            CustomListTile(Icons.person, 'Perfil', () => {}),
            CustomListTile(Icons.settings, 'Configurações', () => {}),
            CustomListTile(Icons.notifications, 'Notificaçoes', () => {}),
            CustomListTile(Icons.exit_to_app, 'Logout', () => {}),
          ],
        ),
      ),
      body: Container(
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            cardItem(),
            cardItem(),
            cardItem(),
            cardItem(),
            cardItem(),
            cardItem(),
            cardItem(),
            cardItem(),
            cardItem(),
            cardItem(),
            cardItem(),
            cardItem(),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

Widget cardItem() {
  return Card(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        const ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(
                "https://images.pexels.com/photos/1543924/pexels-photo-1543924.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260"),
          ),
          title: Text('Prof. João Silva'),
          subtitle: Text("09/05/2019 18:37"),
          trailing: Icon(Icons.more_vert),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Text(
              'Atenção ATLETAS!\n' +
                  'Reforçando o aviso dos horários de treinos dessa semana!\n' +
                  'Os treinos de sexta serão realizados 10 minutos mais cedo, ou seja, o novo horário é 13:20',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        ),
        ButtonTheme(
          child: ButtonBar(
            children: <Widget>[
              FlatButton(
                child: Icon(Icons.star),
                onPressed: () {},
              ),
              FlatButton(
                child: Icon(Icons.flag),
                onPressed: () {},
              )
            ],
          ),
        ),
      ],
    ),
  );
}

class CustomListTile extends StatelessWidget {
  IconData icon;
  String text;
  Function onTap;

  CustomListTile(this.icon, this.text, this.onTap);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: InkWell(
        splashColor: Colors.green,
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.grey.shade300,
              ),
            ),
          ),
          height: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: <Widget>[
                  Icon(icon),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      text,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
              Icon(Icons.arrow_right),
            ],
          ),
        ),
      ),
    );
  }
}
