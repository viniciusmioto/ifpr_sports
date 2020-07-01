import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ifsports/components/members-list.dart';
import 'package:ifsports/services/auth.dart';
import 'package:ifsports/services/database.dart';
import 'package:provider/provider.dart';

class MembersPage extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<QuerySnapshot>.value(
      value: DatabaseService().atletas,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Atletas'),
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
