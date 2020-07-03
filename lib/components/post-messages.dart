import 'package:flutter/material.dart';
import 'package:ifsports/classes/post.dart';
import 'package:ifsports/components/post-tile.dart';
import 'package:provider/provider.dart';

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
  
  @override
  Widget build(BuildContext context) {
    final posts = Provider.of<List<Post>>(context);
    posts.forEach((post) {
      print(post.text);
      print(post.useravatar);
      print(post.username);
    });
    

    return ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          return PostTile(post: posts[index]);
        });
  }
}
