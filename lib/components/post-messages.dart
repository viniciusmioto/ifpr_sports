import 'package:flutter/material.dart';

class PostMessages extends StatefulWidget {
  final String urlImage;
  final String user;
  final String time;
  final String message;

  PostMessages(this.urlImage, this.user, this.time, this.message);

  @override
  _PostMessagesState createState() => _PostMessagesState();
}

class _PostMessagesState extends State<PostMessages> {
  bool _star = false;
  Color cor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    void _switchStar() {
      if (_star == true) {
        _star = false;
      } else {
        _star = true;
      }
    }

    void _changeColor() {
      setState(() {
        _switchStar();
        cor = _star ? Colors.green : Colors.grey;
      });
    }

    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(widget.urlImage),
            ),
            title: Text(widget.user),
            subtitle: Text(widget.time),
            trailing: Icon(Icons.more_vert),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Text(
                widget.message,
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
                IconButton(
                  icon: Icon(
                    Icons.star,
                    color: cor,
                  ),
                  onPressed: () {
                    _changeColor();
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
