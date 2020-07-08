import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ifsports/classes/atleta.dart';
import 'package:ifsports/classes/member.dart';
import 'package:ifsports/provider/atleta-provider.dart';
import 'package:provider/provider.dart';

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
        margin: EdgeInsets.all(0),
        child: ListTile(
          leading: avatar,
          title: Text(member.nome),
          subtitle: Text(member.modalidade),
          trailing: IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  title: Text(member.email),
                  content: Text('clique para adicionar ao seu time'),
                  actions: [
                    IconButton(
                      icon: Icon(Icons.person_add),
                      onPressed: () {
                        Provider.of<AtletasProvider>(context, listen: false)
                            .put(
                          Atleta(
                            id: member.email,
                            name: member.nome,
                            modalidade: member.modalidade,
                            avatarUrl: member.avatarUrl,
                          ),
                        );
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              );
            },
            icon: Icon(Icons.more_vert),
          ),
        ),
      ),
    );
  }
}
