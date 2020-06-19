import 'package:flutter/material.dart';

class EventsPage extends StatefulWidget {
  @override
  _EventsPageState createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("EVENTOS"),
      ),
      body: ListView.builder(
          itemCount: 50,
          itemBuilder: (context, index) {
            return Card(
              color: index % 2 == 0 ? Colors.deepPurpleAccent : null,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      'EVENTO',
                      style: TextStyle(
                          color: index % 2 == 0 ? Colors.white : Colors.deepPurple,
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
}