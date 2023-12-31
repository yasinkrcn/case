class AssetPaths {
  static final AssetPaths _instance = AssetPaths._init();
  AssetPaths._init();

  factory AssetPaths() {
    return _instance;
  }

  String _toSVG(String name) => 'assets/svg/$name.svg';
  String _toPNG(String name) => 'assets/png/$name.png';
  String _toJPEG(String name) => 'assets/jpeg/$name.jpeg';
  String _toJSON(String name) => 'assets/json/$name.json';
  String _toGIF(String name) => 'assets/gif/$name.gif';

  //*PNG

  String get loginPNG => _toPNG("login");
}
