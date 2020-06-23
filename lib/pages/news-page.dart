import 'package:flutter/material.dart';
import 'package:ifsports/pages/login-page.dart';

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
              () => {},
            ),
            CustomListTile(
              Icons.people,
              'Time',
              () => {},
            ),
            CustomListTile(
              Icons.notifications,
              'Notificaçoes',
              () => {},
            ),
            CustomListTile(
              Icons.settings,
              'Configurações',
              () => {},
            ),
            CustomListTile(Icons.exit_to_app, 'Logout', () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginPage(),
                ),
              );
            }),
          ],
        ),
      ),
      body: ListView(
        children: <Widget>[
          PostMessages(
            "https://images.pexels.com/photos/804009/pexels-photo-804009.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
            'Prof. Bernardinho',
            '21/06/2020 - 12:37',
            'Atenção ALUNOS!\n' +
                'Abriu o edital de inscrição para o BOLSA ATLETA, fiquem atentos aos prazos e confiram a página de eventos!',
          ),
          PostMessages(
            "https://images.pexels.com/photos/1543924/pexels-photo-1543924.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260",
            'Prof. Tite',
            '21/06/2020 - 17:37',
            'Boa Tarde ATLETAS de Futebol!\n' +
                'Reforçando o aviso dos horários de treinos dessa semana.\n' +
                'Os treinos de sexta serão realizados 10 minutos mais cedo, ou seja, o novo horário é 13:20.',
          ),
          PostMessages(
            "https://images.pexels.com/photos/3621092/pexels-photo-3621092.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
            'Marta',
            '19/05/2020 - 14:30',
            'Futsal \n' +
                'Pessoal, vamos começar o aquecimento para o jogo-treino às 8:20, na quadra! Lembrem de trazer algum documento com foto.',
          ),
          PostMessages(
            "https://images.pexels.com/photos/1432039/pexels-photo-1432039.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
            'Prof. Guga',
            '15/05/2020 - 07:58',
            'Treino de TÊNIS terça será no ginásio!\n' +
                'Considerando as previsões do clima para terca-feria, faremos o treino no ginásio que é fechado, conto com vocés lá!',
          ),
          PostMessages(
            "https://images.pexels.com/photos/804009/pexels-photo-804009.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
            'Prof. Bernardinho',
            '29/04/2020 - 09:47',
            'Treino de VÔLEI extra!!!\n' +
                'Considerando a proximidade dos Jogos, foi decidido que fazeremos um treino extra nessa semana.\n' +
                'Definimos que quinta-feira (dia 25/06) faremos um treino às 15h30... por favor venham!',
          ),
          PostMessages(
            "https://images.pexels.com/photos/220383/pexels-photo-220383.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
            'Stephen Curry',
            '20/04/2020 - 19:30',
            'Amistoso BASKETBALL\n' +
                'O amistoso foi confirmado para quarta-feira da semana que vem, dia 16/08, confirmem a presença de vocês para montarmos o time',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
        backgroundColor: Colors.teal,
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class PostMessages extends StatelessWidget {
  final String urlImage;
  final String user;
  final String time;
  final String message;

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
            buttonColor: Colors.greenAccent,
            child: ButtonBar(
              children: <Widget>[
                FlatButton(
                  child: Icon(
                    Icons.star,
                    color: Colors.greenAccent,
                  ),
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
  final IconData icon;
  final String text;
  final Function onTap;

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
