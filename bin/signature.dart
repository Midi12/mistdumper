import 'package:json_annotation/json_annotation.dart';

part 'signature.g.dart';

@JsonSerializable()
class Signature {

  final String name;
  final String pattern;
  final bool relative;
  final int offset;
  final String namespace;

  Signature(this.name, this.pattern, this.relative, this.offset, this.namespace);

  factory Signature.fromJson(Map<String, dynamic> json) => _$SignatureFromJson(json);

  Map<String, dynamic> toJson() => _$SignatureToJson(this);
}