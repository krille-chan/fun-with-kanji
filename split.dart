// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';

void main() async {
  const filename = 'radicals_de';
  final file = File('assets/data/$filename.json');
  print('Load file...');
  final data = await file.readAsString();
  print('Convert to json...');
  final json = jsonDecode(data) as List;
  print('Entries: ${json.length}');
  final halfCount = (json.length / 2).round();
  final firstHalfJson = json.getRange(0, halfCount).toList();
  final secondHalfJson = json.getRange(halfCount, json.length).toList();
  print('Encount first half...');
  final firstHalfStr = jsonEncode(firstHalfJson);
  print('Encount second half...');
  final secondHalfStr = jsonEncode(secondHalfJson);
  print('Save first half...');
  await File('assets/data/${filename}_1.json').writeAsString(firstHalfStr);
  print('Save second half...');
  await File('assets/data/${filename}_2.json').writeAsString(secondHalfStr);
  print('Delete old file...');
  await file.delete();
  print('Finished!');
}
