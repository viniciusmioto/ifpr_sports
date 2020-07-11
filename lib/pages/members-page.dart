import 'package:flutter/material.dart';
import 'package:ifsports/classes/member.dart';
import 'package:ifsports/components/members-list.dart';
import 'package:ifsports/services/database.dart';
import 'package:provider/provider.dart';

class MembersPage extends StatefulWidget {
  @override
  _MembersPageState createState() => _MembersPageState();
}

class _MembersPageState extends State<MembersPage> {
  bool _search = false;
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Member>>.value(
      value: DatabaseService().members,
      child: Scaffold(
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
                  onChanged: (value) {},
                )
              : Text('Membros'),
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
        body: MembersList(),
      ),
    );
  }
}
