import 'package:flutter/material.dart';
import 'package:gaming_social_app/global.dart';


class ProfilePostsWidget extends StatelessWidget {
  final AsyncSnapshot snapshot;
  const ProfilePostsWidget({
    Key key,
    @required this.snapshot,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.0),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 35,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                postTypes.length,
                (i) {
                  return GestureDetector(
                    onTap: () {},
                    child: Text(
                      "${postTypes[i]}",
                      style: Theme.of(context).textTheme.button.copyWith(
                            color: Colors.white,
                          ),
                    ),
                  );
                },
              ),
            ),
          ),
          Divider(),
          GridView.builder(
            itemCount: snapshot.data.post.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 11.0,
                mainAxisSpacing: 11.0),
            itemBuilder: (ctx, i) {
              return GestureDetector(
                onTap: () {},
                child: Image.network(
                  "${snapshot.data.post[i].content}",
                  fit: BoxFit.cover,
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
