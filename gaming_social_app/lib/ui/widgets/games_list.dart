import 'package:flutter/material.dart';
import 'package:gaming_social_app/models/game.dart';

class GamesList extends StatelessWidget {
  const GamesList({
    Key key,
    @required Future<List<Game>> games,
  }) : _games = games, super(key: key);

  final Future<List<Game>> _games;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 51,
      alignment: Alignment.center,
      child: FutureBuilder<List<Game>>(
        future: _games,
        builder: (ctx, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data.length,
              itemBuilder: (ctx, i) {
                return Container(
                  alignment: Alignment.center,
                  margin: i != snapshot.data.length
                      ? const EdgeInsets.only(right: 15)
                      : EdgeInsets.zero,
                  child: GestureDetector(
                    onTap: () {},
                    child: Text(
                      "${snapshot.data[i].title}",
                      style: Theme.of(context).textTheme.button.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
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

