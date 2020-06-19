import 'package:flutter/material.dart';

class ChampionshipsPage extends StatefulWidget {
  @override
  _ChampionshipsPageState createState() => _ChampionshipsPageState();
}

class _ChampionshipsPageState extends State<ChampionshipsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("COMPETIÇÕES"),
      ),
      body: ListView.builder(
          itemCount: 50,
          itemBuilder: (context, index) {
            return Card(
              color: index % 2 == 0 ? Colors.blue : null,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      'COMPETIÇÃO',
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
}