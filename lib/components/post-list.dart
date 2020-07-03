import 'package:flutter/material.dart';
import 'package:ifsports/classes/post.dart';
import 'package:ifsports/components/post-tile.dart';
import 'package:provider/provider.dart';

class PostList extends StatefulWidget {
  @override
  _PostListState createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  @override
  Widget build(BuildContext context) {
    final posts = Provider.of<List<Post>>(context);
    return ListView.builder(
      reverse: true,
      itemCount: posts.length,
      itemBuilder: (context, index) {
        return PostTile(
          post: posts[index],
        );
      },
    );
  }
}
