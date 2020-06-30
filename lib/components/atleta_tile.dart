import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ifsports/classes/atleta.dart';
import 'package:ifsports/provider/atleta-provider.dart';
import 'package:ifsports/routes/app-routes.dart';
import 'package:provider/provider.dart';

class AtletaTile extends StatelessWidget {
  final Atleta atleta;

  const AtletaTile(this.atleta);

  @override
  Widget build(BuildContext context) {
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
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.edit),
              color: Colors.cyan,
              onPressed: () {
                Navigator.of(context).pushNamed(
                  AppRoutes.USER_FORM,
                  arguments: atleta,
                );
              },
            ),
            IconButton(
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
                        .remove(atleta);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
