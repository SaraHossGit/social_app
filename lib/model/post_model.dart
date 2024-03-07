class PostModel{
  String? profileImg;
  String? username;
  String? date;
  String? postBody;
  String? postImg;
  int? postCommentsCount;
  int? postLikesCount;

  PostModel({
    this.profileImg,
    this.username,
    this.date,
    this.postBody,
    this.postImg,
    this.postCommentsCount,
    this.postLikesCount
});
}