import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ifsports/classes/atleta.dart';
import 'package:ifsports/provider/atleta-provider.dart';
import 'package:provider/provider.dart';

class AtletaTile extends StatelessWidget {
  final Atleta atleta;
  const AtletaTile(this.atleta);

  @override
  Widget build(BuildContext context) {
    final AtletasProvider users = Provider.of(context);
    final index = users.byAtleta(atleta);
    final avatar = atleta.avatarUrl == null || atleta.avatarUrl.isEmpty
        ? CircleAvatar(child: Icon(Icons.person))
        : CircleAvatar(
            backgroundImage: NetworkImage(atleta.avatarUrl),
          );

    return ListTile(
      leading: avatar,
      title: Text(atleta.name),
      subtitle: Text(atleta.modalidade),
      trailing: Container(
        child: IconButton(
          icon: Icon(Icons.delete),
          color: Colors.redAccent,
          onPressed: () {
            showDialog(
              context: context,
              builder: (ctx) => AlertDialog(
                title: Text('Excluir Usuário'),
                content: Text('Confirmar Exclusão'),
                actions: <Widget>[
                  FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                    child: Text('CANCELAR'),
                  ),
                  FlatButton(
                    color: Colors.redAccent,
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                    child: Text(
                      'EXCLUIR',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ).then(
              (confirmed) {
                Provider.of<AtletasProvider>(context, listen: false)
                    .removeAt(index);
              },
            );
          },
        ),
      ),
    );
  }
}
