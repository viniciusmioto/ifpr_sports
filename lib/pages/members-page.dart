import 'package:flutter/material.dart';
import 'package:ifsports/classes/member.dart';
import 'package:ifsports/components/members-list.dart';
import 'package:ifsports/services/database.dart';
import 'package:provider/provider.dart';

class MembersPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Member>>.value(
      value: DatabaseService().members,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Membros'),
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            ),
          ],
        ),
        body: MembersList(),
      ),
    );
  }
}
