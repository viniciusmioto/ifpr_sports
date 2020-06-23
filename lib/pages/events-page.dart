import 'package:flutter/material.dart';

class EventsPage extends StatefulWidget {
  @override
  _EventsPageState createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("EVENTOS"),
        leading: Icon(
          Icons.event_note,
        ),
      ),
      body: ListView(
        children: <Widget>[
          EventsInfo(
            Colors.redAccent,
            "assets/calendario.png",
            "BOLSA ATLETA",
            "As incrições para o BOLSA ATLETA estão abertas e vão até o dia 19/04.\n" + 
            "Os documentos necessários estão descritos no edital, disponível na página do IFPR.",
          ),
          EventsInfo(
            Colors.blueAccent,
            "assets/eventos.png",
            "DIA DO ALUNO",
            "No dia do Aluno (11/08) serão realizados jogos e competições como o interclasse, organizados pelos estudantes.\n" + 
            "Terá almoço ao meio-dia e lanche às 15h30.",
          ),
          EventsInfo(
            Colors.deepOrange,
            "assets/seletiva.png",
            "CAMPEONATO DE FUTSAL",
            "No dia 15/06 será realizado um torneio de fustal às 18h00, entre Professores e Alunos, acontecerá no ginásio.\n" + 
            "Quem se interessar, favor avisar o professor de Educação Física.",
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class EventsInfo extends StatelessWidget {
  final Color cor;
  final String imagem;
  final String assunto;
  final String mensagem;

  EventsInfo(this.cor, this.imagem, this.assunto, this.mensagem);

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
                  assunto,
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
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                mensagem,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
                textAlign: TextAlign.center,
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
