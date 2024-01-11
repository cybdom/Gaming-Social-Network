import 'package:flutter/material.dart';
import 'package:gaming_social_app/models/post.dart';
import 'package:gaming_social_app/ui/widgets/single_post.dart';

class PostsList extends StatelessWidget {
  const PostsList({
    Key? key,
    required Future<List<Post>> posts,
  })  : _posts = posts,
        super(key: key);

  final Future<List<Post>> _posts;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder<List<Post>>(
        future: _posts,
        builder: (ctx, postSnapshot) {
          if (postSnapshot.hasData) {
            return ListView.builder(
              itemCount: postSnapshot.data!.length,
              itemBuilder: (ctx, i) {
                return SinglePostWidget(
                  i: i,
                  postSnapshot: postSnapshot,
                );
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
