class Ruling {
  final String publishDate;
  final String comment;

  Ruling({this.publishDate, this.comment});

  factory Ruling.fromJson(Map<String, dynamic> json) {
    return Ruling(
      publishDate: json['published_at'],
      comment: json['comment'],
    );
  }

  @override
  String toString() {
    return "{ " +
        "\n\tpublishDate: " +
        publishDate.toString() +
        "\n\tcomment: " +
        comment.toString() +
        "\n}";
  }
}
