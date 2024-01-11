import 'package:flutter/cupertino.dart';
import 'package:gaming_social_app/service/api.dart';

class Game extends ChangeNotifier {
  final String title, mainImg, desc;
  final List<dynamic> imgs;
  final double rating;

  factory Game.fromJson(Map<String, dynamic> json) {
    return Game(
      desc: json['desc'],
      imgs: json['imgs'],
      rating: json['rating'],
      mainImg: json['mainImg'],
      title: json['title'],
    );
  }

  Game(
      {required this.title,
      required this.mainImg,
      required this.desc,
      required this.imgs,
      required this.rating});

  getGame() async {
    List<Game> games = await getGames();
    notifyListeners();
    return games;
  }
}
