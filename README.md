# mistdumper

A configurable pattern finder for static analysis written in Dart.

It is meant to retrieve offsets from file on disk without running them.

This project has been inspired by [hazedumper](https://github.com/frk1/hazedumper-rs) which is a runtime signature finder.

## Usage
`mistdumper.exe [options] <executablePath>`

options :
```
-c, --config=<path> (mandatory)      Path of the config file
-f, --format=<format> (mandatory)    The output format
    --[no-]versioned                 Should the version be appended to file name
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
  "name": "ExampleApp Signature List",
  "appname": "ExampleApp",
  "version": "0.0.0.1",
  "author": "Midi12",
  "signatures" : [
    {
      "name": "s_globalPtr",
      "relative": true,
      "dereference": false,
      "dereference_size": 0,
      "offset": 3,
      "extra": 12,
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
* dereference_size : optional (default value : `4`)
* relative : optional (default value : `false`)
* offset : optional (default value : `0`)
* extra : optional (default value : `0`)

Full example of JSON configuration:
```json
{
  "name": "ExampleApp Signature List",
  "appname": "ExampleApp",
  "version": "0.0.0.1",
  "author": "Midi12",
  "signatures" : [
    {
      "name": "s_globalPtr",
      "relative": true,
      "offset": 3,
      "pattern": "DE AD BE ?? ?? ?? ?? EF DE AD C0 DE ?? ?? ?? ??",
      "namespace": "Statics"
    },
    {
      "name": "s_globalPtr__pOffset",
      "dereference": true,
      "dereference_size": 4,
      "offset": 8,
      "pattern": "DE AD BE ?? ?? ?? ?? EF DE AD C0 DE ?? ?? ?? ??",
      "namespace": "Offsets"
    },
    {
      "name": "ExampleFunction",
      "extra": 12,
      "pattern": "DE AD BE ?? ?? ?? ?? EF DE AD C0 DE ?? ?? ?? ??",
      "namespace": "Functions"
    }
  ]
}
```

## Example outputs

Dart :
```dart
library mistdumper;


	class Functions {
		static const int ExampleFunction = 0xdeadc0de;
	}
	class Offsets {
		static const int s_globalPtr__pOffset = 0xc0ffee;
	}
	class Statics {
		static const int s_globalPtr = 0xdeadbeef;
	}

```

C++ :
```cpp
#pragma once
#include <cstdint>

namespace mistdumper {

	namespace Functions {
			constexpr ptrdiff_t ExampleFunction = 0xdeadc0de;
	}
	namespace Offsets {
			constexpr ptrdiff_t s_globalPtr__pOffset = 0xc0ffee;
	}
	namespace Statics {
			constexpr ptrdiff_t s_globalPtr = 0xdeadbeef;
	}

}
```

CSharp :
```csharp
using System;

namespace MistDumper
{

	public static class Functions {
			public static readonly UIntPtr ExampleFunction = 0xdeadc0de;
	}
	public static class Offsets {
			public static readonly UIntPtr s_globalPtr__pOffset = 0xc0ffee;
	}
	public static class Statics {
			public static readonly UIntPtr s_globalPtr = 0xdeadbeef;
	}

}
```