import 'package:flutter/material.dart';
import 'package:ifsports/classes/post.dart';

class PostTile extends StatefulWidget {
  final Post post;

  PostTile({this.post});

  @override
  _PostTileState createState() => _PostTileState();
}

class _PostTileState extends State<PostTile> {
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
              backgroundImage: NetworkImage(widget.post.useravatar),
            ),
            title: Text(widget.post.username),
            subtitle: Text(widget.post.datehour),
            trailing: Icon(Icons.more_vert),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Text(
                widget.post.text,
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
