import 'dart:convert';
import 'package:gaming_social_app/models/models.dart';
import 'package:http/http.dart' as http;

final String _baseUrl = "http://192.168.1.102";

// Functions for getting list of data
Future<List<Post>> getPosts() async {
  final response = await http.get(Uri.http(_baseUrl, '/posts'));

  if (response.statusCode == 200) {
    final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
    return parsed.map<Post>((json) => Post.fromJson(json)).toList();
  } else {
    throw Exception("Error");
  }
}

Future<List<Game>> getGames() async {
  final response = await http.get(Uri.http(_baseUrl, '/games'));

  if (response.statusCode == 200) {
    final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
    return parsed.map<Game>((json) => Game.fromJson(json)).toList();
  } else {
    throw Exception("Error");
  }
}

Future<List<UserModel>> getUsers() async {
  final response = await http.get(Uri.http(_baseUrl, '/users'));
  if (response.statusCode == 200) {
    final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
    return parsed.map<UserModel>((json) => UserModel.fromJson(json)).toList();
  } else {
    throw Exception("Error");
  }
}

// Functions for getting single data

Future<UserModel> getSpecificUser(String id) async {
  final response = await http.post(
    Uri.http(_baseUrl, '/users/id'),
    body: json.encode(
      {'id': '$id'},
    ),
    headers: {'Content-Type': 'application/json'},
  );
  if (response.statusCode == 200) {
    final parsed = UserModel.fromJson(json.decode(response.body));
    return parsed;
  } else {
    throw Exception("Error");
  }
}

Future<Game> getSpecificGames(String id) async {
  final response = await http.post(
    Uri.http(_baseUrl, '/games/id'),
    body: json.encode(
      {'id': '$id'},
    ),
    headers: {'Content-Type': 'application/json'},
  );
  if (response.statusCode == 200) {
    final parsed = Game.fromJson(json.decode(response.body));
    return parsed;
  } else {
    throw Exception("Error");
  }
}

Future<Game> getSpecificGame(String id) async {
  final response = await http.post(
    Uri.http(_baseUrl, '/games/id'),
    body: json.encode(
      {'id': '$id'},
    ),
    headers: {'Content-Type': 'application/json'},
  );
  if (response.statusCode == 200) {
    final parsed = Game.fromJson(json.decode(response.body));
    return parsed;
  } else {
    throw Exception("Error");
  }
}

Future<Post> getSpecificPost(String id) async {
  final response = await http.post(
    Uri.http(_baseUrl, '/posts/id'),
    body: json.encode(
      {'id': '$id'},
    ),
    headers: {'Content-Type': 'application/json'},
  );
  if (response.statusCode == 200) {
    final parsed = Post.fromJson(json.decode(response.body));
    return parsed;
  } else {
    throw Exception("Error");
  }
}
