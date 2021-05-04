# mistdumper

A configurable pattern finder for static analysis written in Dart

This project has been inspired by [hazedumper](https://github.com/frk1/hazedumper-rs) which is a runtime signature finder.

## Usage
`mistdumper.exe [options] <executablePath>`

options :
```
-c, --config=<path> (mandatory)      Path of the config file
-f, --format=<format> (mandatory)    The output format
executablePath                       Path of the executable to parse
```

## Formatters

Mistdumper can format to multiple output formats.

Currently implemented output formats are :
* Dart
* C++
* CSharp

## JSON configuration

Full structure :
```json
{
  "name": "ExampleGame Signature List",
  "game_name": "ExampleGame",
  "version": "0.0.0.1",
  "author": "Midi12",
  "signatures" : [
    {
      "name": "s_globalPtr",
      "relative": true,
      "dereference": false,
      "dereference_size": 0,
      "offset": 3,
      "pattern": "DE AD BE ?? ?? ?? ?? EF DE AD C0 DE ?? ?? ?? ??",
      "namespace": "Statics"
    }
  ]
}
```

* name : mandatory
* pattern : mandatory
* namespace : mandatory
* dereference : optional (default value : `false`)
* dereference_size : optional (default value : `0`)
* relative : optional (default value : `false`)
* offset : optional (default value : `0`)

## Example outputs

Dart :
```dart
class Signatures {
	static const int dwGameOffset1 = 0x4174;
}
```

C++ :
```cpp
#pragma once
#include <cstdint>

namespace Signatures {
	constexpr ::std::ptrdiff_t dwGameOffset1 = 0x4174;
}
```

CSharp :
```csharp
using System;

namespace Signatures
{
	public static class Signatures
	{
		public static readonly int dwGameOffset1 = 0x4174;
	}
}
```