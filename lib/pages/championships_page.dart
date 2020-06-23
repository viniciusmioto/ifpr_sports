import 'package:flutter/material.dart';

class ChampionshipsPage extends StatefulWidget {
  @override
  _ChampionshipsPageState createState() => _ChampionshipsPageState();
}

class _ChampionshipsPageState extends State<ChampionshipsPage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("COMPETIÇÕES"),
        leading: Icon(
          Icons.flag,
        ),
      ),
      body: ListView(
        children: <Widget>[
          ChampionshipsInfo(
            'JIFNACIONAL',
            '24/11/2020',
            'Cuiabá - MT',
            "assets/jifnacio.png",
            Colors.deepPurple,
          ),
          ChampionshipsInfo(
            'JIFSUL',
            '24/11/2020',
            'Florianópolis - SC',
            "assets/jifsul.png",
            Colors.blue
          ),
          ChampionshipsInfo(
            'JIFPR',
            '24/11/2020',
            'Palmas - PR',
            "assets/jifpr.png",
            Colors.green,
          ),
          ChampionshipsInfo(
            'SELETIVA JIFSUL',
            '24/11/2020',
            'Porto Alegre - RS',
            "assets/seletiva.png",
            Colors.amber,
          ),
          ChampionshipsInfo(
            'ESTATUDAIS',
            '24/11/2020',
            'Curitiba - PR',
            "assets/estaduais.png",
            Colors.indigoAccent,
          ),
          ChampionshipsInfo(
            'MUNICIPAIS',
            '24/11/2020',
            'Colombo - PR',
            "assets/municipais.png",
            Colors.purple,
          ),
          ChampionshipsInfo(
            'INTERCLASSE',
            '24/11/2020',
            'Colombo - PR',
            "assets/interclasse.png",
            Colors.deepOrange,
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class ChampionshipsInfo extends StatelessWidget {
  final String competicao;
  final String data;
  final String local;
  final String imagem;
  final Color cor;

  ChampionshipsInfo(this.competicao, this.data, this.local, this.imagem, this.cor);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        color: cor,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                height: 80,
                width: 80,
                child: Image.asset(imagem),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                child: Text(
                  competicao,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Divider(
              height: 20,
              thickness: 5,
            ),
            Text(
              '\nDATA: ' + data + '\nLOCAL: ' + local,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
