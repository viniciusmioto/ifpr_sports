import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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

  final _debouncer = Debouncer(milliseconds: 600);
  @override
  Widget build(BuildContext context) {
    final AtletasProvider users = Provider.of(context);
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
                      count = users.filterCount;
                    });
                  });
                },
              )
            : Text('Time'),
        actions: [
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
              itemCount: count < 1 ? users.count : count,
              itemBuilder: (ctx, index) =>
                  AtletaTile(users.byIndexFilter(index, filter)))
          : ListView.builder(
              itemCount: users.count,
              itemBuilder: (ctx, index) =>
                  AtletaTile(users.byIndexFilter(index, filter))),
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
