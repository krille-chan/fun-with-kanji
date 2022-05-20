# Fun With Kanji

Simple Flutter app to learn Japanese writing systems Hiragana, Katakana and Kanji.

With Fun With Kanji you are able to learn **all** common used Japanese characters. All starts with Hiragana, Katakana and their special cases and combinations. After this you learn the Kanji Radicals and then you are ready to start with the 2136 Jōyō-Kanji. You no longer need 4 different apps to learn them!

The app also contains a dictionary and a full-text search over all characters.

Fun With Kanji is open source under Mozilla Public License 2.0. Contributions and new translations are always welcome <3.

## Screenshots:

<p float="left">
  <img src="assets/screenshots/Simulator Screen Shot - iPhone 13 Pro - 2022-05-20 at 10.39.58.png" width="128" />
  <img src="assets/screenshots/Simulator Screen Shot - iPhone 13 Pro - 2022-05-20 at 10.40.09.png" width="128" /> 
  <img src="assets/screenshots/Simulator Screen Shot - iPhone 13 Pro - 2022-05-20 at 10.39.35.png" width="128" />
  <img src="assets/screenshots/Simulator Screen Shot - iPhone 13 Pro - 2022-05-20 at 10.40.18.png" width="128" />
  <img src="assets/screenshots/Simulator Screen Shot - iPhone 13 Pro - 2022-05-20 at 10.39.19.png" width="128" />
  <img src="assets/screenshots/Simulator Screen Shot - iPhone 13 Pro - 2022-05-20 at 10.40.04.png" width="128" />
</p>



## Install:

- [Latest APK from CI](https://gitlab.com/krillefear/funny-kanji/-/jobs/artifacts/main/browse?job=build_apk)

## Build:

Install [Flutter](https://flutter.dev) and run with:

```sh
flutter run
```

## Translate Kanji into more languages:

Import `translator` package and run this script:

```dart
import 'dart:io';

import 'package:translator/translator.dart';

void main() async {
  const language = 'de';
  for (var i = 1; i <= 8; i++) {
    print('Load Kanji Level $i');
    final radicalsFile = File('assets/data/kanji_level_$i.json');
    final radicals = jsonDecode(radicalsFile.readAsStringSync()) as List;

    final translator = GoogleTranslator();
    for (final radical in radicals) {
      final input = radical['meanings'].join(', ');
      print('Translate: ${radical['kanji']} (ID: ${radical['id']}) $input ...');
      try {
        final translated =
            await translator.translate(input, from: 'en', to: language);
        radical['meanings'] = translated.text.split(', ');
      } catch (e, s) {
        print('Translation failed! Stop here!');
        print(e);
        print(s);
        break;
      }
    }

    print('Write to output file...');
    final outputFile = File('assets/data/kanji_level_${i}_${language}.json');
    await outputFile.writeAsString(jsonEncode(radicals));
    print('Finished!');
  }
}
```