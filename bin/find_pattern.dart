import 'dart:typed_data';

import 'package:pefile/pefile.dart' as pefile;

import 'signature.dart';
import 'simple_console.dart';

class FindPatternResult {
  final String name;
  final int offset;

  FindPatternResult(this.name, this.offset);
}

const int wildcard = 0xCC;
class Pattern {
  late Uint8List _data;

  Pattern(String pattern) {
    var elems = pattern.split(' ');
    _data = Uint8List(elems.length);

    var i = 0;
    for (var elem in elems) {
      _data[i++] = elem.contains('?') ? wildcard : int.parse(elem, radix: 16);
    }
  }

  Uint8List get data => _data;
  int get length => _data.length;
}

FindPatternResult? findPattern(pefile.PeFileBase pe, Signature signature, { int sectionCharacteristics = pefile.IMAGE_SCN_CNT_CODE | pefile.IMAGE_SCN_MEM_EXECUTE }) {
  FindPatternResult? result;

  var pattern = Pattern(signature.pattern);

  var sections = pe.sections.where((section) => (section.characteristics & sectionCharacteristics) == sectionCharacteristics).toList();
  for (var section in sections) {
    var data = pe.getSectionData(section);

    // find pattern implementation
    for (var i = 0; i < data.length; i++) {
      // short circuit if first data byte is not equal to first pattern byte
      if (pattern.data[0] == wildcard || pattern.data[0] == data[i]) {
        // pick a part of data corresponding to our pattern to compare to our pattern
        var sublist = data.sublist(i, i + pattern.length);
        if (sublist.asMap().every((index, value) =>  pattern.data[index] == wildcard || pattern.data[index] == value)) {
          // not using pe.fileOffsetToRva because we the buffer we are using is only containing the section bytes and not the whole file
          var address = 0;
          if (signature.relative) {
            var offset = i + signature.offset;
            if (offset + 4 > data.length) {
              throw Exception('relative addressing out of bounds');
            }

            var rel = data.buffer.asByteData().getUint32(offset, Endian.little);
            address = offset + 4 + rel + section.virtual_address;
          } else {
            address = i + section.virtual_address + signature.offset;
          }
  
          result = FindPatternResult(signature.name, address);
          break;
        }
      }
    }

    if (result != null) {
      message('FOUND ${result.name} => ${result.offset.toRadixString(16)}h');
      break;
    }
  }

  if (result == null) {
    warning('FAILED to find ${signature.name} !');
  }

  return result;
}

extension Every<K, V> on Map<K, V> {
  bool every(bool Function(K key, V value) test) {
    for (var element in entries) {
      if (!test(element.key, element.value)) return false;
    }
    return true;
  }
}