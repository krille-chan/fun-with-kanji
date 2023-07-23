import 'package:collection/collection.dart';

import 'package:fun_with_kanji/models/kana.dart';
import 'package:fun_with_kanji/models/kanji.dart';
import 'package:fun_with_kanji/models/radical.dart';

abstract class JpCharacter {
  const JpCharacter();

  @override
  String toString() {
    if (this is Kana) {
      return (this as Kana).kana;
    }
    if (this is Radical) {
      return (this as Radical).radical;
    }
    if (this is Kanji) {
      return (this as Kanji).kanji;
    }
    return super.toString();
  }

  String toTtsString() {
    if (this is Kana) {
      return (this as Kana).kana;
    }
    if (this is Radical) {
      return (this as Radical).reading;
    }
    if (this is Kanji) {
      final kanji = this as Kanji;
      final firstOnSplitted = kanji.readingsOn.firstOrNull?.split('.');
      final firstKunSplitted = kanji.readingsKun.firstOrNull?.split('.');
      firstOnSplitted?[0] = kanji.kanji;
      firstKunSplitted?[0] = kanji.kanji;
      return [
        firstOnSplitted?.join(''),
        firstKunSplitted?.join(''),
      ].where((s) => s != null).join(', ');
    }
    return super.toString();
  }

  String get description {
    if (this is Kana) {
      return (this as Kana).roumaji;
    }
    if (this is Radical) {
      return (this as Radical).name;
    }
    if (this is Kanji) {
      return (this as Kanji).meanings.first;
    }
    return super.toString();
  }

  Set<String> get correctAnswers {
    if (this is Kana) {
      return {(this as Kana).roumaji};
    }
    if (this is Radical) {
      return (this as Radical)
          .name
          .split(', ')
          .map((s) => s.trim().toLowerCase())
          .toSet();
    }
    if (this is Kanji) {
      return (this as Kanji)
          .meanings
          .map((s) => s.trim().toLowerCase())
          .toSet();
    }
    return {toString()};
  }
}
