class ImageConstants {
  static ImageConstants? _instance;
  static ImageConstants get instance {
    _instance ??= ImageConstants._init();
    return _instance!;
  }

  ImageConstants._init();

  String get logo => toPng('cliplogo.png');
  String get google => toPng('google.png');
  String get apple => toPng('apple.png');
  String get story => toPng('story.png');
  String get post => toPng('post.png');
  String get map => toPng('map.png');

  String toPng(String name) => 'assets/images/$name';
}
