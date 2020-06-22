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
      body: ListView(
        children: <Widget>[
          PostMessages(
            "https://images.pexels.com/photos/1543924/pexels-photo-1543924.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260",
            'Prof. Tite',
            '20/06/2020- 12:37',
            'Atenção ATLETAS!\n' +
                'Reforçando o aviso dos horários de treinos dessa semana!\n' +
                'Os treinos de sexta serão realizados 10 minutos mais cedo, ou seja, o novo horário é 13:20',
          ),
          PostMessages(
            "https://images.pexels.com/photos/1543924/pexels-photo-1543924.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260",
            'Marta',
            '21/04/2020- 14:30',
            'Pessoal, vamos começar o aquecimento para o jogo-treino às 8:20, na quadra! Lembrem de trazer algum documento com foto.',
          ),
          PostMessages(
            "https://images.pexels.com/photos/1543924/pexels-photo-1543924.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260",
            'Neymar',
            '20/04/2020- 19:30',
            'O amistoso foi confirmado para quarta-feira da semana que vem, dia 16/08, confirmem a presença de vocês para montarmos o time',
          ),
          PostMessages(
            "https://images.pexels.com/photos/1543924/pexels-photo-1543924.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260",
            'Prof. Tite',
            '19/06/2020- 09:47',
            'Treino Extra!\n' +
                'Considerando a proximidade dos Jogos, foi decidido que fazeremos um treino extra nessa semana.\n' +
                'Definimos que quinta-feira (dia 25/06) faremos um treino às 15h30... por favor venham!',
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
class PostMessages extends StatelessWidget {
  String urlImage;
  String user;
  String time;
  String message;

  PostMessages(this.urlImage, this.user, this.time, this.message);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(urlImage),
            ),
            title: Text(user),
            subtitle: Text(time),
            trailing: Icon(Icons.more_vert),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Text(
                message,
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
