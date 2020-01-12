import 'package:flutter/material.dart';
import 'package:gaming_social_app/global.dart';
import 'package:gaming_social_app/models/mynavigation.dart';
import 'package:provider/provider.dart';


class UserProfilePicture extends StatelessWidget {
  final String profilePicture;
  final String userId;
  const UserProfilePicture({Key key,@required this.profilePicture,@required this.userId}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: greenColor, width: 3),
        ),
        child: CircleAvatar(
          backgroundImage: NetworkImage(profilePicture),
          backgroundColor: Colors.white,
        ),
      ),
      onTap: () {
        Provider.of<MyNavigation>(context, listen: false).goProfile(id: userId);
      },
    );
  }
}
