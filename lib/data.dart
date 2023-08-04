class Data {
  final String title;
  final String url;

  const Data({
    required this.title,
    required this.url,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      title: json['title'],
      url: json['url'],
    );
  }
}
