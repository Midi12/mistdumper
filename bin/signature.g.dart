// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signature.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Signature _$SignatureFromJson(Map<String, dynamic> json) {
  return Signature(
    json['name'] as String,
    json['pattern'] as String,
    json['relative'] as bool,
    json['rip_relative'] as bool,
    json['extra'] as int,
    json['offset'] as int,
  );
}

Map<String, dynamic> _$SignatureToJson(Signature instance) => <String, dynamic>{
      'name': instance.name,
      'pattern': instance.pattern,
      'relative': instance.relative,
      'rip_relative': instance.rip_relative,
      'extra': instance.extra,
      'offset': instance.offset,
    };
