import 'package:flutter/material.dart';

//import 'package:news_app/models/post.dart';

class SinglePost extends StatefulWidget {
//  final Post post;
//
//  SinglePost(this.post);

  @override
  _SinglePostState createState() => _SinglePostState();
}

class _SinglePostState extends State<SinglePost> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            actions: <Widget>[
              IconButton(icon: Icon(Icons.share), onPressed: () {}),
              IconButton(
                icon: Icon(Icons.bookmark_border),
                onPressed: () {},
              )
            ],
            floating: true,
            pinned: true,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: ExactAssetImage("assets/images/news.jpg"),
                      fit: BoxFit.cover),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, position) {
                switch (position) {
                  case 0:
                    return _drawPostDetails();
                    break;
                  case 1:
                    return _drawSingleLine();
                    break;
                  case 2:
                    return _drawCommentsCount();
                    break;
                  case 9:
                    return _commentTextEntry();
                    break;
                  default:
                    return _drawSingleComment();
                    break;
                }
              },
              childCount: 10,
            ),
          )
        ],
      ),
    );
  }

  Widget _drawPostDetails() {
    return Container(
      child: Text("Scarcely on striking packages by so property in delicate. Up or well must less rent read walk so be. Easy sold at do hour sing spot. Any meant has cease too the decay. Since party burst am it match. By or blushes between besides offices noisier as. Sending do brought winding compass in. Paid day till shed only fact age its end. "
          "Perpetual sincerity out suspected necessary one but provision satisfied. Respect nothing use set waiting pursuit nay you looking. If on prevailed concluded ye abilities. Address say you new but minuter greater. Do denied agreed in innate. Can and middletons thoroughly themselves him. Tolerably sportsmen belonging in september no am immediate newspaper. Theirs expect dinner it pretty indeed having no of. Principle september she conveying did eat may extensive. ",
        style: TextStyle(
            color: Colors.grey.shade600,
            fontSize: 16,
            height: 1,
            letterSpacing: 1),
      ),
      padding: EdgeInsets.all(16),
    );
  }

  Widget _drawSingleLine() {
    return Container(
      height: .5,
      color: Colors.grey.shade400,
      padding: EdgeInsets.only(top: 8, bottom: 8),
    );
  }

  Widget _drawCommentsCount() {
    return Container(
      child: Text(
        "Comments (6)",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      ),
      padding: EdgeInsets.only(right: 16, left: 32, top: 16, bottom: 8),
    );
  }

  Widget _drawSingleComment() {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16),
              child: CircleAvatar(
                backgroundImage: ExactAssetImage("assets/images/news.jpg"),
                radius: 26,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Auther Name",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.grey.shade700,
                      fontSize: 16),
                ),
                Container(
                  height: 8,
                ),
                Text(
                  "1 hour",
                  style: TextStyle(color: Colors.grey.shade600),
                ),
              ],
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
          child: Text("Certain but she but shyness why cottage. Gay the put instrument sir entreaties affronting. Pretended exquisite see cordially the you."),
        ),
        Container(
          height: .5,
          color: Colors.grey.shade400,
          padding: EdgeInsets.only(top: 8, bottom: 8),
        ),
      ],
    );
  }

  Widget _commentTextEntry() {
    return Container(
      color: Color.fromRGBO(241, 245, 247, 1),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Flexible(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Write comment here",
                    contentPadding: EdgeInsets.all(16),
                    border: InputBorder.none,
                  ),
                ),
              ),
              FlatButton(
                onPressed: () {},
                child: Text(
                  "SEND",
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ],
          ),
          Container(
            height: 5,
          )
        ],
      ),
    );
  }
}
