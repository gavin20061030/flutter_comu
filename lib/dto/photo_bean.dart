class PhotoBean {
  String id;
  String author;
  int width;
  int height;
  String url;
  String downloadUrl;

  PhotoBean(
      {this.id = '',
      this.author = '',
      this.width = 0,
      this.height = 0,
      this.url = '',
      this.downloadUrl = ''});

  factory PhotoBean.fromJson(Map<String, dynamic> json) {
    return PhotoBean(
      id: json['id'],
      author: json['author'],
      width: json['width'],
      height: json['height'],
      url: json['url'],
      downloadUrl: json['download_url'],
    );
  }
}
