// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Config _$ConfigFromJson(Map<String, dynamic> json) {
  return Config(
    json['name'] as String,
    json['appname'] as String,
    json['version'] as String,
    json['author'] as String,
    (json['signatures'] as List<dynamic>)
        .map((e) => Signature.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$ConfigToJson(Config instance) => <String, dynamic>{
      'name': instance.name,
      'appname': instance.appname,
      'version': instance.version,
      'author': instance.author,
      'signatures': instance.signatures,
    };
