import 'package:flutter/material.dart';
import 'package:gaming_social_app/global.dart';
import 'package:gaming_social_app/models/mynavigation.dart';
import 'package:provider/provider.dart';

class ProfileHeader extends StatefulWidget {
  final AsyncSnapshot snapshot;

  const ProfileHeader({Key key, @required this.snapshot}) : super(key: key);
  @override
  _ProfileHeaderState createState() => _ProfileHeaderState();
}

class _ProfileHeaderState extends State<ProfileHeader> {

  int _currentCoverIndex = 0;


  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2,
      child: Stack(
        children: <Widget>[
          Positioned.fill(
            child: PageView.builder(
              onPageChanged: (i) {
                setState(() {
                  _currentCoverIndex = i;
                });
              },
              itemCount: widget.snapshot.data.post.length,
              itemBuilder: (ctx, i) {
                return Image.network(
                  "${widget.snapshot.data.post[i].content}",
                  fit: BoxFit.cover,
                );
              },
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: 15.0, vertical: 11.0),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(.3),
                    Colors.transparent,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: Icon(
                        Icons.chevron_left,
                        color: greenColor,
                      ),
                      onPressed: () {
                        Provider.of<MyNavigation>(context, listen: false).goHome();
                      },
                    ),
                  ),
                  Text(
                    "${widget.snapshot.data.username}",
                    style: Theme.of(context)
                        .textTheme
                        .title
                        .copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                      "${widget.snapshot.data.profilePicture}",
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(.5),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text(
                              "$usertype",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline
                                  .copyWith(
                                    color: greenColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            SizedBox(width: 15),
                            widget.snapshot.data.verified
                                ? Container(
                                    padding:
                                        const EdgeInsets.all(5.0),
                                    decoration: BoxDecoration(
                                        color: Colors.blue,
                                        shape: BoxShape.circle),
                                    child: Icon(
                                      Icons.check,
                                      color: Colors.white,
                                    ),
                                  )
                                : Container(),
                          ],
                        ),
                        Text(
                          "${widget.snapshot.data.fullname}",
                          style: Theme.of(context)
                              .textTheme
                              .display1
                              .copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: RaisedButton(
                                child: Text(
                                  "Follow",
                                  style: Theme.of(context)
                                      .textTheme
                                      .button
                                      .copyWith(
                                          fontWeight:
                                              FontWeight.bold),
                                ),
                                onPressed: () {},
                                color: greenColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(25.0),
                                ),
                              ),
                            ),
                            SizedBox(width: 15),
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                padding:
                                    const EdgeInsets.all(5.0),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey[200],
                                  ),
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.more_vert,
                                  color: greenColor,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Row(
                                crossAxisAlignment:
                                    CrossAxisAlignment.end,
                                mainAxisAlignment:
                                    MainAxisAlignment.end,
                                children: List.generate(
                                    widget.snapshot.data.post.length,
                                    (f) {
                                  return Container(
                                    height: 9,
                                    width: 9,
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 3.0),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color:
                                          _currentCoverIndex == f
                                              ? greenColor
                                              : Colors.white,
                                    ),
                                  );
                                }),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
