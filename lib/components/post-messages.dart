import 'package:flutter/material.dart';

class PostMessages extends StatelessWidget {
  final String urlImage;
  final String user;
  final String time;
  final String message;

  PostMessages(this.urlImage, this.user, this.time, this.message);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(urlImage),
            ),
            title: Text(user),
            subtitle: Text(time),
            trailing: Icon(Icons.more_vert),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Text(
                message,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ),
          ButtonTheme(
            buttonColor: Colors.greenAccent,
            child: ButtonBar(
              children: <Widget>[
                FlatButton(
                  child: Icon(
                    Icons.star,
                    color: Colors.greenAccent,
                  ),
                  onPressed: () {},
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}