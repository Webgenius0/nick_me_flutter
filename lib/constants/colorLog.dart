// ignore_for_file: file_names

import 'dart:developer';

void colorLog(String message, {String color = 'blue'}) {
  const colorCodes = {
    'red': '\x1B[31m',
    'green': '\x1B[32m',
    'yellow': '\x1B[33m',
    'blue': '\x1B[34m',
    'magenta': '\x1B[35m',
    'cyan': '\x1B[36m',
    'white': '\x1B[37m',
    'reset': '\x1B[0m',
  };

  final selectedColor = colorCodes[color] ?? colorCodes['reset'];

  // Log message with colors
  log('$selectedColor$message${colorCodes['reset']}');
}
