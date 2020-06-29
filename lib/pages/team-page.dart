import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ifsports/components/atleta_tile.dart';
import 'package:ifsports/provider/atleta-provider.dart';
import 'package:ifsports/routes/app-routes.dart';
import 'package:provider/provider.dart';

class TeamPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AtletasProvider users = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Time'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: users.count,
        itemBuilder: (ctx, index) => UserTile(users.byIndex(index)),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(
            AppRoutes.USER_FORM,
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
