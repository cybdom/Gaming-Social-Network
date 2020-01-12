class Post {
  final String title, content, userId, gameId, date, id;
  final int likes;
  final List<CommentModel> comments;
  final List<MediaModel> media;

  Post(
      {this.title,
      this.id,
      this.content,
      this.userId,
      this.gameId,
      this.date,
      this.likes,
      this.comments,
      this.media});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['_id'],
      title: json['title'],
      content: json['content'],
      media:
          (json['media'] as List).map((i) => MediaModel.fromJson(i)).toList(),
      gameId: json['gameId'],
      likes: json['likes'],
      comments: (json['comments'] as List)
          .map((i) => CommentModel.fromJson(i))
          .toList(),
      date: json['date'],
      userId: json['userId'],
    );
  }
}

class MediaModel {
  final String content, id;
  final int mediatype;

  MediaModel({
    this.content,
    this.id,
    this.mediatype,
  });

  factory MediaModel.fromJson(Map<String, dynamic> json) {
    return MediaModel(
        id: json['_id'],
        content: json['content'],
        mediatype: json['mediatype']);
  }
}

class CommentModel {
  final String content, user;

  CommentModel({this.content, this.user});
  factory CommentModel.fromJson(Map<String, dynamic> json) {
    return CommentModel(
      content: json['content'],
      user: json['user'],
    );
  }
}
