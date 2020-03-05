import 'package:json_annotation/json_annotation.dart';

part 'doveModel.g.dart';

@JsonSerializable()
class Dove {
  final String name;
  final String description;
  final String imagePath;

  /// Constructor
  Dove(this.name, this.description, this.imagePath);

  /// Serialize and unserialize functions
  factory Dove.fromJson(Map<String, dynamic> json) => _$DoveFromJson(json);
  Map<String, dynamic> toJson() => _$DoveToJson(this);
}