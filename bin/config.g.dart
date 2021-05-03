// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Config _$ConfigFromJson(Map<String, dynamic> json) {
  return Config(
    json['name'] as String,
    json['game_name'] as String,
    json['version'] as String,
    json['author'] as String,
    (json['signatures'] as List<dynamic>)
        .map((e) => Signature.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$ConfigToJson(Config instance) => <String, dynamic>{
      'name': instance.name,
      'game_name': instance.game_name,
      'version': instance.version,
      'author': instance.author,
      'signatures': instance.signatures,
    };
