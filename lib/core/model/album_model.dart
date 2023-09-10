class AlbumModel {
  final int height;
  final int width;

  final String id;
  final String url;

  AlbumModel({required this.width, required this.id, required this.height, required this.url});

  factory AlbumModel.fromJson(Map<String, dynamic> jsonData) {
    return AlbumModel(
        height: jsonData['height'],
        width: jsonData['width'],

        id: jsonData['id'],
        url: jsonData['url']);
  }
}
