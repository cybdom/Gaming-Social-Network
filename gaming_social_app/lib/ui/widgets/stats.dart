import 'package:flutter/material.dart';

import '../../global.dart';


class StatsWidget extends StatelessWidget {
  final AsyncSnapshot snapshot;
  const StatsWidget({
    Key key, @required this.snapshot,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.0),
      color: Colors.black,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: Column(
              children: <Widget>[
                Text(
                  "${snapshot.data.followerscount}",
                  style: Theme.of(context)
                      .textTheme
                      .headline
                      .copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Text(
                  "Followers",
                  style: Theme.of(context)
                      .textTheme
                      .subhead
                      .copyWith(
                        color: greenColor,
                        fontWeight: FontWeight.bold,
                      ),
                )
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                Text(
                  "${snapshot.data.followingcount}",
                  style: Theme.of(context)
                      .textTheme
                      .headline
                      .copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Text(
                  "Following",
                  style: Theme.of(context)
                      .textTheme
                      .subhead
                      .copyWith(
                        color: greenColor,
                        fontWeight: FontWeight.bold,
                      ),
                )
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                Text(
                  "${snapshot.data.postscount}",
                  // "",
                  style: Theme.of(context)
                      .textTheme
                      .headline
                      .copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Text(
                  "Posts",
                  style: Theme.of(context)
                      .textTheme
                      .subhead
                      .copyWith(
                        color: greenColor,
                        fontWeight: FontWeight.bold,
                      ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
