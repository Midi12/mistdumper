import 'formatter.dart';

class CppFormatter extends Formatter {

  CppFormatter() : super();

  @override
  String get ext => 'hpp';

  @override
  String get commentSymbol => '//';

  @override
  String get header => '#pragma once\n#include <cstdint>\n\nnamespace mistdumper {\n\tnamespace Signatures {';

  @override
  String get footer => '\t}\n}';

  @override
  String addLine(String name, int offset) {
    return '\tconstexpr ptrdiff_t $name = 0x${offset.toRadixString(16)};';
  }
}