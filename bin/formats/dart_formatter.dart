import 'formatter.dart';

class DartFormatter extends Formatter {

  DartFormatter() : super();

  @override
  String get ext => 'dart';

  @override
  String get commentSymbol => '//';

  @override
  String get header => 'library mistdumper;\n\nclass Signatures {';

  @override
  String get footer => '}';

  @override
  String addLine(String name, int offset) {
    return 'static const int $name = 0x${offset.toRadixString(16)};';
  }
}