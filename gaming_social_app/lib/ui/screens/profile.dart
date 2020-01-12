import 'package:flutter/material.dart';
import 'package:gaming_social_app/global.dart';
import 'package:gaming_social_app/models/mynavigation.dart';
import 'package:gaming_social_app/models/models.dart';
import 'package:gaming_social_app/service/api.dart';
import 'package:gaming_social_app/ui/widgets/widgets.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    String _userId = Provider.of<MyNavigation>(context).profileId;
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(bottom: 70),
        constraints: BoxConstraints(
          minHeight: MediaQuery.of(context).size.height,
        ),
        color: grey,
        child: FutureBuilder<UserModel>(
          future: getSpecificUser(_userId),
          builder: (ctx, snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: <Widget>[
                  ProfileHeader(
                    snapshot: snapshot,
                  ),
                  StatsWidget(
                    snapshot: snapshot,
                  ),
                  ProfilePostsWidget(snapshot: snapshot),
                ],
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
