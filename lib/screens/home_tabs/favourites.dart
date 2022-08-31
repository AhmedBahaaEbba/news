import 'dart:math';

import 'package:flutter/material.dart';

class Favourites extends StatefulWidget {
  @override
  _FavouritesState createState() => _FavouritesState();
}

class _FavouritesState extends State<Favourites> {
  List<Color> colrsList = <Color>[
    Colors.blue,
    Colors.blueAccent,
    Colors.cyan,
    Colors.teal,
    Colors.cyanAccent,
    Colors.lightBlueAccent,
    Colors.indigoAccent,
    Colors.tealAccent,
    Colors.deepPurpleAccent
  ];

  Random random = Random();

  Color _getRandomColor() {
    return colrsList[random.nextInt(colrsList.length)];
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, position) {
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
              child: Column(
                children: <Widget>[
                  _authorRow(),
                  SizedBox(
                    height: 16,
                  ),
                  _newsItemRow(),
                ],
              ),
            ),
          ),
        );
      },
      itemCount: 20,
    );
  }

  Widget _authorRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: ExactAssetImage("assets/images/news.jpg"),
                  fit: BoxFit.cover,
                ),
                shape: BoxShape.circle,
              ),
              width: 50,
              height: 50,
              margin: EdgeInsets.only(right: 8),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Name Here !!!",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  children: <Widget>[
                    Text(
                      "15 Min",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 2, left: 2),
                      width: 3,
                      height: 3,
                      decoration: BoxDecoration(
                          color: Colors.grey, shape: BoxShape.circle),
                    ),
                    Text(
                      "Life Style",
                      style: TextStyle(color: _getRandomColor()),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
        IconButton(
          icon: Icon(Icons.bookmark_border),
          onPressed: () {},
          color: Colors.grey,
        ),
      ],
    );
  }

  Widget _newsItemRow() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container (
          margin: EdgeInsets.only(right: 16),
          width: 132,
          height: 132,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: ExactAssetImage("assets/images/news.jpg"),
              fit: BoxFit.cover,
            )
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("Here You Can see the Title !!!",style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 18
              ),
              maxLines: 2,),
              SizedBox(
                height: 8,
              ),
              Text("Here You Can See the Description !!!",
              maxLines: 3,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
                height: 1.25
              ),),
            ],
          ),
        ),
      ],
    );
  }
}
