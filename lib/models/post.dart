class Post{
  String id,title,content,dateWritten,featuredImage;
  int votesUp,votesDown,userId,categoryId;
  List<int> votersUp,votersDown;

  Post({this.id, this.title, this.content, this.dateWritten, this.featuredImage,
      this.userId, this.categoryId, this.votesUp, this.votesDown, this.votersUp,
      this.votersDown});
}