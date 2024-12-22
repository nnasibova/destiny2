class HubModel {
  final String? content;
  final bool? posted;
  String? image;
  List<Comments>? comments;
  final String? date;
  final String? docId;
  final String? userId;

  HubModel(
      {this.content,
      this.date,
      this.userId,
      this.posted,
      this.image,
      this.docId,
      this.comments});

  factory HubModel.fromMap(Map<String, dynamic> data) {
    List<Comments> commentsList = [];
    if (data['comments'] != null) {
      if (data['comments'] is List) {
        commentsList =
            (data['comments'] as List).map((v) => Comments.fromMap(v)).toList();
      }
    }

    return HubModel(
        date: data['date'],
        docId: data['docId'],
        content: data['content'],
        posted: data['posted'],
        userId: data['userId'],
        image: data['image'],
        comments: commentsList);
  }
}

class Comments {
  String? userUid;
  String? comment;
  String? date;
  String? name;

  Comments({this.userUid, this.comment, this.date, this.name});

  factory Comments.fromMap(Map<String, dynamic> data) {
    return Comments(
      userUid: data['user_uid'],
      date: data['date'],
      comment: data['comment'],
      name: data['name'],
    );
  }
}
