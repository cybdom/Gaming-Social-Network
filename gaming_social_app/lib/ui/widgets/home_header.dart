import 'package:flutter/material.dart';
import 'package:gaming_social_app/models/user.dart';
import 'package:gaming_social_app/ui/widgets/userProfilePicture.dart';

class HomeHeader extends StatelessWidget {
  final Future<UserModel> userFuture;

  const HomeHeader({Key key,@required this.userFuture}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        IconButton(
          icon: Icon(
            Icons.menu,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
        Text(
          "Cybdom",
          style: Theme.of(context).textTheme.title.copyWith(
                color: Colors.white,
              ),
        ),
        FutureBuilder<UserModel>(
          future: userFuture,
          builder: (ctx, snapshot) {
            if (snapshot.hasData) {
              print(snapshot.data.profilePicture);
              return UserProfilePicture(
                userId: snapshot.data.id,
                profilePicture: snapshot.data.profilePicture,
              );
            } else {
              return Center(
                child: CircleAvatar(),
              );
            }
          },
        ),
      ],
    );
  }
}
