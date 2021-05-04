import 'dart:io';

import 'package:collection/collection.dart';

import '../find_pattern.dart';
import 'cpp_formatter.dart';
import 'csharp_formatter.dart';
import 'dart_formatter.dart';

abstract class Formatter {
  final DateTime timestamp = DateTime.now();

  Formatter();

  String get ext;
  String get commentSymbol;
  String get header;
  String get footer;
  String get namespace_keyword;

  late String version;
  late String author;
  late String gamename;

  String addLine(String name, int offset);

  void _writeLine(File file, String str) {
    file.writeAsStringSync(str, mode: FileMode.append);
  }

  String dump(List<FindPatternResult> results) {
    var filename = '${gamename.replaceAll(' ', '').trim().toLowerCase()}.$ext';
    if (File(filename).existsSync()) {
      File(filename).deleteSync();
    }

    var output = File(filename);
    _writeLine(output, '$commentSymbol Offsets for $gamename ($version) by $author\n');
    _writeLine(output, '$commentSymbol Generated with mistdumper\n');
    _writeLine(output, '$commentSymbol Timestamp : $timestamp\n\n');

    _writeLine(output, '$header\n');

    results.sort((a, b) => a.namespace.compareTo(b.namespace));
    var grouped_results = groupBy(results, (key) => (key as FindPatternResult).namespace);

    for (var results in grouped_results.entries) {
      _writeLine(output, '\t$namespace_keyword ${results.key} {\n');
      for (var result in results.value) {
        _writeLine(output, '\t\t${addLine(result.name, result.offset)}\n');
      }
      _writeLine(output, '\t}\n');
    }

    _writeLine(output, '$footer\n');
    return filename;
  }
}

Formatter getFormatterByName(String name) {
    Formatter fmter;

    switch (name) {
      case 'dart':
        fmter = DartFormatter();
        break;
      case 'cpp':
      case 'cplusplus':
        fmter = CppFormatter();
        break;
      case 'cs':
      case 'csharp':
        fmter = CsharpFormatter();
        break;
      default:
        throw Exception('Unknown formatter $name');
    }

    return fmter;
  }