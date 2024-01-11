class UserModel {
  final String fullname, username, id, profilePicture;
  final bool verified;
  final int followerscount, followingcount, postscount;
  final List<UserPostModel> post;

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['_id'],
      fullname: json['fullname'],
      username: json['username'],
      profilePicture: json['profilePicture'],
      verified: json['verified'],
      followerscount: json['followers_count'],
      followingcount: json['following_count'],
      post: (json['posts'] as List)
          .map((i) => UserPostModel.fromJson(i))
          .toList(),
      postscount: json['posts_count'],
    );
  }

  UserModel(
      {required this.fullname,
      required this.username,
      required this.id,
      required this.profilePicture,
      required this.verified,
      required this.followerscount,
      required this.followingcount,
      required this.postscount,
      required this.post});
}

class UserPostModel {
  final String content;
  final int type;

  factory UserPostModel.fromJson(Map<String, dynamic> json) {
    return UserPostModel(content: json['content'], type: json['type']);
  }

  UserPostModel({required this.content, required this.type});
}
