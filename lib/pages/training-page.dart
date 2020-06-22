import 'package:flutter/material.dart';

class TrainingPage extends StatefulWidget {
  @override
  _TrainingPageState createState() => _TrainingPageState();
}

class _TrainingPageState extends State<TrainingPage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("TREINOS"),
        leading: Icon(
          Icons.access_time,
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
