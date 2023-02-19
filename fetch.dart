import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:fun_with_kanji/models/kanji.dart';

void main() async {
  log('Open source file...');
  final sourceFile = File('kanji-jouyou.json');
  await sourceFile.open();
  log('Read as String...');
  final sourceKanji = await sourceFile.readAsString();
  log('Convert to JSON...');
  final sourceKanjiJson = jsonDecode(sourceKanji) as Map<String, dynamic>;
  final sourceKanjiKeysList = sourceKanjiJson.keys.toList();

  const level = 9;
  log('Convert Kanji for level $level...');
  const kanjiStringList =
      '迭添殿吐塗斗渡途奴怒倒凍唐塔悼搭桃棟盗痘筒到謄踏逃透陶騰闘洞胴峠匿督篤凸突屯豚曇鈍縄軟尼弐如尿妊忍寧猫粘悩濃把覇婆廃排杯輩培媒賠陪伯拍泊舶薄迫漠爆縛肌鉢髪伐罰抜閥伴帆搬畔繁般藩販範煩頒盤蛮卑妃彼扉披泌疲碑罷被避尾微匹姫漂描苗浜賓頻敏瓶怖扶敷普浮符腐膚譜賦赴附侮舞封伏幅覆払沸噴墳憤紛雰丙併塀幣弊柄壁癖偏遍舗捕穂募慕簿倣俸奉峰崩抱泡砲縫胞芳褒邦飽乏傍剖坊妨帽忙房某冒紡肪膨謀僕墨撲朴没堀奔翻凡盆摩磨魔麻埋膜又抹繭慢漫魅岬妙眠矛霧婿娘銘滅免茂妄猛盲網耗黙戻紋厄躍柳愉癒諭唯幽悠憂猶裕誘雄融与誉庸揚揺擁溶窯謡踊抑翼羅裸頼雷絡酪欄濫吏履痢離硫粒隆竜慮虜了僚寮涼猟療糧陵倫厘隣塁涙累励鈴隷零霊麗齢暦劣烈裂廉恋錬炉露廊楼浪漏郎賄惑枠湾腕';
  final kanjiList = kanjiStringList.split('');
  log('We got ${kanjiList.length} kanji');
  final outputKanjiList = kanjiList.map((kanji) {
    log('Procceed $kanji...');
    final json = sourceKanjiJson[kanji];
    json['id'] = sourceKanjiKeysList.indexOf(kanji);
    json['kanji'] = kanji;
    return Kanji.fromJson(sourceKanjiJson[kanji]);
  });

  log('Convert Kanji list to JSON...');
  final outputJsonList =
      jsonEncode(outputKanjiList.map((k) => k.toJson()).toList());

  log('Save output in file');
  final file = File('assets/data/kanji_$level.json');
  await file.open(mode: FileMode.writeOnly);
  await file.writeAsString(outputJsonList);
  log('Finished Level $level');
}
