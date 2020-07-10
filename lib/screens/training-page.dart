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
        centerTitle: true,
        title: Text("Treinos"),
        leading: Icon(
          Icons.access_time,
        ),
      ),
      body: ListView(
        children: <Widget>[
          SportsDescriptions(
            'ATLETISMO',
            'assets/atletismo.png',
            'Terça, Quinta e Sábado;',
            '7h30 - 9h30;',
            'Campo de Futebol.',
            Colors.indigoAccent,
          ),
          SportsDescriptions(
            'BASQUETE',
            'assets/basket.png',
            'Segunda e Quarta;',
            '7h30 - 9h30;',
            'Ginásio.',
            Colors.deepOrange[600],
          ),
          SportsDescriptions(
            'FUTEBOL',
            'assets/futebol.png',
            'Sábados;',
            '7h30 - 9h30;',
            'Campo de Futebol.',
            Colors.green,
          ),
          SportsDescriptions(
            'FUTSAL',
            'assets/futsal.png',
            'Segunda, Quarta e Sexta;',
            '13h30 - 15h30;',
            'Ginásio.',
            Colors.blue[400],
          ),
          SportsDescriptions(
            'HANDEBOL',
            'assets/handball.png',
            'Terça e Sexta;',
            '9h30 - 11h45;',
            'Ginásio.',
            Colors.green[700],
          ),
          SportsDescriptions(
            'TÊNIS',
            'assets/tenis.png',
            'Terça, Quinta e Sábado;',
            '14h30 - 16h30;',
            'Quadra de Tênis.',
            Colors.amber[800],
          ),
          SportsDescriptions(
            'TÊNIS DE MESA',
            'assets/pingpong.png',
            'Terça e Quinta;',
            '10h20 - 11h30;',
            'Mesas do Pátio.',
            Colors.blueAccent,
          ),
          SportsDescriptions(
            'VÔLEI',
            'assets/volley.png',
            'Terça, Quinta e Sábado;',
            '15h30 - 17h40;',
            'Ginásio.',
            Colors.deepPurple,
          ),
          SportsDescriptions(
            'XADREZ',
            'assets/xadrez.png',
            'Segunda à Sexta;',
            '7h30 - 9h30;',
            'Mesas do Pátio.',
            Colors.orange,
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class SportsDescriptions extends StatelessWidget {
  final String modalidade;
  final String icone;
  final String dias;
  final String horario;
  final String local;
  final Color color;

  SportsDescriptions(this.modalidade, this.icone, this.dias, this.horario,
      this.local, this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        color: color,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                height: 80,
                width: 80,
                child: Image.asset(
                  icone,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                child: Text(
                  modalidade,
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
              '\nDIAS: ' + dias + '\nHORÁRIO: ' + horario + '\nLOCAL: ' + local,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
