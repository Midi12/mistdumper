import 'formatter.dart';

class CsharpFormatter extends Formatter {

  CsharpFormatter() : super();

  @override
  String get ext => 'cs';

  @override
  String get commentSymbol => '//';

  @override
  String get header => 'using System;\n\nnamespace MistDumper\n{\n\tpublic static class Signatures\n\t{';

  @override
  String get footer => '\t}\n}';

  @override
  String addLine(String name, int offset) {
    return '\tpublic static readonly UIntPtr $name = 0x${offset.toRadixString(16)};';
  }
}