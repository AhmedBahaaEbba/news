import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/api/posts_api.dart';
import 'package:news_app/screens/single_post.dart';
import 'package:news_app/utilities/data_utilities.dart';
import 'dart:async';
import 'package:timeago/timeago.dart' as timeago;
import 'package:news_app/models/post.dart';

class WhatsNew extends StatefulWidget {
  @override
  _WhatsNewState createState() => _WhatsNewState();
}

class _WhatsNewState extends State<WhatsNew> {
  PostsAPI postsAPI = PostsAPI();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _drawHeader(),
          _drawTopStories(),
          _drawRecentUpdates(),
        ],
      ),
    );
  }

  Widget _drawHeader() {
    TextStyle _headerTitle = TextStyle(
      color: Colors.white,
      fontSize: 24,
      fontWeight: FontWeight.w600,
    );
    TextStyle _headerDescription = TextStyle(
      color: Colors.white,
      fontSize: 18,
    );
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
              //List<Post> posts = snapshot.data;
              //Random random = Random();
              //int randomIndex = random.nextInt(posts.length);
              //Post post = posts[randomIndex];
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
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * .25,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          //image :NetworkImage(post.featuredImage,fit:BoxFit.cover)
                          image: ExactAssetImage('assets/images/news.jpg'),
                          fit: BoxFit.cover)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(right: 48, left: 48),
                        child: Text(
                          //post.title
                          " Here You Can See the News's Title !!!!",
                          style: _headerTitle,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 34, left: 34),
                        child: Text(
                          //post.content.substring(0.75);
                          "Here You Can See the Description Of the News",
                          style: _headerDescription,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            } else {
              if (snapshot.hasData) {
                //ToDo Print Data Here.
              } else {
                return noData();
              }
            }
            break;
        }
        return null;
      },
    );
  }

  Widget _drawTopStories() {
    return Container(
      color: Colors.grey.shade100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 24, top: 16),
            child: _drawSectionTitle("Top Storis"),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Card(
              child: FutureBuilder(
                future: postsAPI.fetchPostsByCategoryId(""),
                builder: (context, AsyncSnapshot snapShot) {
                  switch (snapShot.connectionState) {
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
                      if (snapShot.hasError) {
                        //Post post1 = snapShot.data[0];
                        //Post post2 = snapShot.data[1];
                        //Post post3 = snapShot.data[2];

                        return Column(
                          children: <Widget>[
                            _drawSingleRow(),
                            _drawDivider(),
                            _drawSingleRow(),
                            _drawDivider(),
                            _drawSingleRow(),
                          ],
                        );
                      } else {
                        if (snapShot.hasData) {
                          // ToDo : handle Data
                        } else {
                          return noData();
                        }
                      }
                      break;
                  }
                  return null;
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _drawRecentUpdates() {
    return Padding(
      padding: EdgeInsets.all(8),
      child: FutureBuilder(
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
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: _drawSectionTitle("Recent Updates"),
                      ),
                      _drawRecentUpdateCard(Colors.deepOrange),
                      _drawRecentUpdateCard(Colors.green),
                      SizedBox(
                        height: 48,
                      ),
                    ],
                  );
                } else {
                  if (snapshot.hasData) {
                  } else {
                    return noData();
                  }
                }
                break;
            }
            return null;
          }),
    );
  }

  Widget _drawDivider() {
    return Container(
      height: 1,
      width: double.infinity,
      color: Colors.grey.shade100,
    );
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
              // child: Image.network (post.featuredImage,fit: BoxFit.cover ,),
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
                    // post.title,
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
                          //Flexible(child: Text(_parseHumanDateTime( post.dateWritten )))
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

  //  String _parseHumanDateTime(String dateTime){
  //    Duration timeAgo = DateTime.now().difference(DateTime.parse(dateTime) );
  //    DateTime the Difference = DateTime.now().subtract(timeAgo);
  //    return timeAgo.format(theDifference);
  //  }

  Widget _drawSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        color: Colors.grey.shade700,
        fontWeight: FontWeight.w600,
        fontSize: 16,
      ),
    );
  }

  Widget _drawRecentUpdateCard(Color color) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: ( context ) {
              return SinglePost();
            },
          ),
        );
      },
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: ExactAssetImage("assets/images/news.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              width: double.infinity,
              height: MediaQuery.of(context).size.height * .25,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16, left: 8),
              child: Container(
                padding:
                    EdgeInsets.only(left: 24, right: 24, top: 2, bottom: 2),
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  "SPORT",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                right: 16,
                left: 8,
                top: 8,
              ),
              child: Text(
                "Here You Can See News Title !!!",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
                maxLines: 2,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.access_time,
                    color: Colors.grey,
                    size: 18,
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Text(
                    "15 min",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
