import 'package:flutter/material.dart';
import 'package:gaming_social_app/global.dart';
import 'package:gaming_social_app/models/models.dart';
import 'package:gaming_social_app/service/api.dart';
import 'package:gaming_social_app/ui/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Game>> _games;
  late Future<List<Post>> _posts;
  late Future<UserModel> _user;
  late Future<List<UserModel>> _users;
  @override
  void initState() {
    super.initState();
    _games = getGames();
    _posts = getPosts();
    _user = getSpecificUser(loggedInUserID);
    _users = getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: grey,
      child: Column(
        children: <Widget>[
          Container(
            color: Colors.black,
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: <Widget>[
                HomeHeader(
                  userFuture: _user,
                ),
                FriendsList(users: _users),
              ],
            ),
          ),
          GamesList(games: _games),
          Divider(
            color: Colors.grey,
            height: 3,
          ),
          PostsList(posts: _posts),
          SizedBox(height: 75),
        ],
      ),
    );
  }
}
