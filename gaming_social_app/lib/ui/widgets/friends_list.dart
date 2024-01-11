import 'package:flutter/material.dart';
import 'package:gaming_social_app/models/user.dart';
import 'package:gaming_social_app/ui/widgets/userProfilePicture.dart';

class FriendsList extends StatelessWidget {
  const FriendsList({
    Key? key,
    required Future<List<UserModel>> users,
  })  : _users = users,
        super(key: key);

  final Future<List<UserModel>> _users;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 61,
      child: FutureBuilder<List<UserModel>>(
        future: _users,
        builder: (ctx, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data!.length,
              itemBuilder: (ctx, i) {
                return Container(
                  margin: i != snapshot.data!.length
                      ? const EdgeInsets.only(right: 15)
                      : EdgeInsets.zero,
                  child: UserProfilePicture(
                    userId: snapshot.data![i].id,
                    profilePicture: snapshot.data![i].profilePicture,
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
