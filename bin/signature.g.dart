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
    json['offset'] as int,
    json['namespace'] as String,
  );
}

Map<String, dynamic> _$SignatureToJson(Signature instance) => <String, dynamic>{
      'name': instance.name,
      'pattern': instance.pattern,
      'relative': instance.relative,
      'offset': instance.offset,
      'namespace': instance.namespace,
    };
