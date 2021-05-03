import 'package:json_annotation/json_annotation.dart';

part 'signature.g.dart';

@JsonSerializable()
class Signature {

  final String name;
  final String pattern;
  final bool relative;
  final bool rip_relative;
  final int extra;
  final int offset;

  Signature(this.name, this.pattern, this.relative, this.rip_relative, this.extra, this.offset);

  factory Signature.fromJson(Map<String, dynamic> json) => _$SignatureFromJson(json);

  Map<String, dynamic> toJson() => _$SignatureToJson(this);
}