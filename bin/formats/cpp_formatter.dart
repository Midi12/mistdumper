import 'formatter.dart';

class CppFormatter extends Formatter {

  CppFormatter() : super();

  @override
  String get ext => 'hpp';

  @override
  String get commentSymbol => '//';

  @override
  String get header => '#pragma once\n#include <cstdint>\n\nnamespace Signatures {';

  @override
  String get footer => '}';

  @override
  String addLine(String name, int offset) {
    return 'constexpr ::std::ptrdiff_t $name = 0x${offset.toRadixString(16)};';
  }
}