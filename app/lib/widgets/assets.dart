class Assets {
  static Images image = Images("assets");
}

class Images {
  final String path;
  Images(this.path);
  String get ina => "$path/ina.png";
  String get logo => "$path/logo.png";
  String get splash => "$path/logo.png";
}
