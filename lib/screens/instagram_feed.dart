import 'package:flutter/material.dart';
import 'package:news_app/shared_ui/navigation_drawer.dart';

class InstagramFeed extends StatefulWidget {
  @override
  _InstagramFeedState createState() => _InstagramFeedState();
}

class _InstagramFeedState extends State<InstagramFeed> {

  List<int> ids = [ 0 , 2 , 5];


  TextStyle _hashTagStyle = TextStyle(
    color: Colors.orange,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Instagram Feeds"),
        centerTitle: false,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ],
      ),
      drawer: NavigationDrawer(),
      body: ListView.builder(
        padding: EdgeInsets.all(8),
        itemBuilder: (context, position) {
          return Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _drawHeader(position),
                _drawTitle(),
                _drawHashTags(),
                _drawBody(),
                _drawFooter(),
              ],
            ),
            margin: EdgeInsets.only(bottom: 16),
          );
        },
        itemCount: 20,
      ),
    );
  }

  Widget _drawHeader(int position) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16),
              child: CircleAvatar(
                backgroundImage: ExactAssetImage('assets/images/news.jpg'),
                radius: 28,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Cierra Vega",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey.shade900,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text("Fri,12,May,2019- 14:30")
              ],
            ),
          ],
        ),
        Row(
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.favorite,
                color: ( ids.contains(position) ) ? Colors.red :Colors.grey.shade400,
              ),
              onPressed: () {
                if(ids.contains(position)){
                  ids.remove(position);
                }else{
                  ids.add(position);
                }
                setState(() {

                });
              },
            ),
            Transform.translate(
              offset: Offset(-10, 0),
              child: Text(
                "25",
                style: TextStyle(
                  color: Colors.grey.shade400,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget _drawTitle() {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Text(
        "Consider now provided laughter boy landlord dashwood. Often voice and the spoke. No shewing fertile village equally prepare up .",
        style: TextStyle(
          color: Colors.grey.shade900,
        ),
        maxLines: 2,
      ),
    );
  }

  Widget _drawHashTags() {
    return Container(
      child: Wrap(
        children: <Widget>[
          FlatButton(
            onPressed: () {},
            child: Text("#advance", style: _hashTagStyle),
          ),
          FlatButton(
            onPressed: () {},
            child: Text("#retro", style: _hashTagStyle),
          ),
          FlatButton(
            onPressed: () {},
            child: Text("#instgram", style: _hashTagStyle),
          ),
        ],
      ),
    );
  }

  Widget _drawBody() {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * .25,
      child: Image(
        image: ExactAssetImage(
          'assets/images/news.jpg',
        ),
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _drawFooter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        FlatButton(
          onPressed: () {},
          child: Text(
            "10 Comments",
            style: _hashTagStyle,
          ),
        ),
        Row(
          children: <Widget>[
            FlatButton(
              onPressed: () {},
              child: Text(
                "SHARE",
                style: _hashTagStyle,
              ),
            ),
            FlatButton(
              onPressed: () {},
              child: Text(
                "OPEN",
                style: _hashTagStyle,
              ),
            ),
          ],
        ),
      ],
    );
  }
}