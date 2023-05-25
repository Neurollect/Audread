class ImageModel {
  String? path;
  String? name;

  ImageModel({
    this.name,
    this.path,
  });

  static ImageModel fromJson(Map<String, dynamic> json) => ImageModel(
        name: json['alt'] as String,
        path: json['path'] as String?,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'alt': name,
        'path': path,
      };
}
