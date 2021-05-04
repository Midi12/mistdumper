import 'package:ansicolor/ansicolor.dart';

AnsiPen pen_msg = AnsiPen()..cyan();
void message(String str) => print(pen_msg(str));

AnsiPen pen_info = AnsiPen()..green();
void info(String str) => print(pen_info(str));

AnsiPen pen_warn = AnsiPen()..yellow();
void warning(String str) => print(pen_warn(str));

AnsiPen pen_err = AnsiPen()..red();
void error(String str) => print(pen_err(str));

AnsiPen pen_fatal = AnsiPen()..red(bold: true);
void fatal(String str) => print(pen_fatal(str));
