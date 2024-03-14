class ViewModel {
  String? albumId;
  String? id;
  String? title;
  String? url;
  String? thumbnailUrl;

  ViewModel({this.albumId, this.id, this.title, this.url, this.thumbnailUrl});

  ViewModel.fromJson(Map<String, dynamic> json) {
    albumId = json['albumId'].toString();
    id = json['id'].toString();
    title = json['title'];
    url = json['url'];
    thumbnailUrl = json['thumbnailUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['albumId'] = this.albumId;
    data['id'] = this.id;
    data['title'] = this.title;
    data['url'] = this.url;
    data['thumbnailUrl'] = this.thumbnailUrl;
    return data;
  }
}