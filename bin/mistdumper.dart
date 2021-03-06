import 'dart:convert';
import 'dart:io';

import 'package:args/args.dart';
import 'package:pefile/pefile.dart' as pefile;

import 'simple_console.dart';

import 'config.dart';
import 'find_pattern.dart';

import 'formats/formatter.dart';

void banner() {
  message('mistdumper - by Midi12\n');
}

void main(List<String> arguments) {
  banner();

  final parser = ArgParser()
    ..addOption('config',
        abbr: 'c',
        mandatory: true,
        help: 'Path of the config file',
        valueHelp: 'path')
    ..addOption('format',
        abbr: 'f',
        mandatory: true,
        help: 'The output format',
        valueHelp: 'format')
    ..addFlag('versioned',
        defaultsTo: false, help: 'Should the version be appended to file name');

  if (arguments.isEmpty) {
    message('mistdumper.exe [options] <executablePath>');
    message(parser.usage);
    message(
        'executablePath                       Path of the executable to parse');
    return;
  }

  final args = parser.parse(arguments);

  var executablePath = args.rest.isNotEmpty ? args.rest.first : '';

  if (executablePath.isEmpty) {
    error('executablePath is empty');
    return;
  }

  var configPath = args['config'];
  var configFile = File(configPath);
  var config = Config.fromJson(jsonDecode(configFile.readAsStringSync()));

  var pe = pefile.parse(executablePath);
  message('Parsing $executablePath as ${pe.runtimeType.toString()}\n');

  var results = <FindPatternResult>[];
  for (var signature in config.signatures) {
    var result = findPattern(pe, signature);
    if (result != null) {
      message('FOUND ${result.name} => ${result.offset.toRadixString(16)}h');
      results.add(result);
    } else {
      warning('FAILED to find ${signature.name} !');
    }
  }

  var fmter = getFormatterByName(args['format']);

  var filename = config.appname;
  if (args['versioned'] as bool) {
    filename += '_${config.version}';
  }

  filename = fmter.dump(
      config.author, config.version, config.appname, filename, results);
  info('File generated successfully => $filename');

  pe.dispose();
}
