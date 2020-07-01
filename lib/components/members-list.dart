import 'package:flutter/material.dart';
import 'package:ifsports/classes/member.dart';
import 'package:ifsports/components/member-tile.dart';
import 'package:provider/provider.dart';

class MembersList extends StatefulWidget {
  @override
  _MembersListState createState() => _MembersListState();
}

class _MembersListState extends State<MembersList> {
  @override
  Widget build(BuildContext context) {
    final users = Provider.of<List<Member>>(context);

    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        return MemberTile(
          member: users[index],
        );
      },
    );
  }
}
