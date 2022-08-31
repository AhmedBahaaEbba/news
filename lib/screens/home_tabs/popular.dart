import 'package:flutter/material.dart';
import 'package:news_app/api/posts_api.dart';
import 'package:news_app/screens/single_post.dart';
import 'package:news_app/utilities/data_utilities.dart';

class Popular extends StatefulWidget {
  @override
  _PopularState createState() => _PopularState();
}

class _PopularState extends State<Popular> {
  PostsAPI postsAPI = PostsAPI();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: postsAPI.fetchPostsByCategoryId(""),
        builder: (context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return loading();
              break;
            case ConnectionState.active:
              return loading();
              break;
            case ConnectionState.none:
              return connectionError();
              break;
            case ConnectionState.done:
              if (snapshot.hasError) {
                return ListView.builder(
                  itemBuilder: (context, position) {
                    return _drawSingleRow();
                  },
                  itemCount: 20,
                );
              } else {
                if (snapshot.hasData) {
                  //ToDo : Print Data Here
                } else {
                  return noData();
                }
              }
              break;
          }
          return null;
        });
  }

  Widget _drawSingleRow() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return SinglePost();
            },
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: <Widget>[
            SizedBox(
              child: Image(
                image: ExactAssetImage('assets/images/news.jpg'),
                fit: BoxFit.cover,
              ),
              width: 124,
              height: 124,
            ),
            SizedBox(
              width: 8,
            ),
            Expanded(
              child: Column(
                children: <Widget>[
                  Text(
                    "Here You Can see the News !!!",
                    maxLines: 2,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("Name"),
                      Row(
                        children: <Widget>[
                          Icon(Icons.access_time),
                          Text("15 min"),
                        ],
                      )
                    ],
                  )
                ],
                crossAxisAlignment: CrossAxisAlignment.start,
              ),
            ),
          ],
          crossAxisAlignment: CrossAxisAlignment.start,
        ),
      ),
    );
  }
}
