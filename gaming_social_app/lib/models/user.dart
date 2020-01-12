class UserModel {
  final String fullname, username, id, profilePicture;
  final bool verified;
  final int followerscount, followingcount, postscount;
  final List<UserPostModel> post;

  UserModel({
    this.profilePicture,
    this.id,
    this.fullname,
    this.username,
    this.verified,
    this.followerscount,
    this.followingcount,
    this.postscount,
    this.post,
  });

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
}

class UserPostModel {
  final String content;
  final int type;

  UserPostModel({
    this.content,
    this.type,
  });

  factory UserPostModel.fromJson(Map<String, dynamic> json) {
    return UserPostModel(content: json['content'], type: json['type']);
  }
}
