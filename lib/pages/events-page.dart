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
      body: ListView.builder(
          itemCount: 20,
          itemBuilder: (context, index) {
            return Card(
              color: index % 2 == 0 ? Colors.blue : null,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 60,
                      child: Image.asset("assets/eventos.png"),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'EVENTO',
                      style: TextStyle(
                          color: index % 2 == 0 ? Colors.white : Colors.blue,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Os treinos de sexta começaram 10 min mais cedo, ou seja, às 13h20. ' +
                          'Além disso, sábado será realizado um amistoso, ao invés do treino convencional.' +
                          'Todos estão convidados a comparecer',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.justify,
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
