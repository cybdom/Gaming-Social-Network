class Post {
  final String title, content, userId, gameId, date, id;
  final int likes;
  final List<CommentModel> comments;
  final List<MediaModel> media;

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

  Post(
      {required this.title,
      required this.content,
      required this.userId,
      required this.gameId,
      required this.date,
      required this.id,
      required this.likes,
      required this.comments,
      required this.media});
}

class MediaModel {
  final String content, id;
  final int mediatype;

  factory MediaModel.fromJson(Map<String, dynamic> json) {
    return MediaModel(
        id: json['_id'],
        content: json['content'],
        mediatype: json['mediatype']);
  }

  MediaModel(
      {required this.content, required this.id, required this.mediatype});
}

class CommentModel {
  final String content, user;
  factory CommentModel.fromJson(Map<String, dynamic> json) {
    return CommentModel(
      content: json['content'],
      user: json['user'],
    );
  }

  CommentModel({required this.content, required this.user});
}
