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
}
