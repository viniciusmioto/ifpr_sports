import 'package:flutter/material.dart';
import 'package:ifsports/classes/member.dart';

class MemberTile extends StatelessWidget {
  final Member member;
  MemberTile({this.member});

  @override
  Widget build(BuildContext context) {
    final avatar = member.avatarUrl == null || member.avatarUrl.isEmpty
        ? CircleAvatar(child: Icon(Icons.person))
        : CircleAvatar(
            backgroundImage: NetworkImage(member.avatarUrl),
          );

    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
        child: ListTile(
          leading: avatar,
          title: Text(member.nome),
          subtitle: Text(member.modalidade),
        ),
      ),
    );
  }
}
