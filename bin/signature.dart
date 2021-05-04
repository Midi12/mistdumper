import 'package:json_annotation/json_annotation.dart';

part 'signature.g.dart';

@JsonSerializable()
class Signature {
  final String name;
  final String pattern;
  @JsonKey(defaultValue: false)
  final bool relative;
  @JsonKey(defaultValue: 0)
  final int offset;
  final String namespace;
  @JsonKey(defaultValue: false)
  final bool dereference;
  @JsonKey(defaultValue: 0)
  final int dereference_size;

  Signature(this.name, this.pattern, this.relative, this.offset, this.namespace,
      this.dereference, this.dereference_size);

  factory Signature.fromJson(Map<String, dynamic> json) =>
      _$SignatureFromJson(json);

  Map<String, dynamic> toJson() => _$SignatureToJson(this);
}
