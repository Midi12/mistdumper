# mistdumper

A static signature finder for PE executable

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
	public static readonly UIntPtr dwGameOffset1 = 0x4174;
}
```