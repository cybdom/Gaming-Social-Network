import 'package:flutter/material.dart';
import 'package:gaming_social_app/global.dart';
import 'package:gaming_social_app/models/mynavigation.dart';
import 'package:gaming_social_app/models/models.dart';
import 'package:gaming_social_app/service/api.dart';
import 'package:gaming_social_app/ui/widgets/userProfilePicture.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;

class SinglePostWidget extends StatelessWidget {
  final int i;
  final AsyncSnapshot postSnapshot;
  const SinglePostWidget({
    Key key,@required this.i, @required this.postSnapshot,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Provider.of<MyNavigation>(context, listen: false)
            .goProfile(id: postSnapshot.data[i].userId);
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.grey,
            ),
          ),
        ),
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                FutureBuilder<UserModel>(
                  future: getSpecificUser(
                    postSnapshot.data[i].userId,
                    // loggedInUserID
                  ),
                  builder: (ctx, singleUserSnapshot) {
                    if (singleUserSnapshot.hasData) {
                      return UserProfilePicture(
                        userId: singleUserSnapshot.data.id,
                        profilePicture: singleUserSnapshot
                            .data.profilePicture,
                      );
                    } else {
                      return CircleAvatar();
                    }
                  },
                ),
                SizedBox(width: 15),
                Expanded(
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: <Widget>[
                      FutureBuilder<UserModel>(
                        future: getSpecificUser(
                          postSnapshot.data[i].userId,
                        ),
                        builder: (ctx, singleUserSnapshot) {
                          if (singleUserSnapshot.hasData) {
                            return Text(
                              "${singleUserSnapshot.data.username}",
                              style: Theme.of(context)
                                  .textTheme
                                  .title
                                  .copyWith(
                                    color: Colors.white,
                                    fontWeight:
                                        FontWeight.bold,
                                  ),
                            );
                          } else {
                            return Text("Loading...");
                          }
                        },
                      ),
                      FutureBuilder<Game>(
                        future: getSpecificGame(
                            postSnapshot.data[i].gameId),
                        builder: (ctx, singleGameSnapshot) {
                          if (singleGameSnapshot.hasData) {
                            return Text(
                              "${singleGameSnapshot.data.title}",
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle
                                  .copyWith(
                                      color: Colors.grey),
                            );
                          } else {
                            return Text("Loading...");
                          }
                        },
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.more_vert,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
            Container(
              margin:
                  const EdgeInsets.symmetric(vertical: 15.0),
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 4,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.network(
                  "${postSnapshot.data[i].media[0].content}",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text(
              "${postSnapshot.data[i].title}",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context)
                  .textTheme
                  .subtitle
                  .copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            SizedBox(height: 15),
            Row(
              children: <Widget>[
                FlatButton.icon(
                  onPressed: () {},
                  icon: Icon(
                    Icons.favorite_border,
                    color: greenColor,
                  ),
                  label: Text(
                    "${postSnapshot.data[i].likes}",
                    style: Theme.of(context)
                        .textTheme
                        .button
                        .copyWith(
                            color: greenColor,
                            fontWeight: FontWeight.bold),
                  ),
                ),
                FlatButton.icon(
                  onPressed: () {},
                  icon: Icon(
                    Icons.comment,
                    color: Colors.white,
                  ),
                  label: Text(
                    "${postSnapshot.data[i].comments.length}",
                    style: Theme.of(context)
                        .textTheme
                        .button
                        .copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  child: Text(
                    timeago.format(
                        DateTime.parse(
                            "${postSnapshot.data[i].date}"),
                        locale: "en"),
                    textAlign: TextAlign.end,
                    style: Theme.of(context)
                        .textTheme
                        .subtitle
                        .copyWith(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}