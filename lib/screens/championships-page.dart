import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ifsports/components/campeonato-info.dart';

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
          CampeonatoInfo(
            'JIFNACIONAL',
            '24/11/2020',
            'Cuiabá - MT',
            "assets/jifnacio.png",
            Colors.deepPurple,
          ),
          CampeonatoInfo(
            'JIFSUL',
            '20/10/2020',
            'Florianópolis - SC',
            "assets/jifsul.png",
            Colors.blue[900],
          ),
          CampeonatoInfo(
            'JIFPR',
            '28/09/2020',
            'Palmas - PR',
            "assets/jifpr.png",
            Colors.green[600],
          ),
          CampeonatoInfo(
            'ESTATUDAIS',
            '10/07/2020',
            'Curitiba - PR',
            "assets/estaduais.png",
            Colors.amber[900],
          ),
          CampeonatoInfo(
            'MUNICIPAIS',
            '08/05/2020',
            'Colombo - PR',
            "assets/municipais.png",
            Colors.purple[800],
          ),
          CampeonatoInfo(
            'INTERCLASSE',
            '25/10/2020',
            'Colombo - PR',
            "assets/interclasse.png",
            Colors.deepOrange[600],
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}