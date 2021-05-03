import 'package:json_annotation/json_annotation.dart';

import 'signature.dart';

part 'config.g.dart';

@JsonSerializable()
class Config {

  final String name;
  final String game_name;
  final String version;
  final String author;
  final List<Signature> signatures;

  Config(this.name, this.game_name, this.version, this.author, this.signatures);

  factory Config.fromJson(Map<String, dynamic> json) => _$ConfigFromJson(json);

  Map<String, dynamic> toJson() => _$ConfigToJson(this);
}