import 'formatter.dart';

class CsharpFormatter extends Formatter {

  CsharpFormatter() : super();

  @override
  String get ext => 'cs';

  @override
  String get commentSymbol => '//';

  @override
  String get header => 'using System;\n\nnamespace Signatures\n{';

  @override
  String get footer => '}';

  @override
  String addLine(String name, int offset) {
    return 'public static readonly UIntPtr $name = 0x${offset.toRadixString(16)};';
  }
}