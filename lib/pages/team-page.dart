import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ifsports/classes/atleta.dart';
import 'package:ifsports/components/atleta-tile.dart';
import 'package:ifsports/pages/members-page.dart';
import 'package:ifsports/provider/atleta-provider.dart';
import 'package:provider/provider.dart';

class TeamPage extends StatefulWidget {
  @override
  _TeamPageState createState() => _TeamPageState();
}

class _TeamPageState extends State<TeamPage> {
  bool _search = false;
  String filter = '';
  int count = 0;
  List<Atleta> athFilter = [];

  Atleta byIndex(int index) {
    return athFilter.elementAt(index);
  }

  final _debouncer = Debouncer(milliseconds: 600);
  @override
  Widget build(BuildContext context) {
    final AtletasProvider users = Provider.of(context);
    List<Atleta> allAtletas = users.atletas;
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: _search
            ? TextFormField(
                autofocus: true,
                decoration: InputDecoration(
                  labelText: 'Buscar',
                  labelStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                  ),
                ),
                onChanged: (value) {
                  _debouncer.run(() {
                    setState(() {
                      filter = value;
                      athFilter = allAtletas
                          .where((e) => (e.name
                              .toLowerCase()
                              .contains(value.toLowerCase())))
                          .toList();
                    });
                  });
                },
              )
            : Text('Time'),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              setState(() {});
            },
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              setState(() {
                _search = !_search;
              });
            },
          ),
        ],
      ),
      body: _search
          ? ListView.builder(
              itemCount: athFilter.length,
              itemBuilder: (ctx, index) =>
                  AtletaTile(athFilter.elementAt(index)))
          : ListView.builder(
              itemCount: users.count,
              itemBuilder: (ctx, index) => AtletaTile(users.byIndex(index))),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) => MembersPage(),
            ),
          );
        },
        child: Icon(Icons.person_add),
      ),
    );
  }
}

class Debouncer {
  final int milliseconds;
  VoidCallback action;
  Timer _timer;

  Debouncer({this.milliseconds});

  run(VoidCallback action) {
    if (_timer != null) {
      _timer.cancel();
    }
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}
