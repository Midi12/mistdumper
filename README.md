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