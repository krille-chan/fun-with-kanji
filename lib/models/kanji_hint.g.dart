// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kanji_hint.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast

extension GetKanjiHintCollection on Isar {
  IsarCollection<KanjiHint> get kanjiHints {
    return getCollection('KanjiHint');
  }
}

final KanjiHintSchema = CollectionSchema(
  name: 'KanjiHint',
  schema:
      '{"name":"KanjiHint","idName":"id","properties":[{"name":"characterId","type":"Long"},{"name":"hint","type":"String"},{"name":"writingSystem","type":"String"}],"indexes":[],"links":[]}',
  nativeAdapter: const _KanjiHintNativeAdapter(),
  webAdapter: const _KanjiHintWebAdapter(),
  idName: 'id',
  propertyIds: {'characterId': 0, 'hint': 1, 'writingSystem': 2},
  listProperties: {},
  indexIds: {},
  indexTypes: {},
  linkIds: {},
  backlinkIds: {},
  linkedCollections: [],
  getId: (obj) {
    if (obj.id == Isar.autoIncrement) {
      return null;
    } else {
      return obj.id;
    }
  },
  setId: (obj, id) => obj.id = id,
  getLinks: (obj) => [],
  version: 2,
);

class _KanjiHintWebAdapter extends IsarWebTypeAdapter<KanjiHint> {
  const _KanjiHintWebAdapter();

  @override
  Object serialize(IsarCollection<KanjiHint> collection, KanjiHint object) {
    final jsObj = IsarNative.newJsObject();
    IsarNative.jsObjectSet(jsObj, 'characterId', object.characterId);
    IsarNative.jsObjectSet(jsObj, 'hint', object.hint);
    IsarNative.jsObjectSet(jsObj, 'id', object.id);
    IsarNative.jsObjectSet(jsObj, 'writingSystem', object.writingSystem);
    return jsObj;
  }

  @override
  KanjiHint deserialize(IsarCollection<KanjiHint> collection, dynamic jsObj) {
    final object = KanjiHint();
    object.characterId =
        IsarNative.jsObjectGet(jsObj, 'characterId') ?? double.negativeInfinity;
    object.hint = IsarNative.jsObjectGet(jsObj, 'hint') ?? '';
    object.id = IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity;
    object.writingSystem = IsarNative.jsObjectGet(jsObj, 'writingSystem') ?? '';
    return object;
  }

  @override
  P deserializeProperty<P>(Object jsObj, String propertyName) {
    switch (propertyName) {
      case 'characterId':
        return (IsarNative.jsObjectGet(jsObj, 'characterId') ??
            double.negativeInfinity) as P;
      case 'hint':
        return (IsarNative.jsObjectGet(jsObj, 'hint') ?? '') as P;
      case 'id':
        return (IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity)
            as P;
      case 'writingSystem':
        return (IsarNative.jsObjectGet(jsObj, 'writingSystem') ?? '') as P;
      default:
        throw 'Illegal propertyName';
    }
  }

  @override
  void attachLinks(Isar isar, int id, KanjiHint object) {}
}

class _KanjiHintNativeAdapter extends IsarNativeTypeAdapter<KanjiHint> {
  const _KanjiHintNativeAdapter();

  @override
  void serialize(IsarCollection<KanjiHint> collection, IsarRawObject rawObj,
      KanjiHint object, int staticSize, List<int> offsets, AdapterAlloc alloc) {
    var dynamicSize = 0;
    final value0 = object.characterId;
    final _characterId = value0;
    final value1 = object.hint;
    final _hint = IsarBinaryWriter.utf8Encoder.convert(value1);
    dynamicSize += (_hint.length) as int;
    final value2 = object.writingSystem;
    final _writingSystem = IsarBinaryWriter.utf8Encoder.convert(value2);
    dynamicSize += (_writingSystem.length) as int;
    final size = staticSize + dynamicSize;

    rawObj.buffer = alloc(size);
    rawObj.buffer_length = size;
    final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
    final writer = IsarBinaryWriter(buffer, staticSize);
    writer.writeLong(offsets[0], _characterId);
    writer.writeBytes(offsets[1], _hint);
    writer.writeBytes(offsets[2], _writingSystem);
  }

  @override
  KanjiHint deserialize(IsarCollection<KanjiHint> collection, int id,
      IsarBinaryReader reader, List<int> offsets) {
    final object = KanjiHint();
    object.characterId = reader.readLong(offsets[0]);
    object.hint = reader.readString(offsets[1]);
    object.id = id;
    object.writingSystem = reader.readString(offsets[2]);
    return object;
  }

  @override
  P deserializeProperty<P>(
      int id, IsarBinaryReader reader, int propertyIndex, int offset) {
    switch (propertyIndex) {
      case -1:
        return id as P;
      case 0:
        return (reader.readLong(offset)) as P;
      case 1:
        return (reader.readString(offset)) as P;
      case 2:
        return (reader.readString(offset)) as P;
      default:
        throw 'Illegal propertyIndex';
    }
  }

  @override
  void attachLinks(Isar isar, int id, KanjiHint object) {}
}

extension KanjiHintQueryWhereSort
    on QueryBuilder<KanjiHint, KanjiHint, QWhere> {
  QueryBuilder<KanjiHint, KanjiHint, QAfterWhere> anyId() {
    return addWhereClauseInternal(const WhereClause(indexName: null));
  }
}

extension KanjiHintQueryWhere
    on QueryBuilder<KanjiHint, KanjiHint, QWhereClause> {
  QueryBuilder<KanjiHint, KanjiHint, QAfterWhereClause> idEqualTo(int id) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      lower: [id],
      includeLower: true,
      upper: [id],
      includeUpper: true,
    ));
  }

  QueryBuilder<KanjiHint, KanjiHint, QAfterWhereClause> idNotEqualTo(int id) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(WhereClause(
        indexName: null,
        upper: [id],
        includeUpper: false,
      )).addWhereClauseInternal(WhereClause(
        indexName: null,
        lower: [id],
        includeLower: false,
      ));
    } else {
      return addWhereClauseInternal(WhereClause(
        indexName: null,
        lower: [id],
        includeLower: false,
      )).addWhereClauseInternal(WhereClause(
        indexName: null,
        upper: [id],
        includeUpper: false,
      ));
    }
  }

  QueryBuilder<KanjiHint, KanjiHint, QAfterWhereClause> idGreaterThan(
    int id, {
    bool include = false,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      lower: [id],
      includeLower: include,
    ));
  }

  QueryBuilder<KanjiHint, KanjiHint, QAfterWhereClause> idLessThan(
    int id, {
    bool include = false,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      upper: [id],
      includeUpper: include,
    ));
  }

  QueryBuilder<KanjiHint, KanjiHint, QAfterWhereClause> idBetween(
    int lowerId,
    int upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      lower: [lowerId],
      includeLower: includeLower,
      upper: [upperId],
      includeUpper: includeUpper,
    ));
  }
}

extension KanjiHintQueryFilter
    on QueryBuilder<KanjiHint, KanjiHint, QFilterCondition> {
  QueryBuilder<KanjiHint, KanjiHint, QAfterFilterCondition> characterIdEqualTo(
      int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'characterId',
      value: value,
    ));
  }

  QueryBuilder<KanjiHint, KanjiHint, QAfterFilterCondition>
      characterIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'characterId',
      value: value,
    ));
  }

  QueryBuilder<KanjiHint, KanjiHint, QAfterFilterCondition> characterIdLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'characterId',
      value: value,
    ));
  }

  QueryBuilder<KanjiHint, KanjiHint, QAfterFilterCondition> characterIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'characterId',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<KanjiHint, KanjiHint, QAfterFilterCondition> hintEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'hint',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<KanjiHint, KanjiHint, QAfterFilterCondition> hintGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'hint',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<KanjiHint, KanjiHint, QAfterFilterCondition> hintLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'hint',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<KanjiHint, KanjiHint, QAfterFilterCondition> hintBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'hint',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<KanjiHint, KanjiHint, QAfterFilterCondition> hintStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'hint',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<KanjiHint, KanjiHint, QAfterFilterCondition> hintEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'hint',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<KanjiHint, KanjiHint, QAfterFilterCondition> hintContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'hint',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<KanjiHint, KanjiHint, QAfterFilterCondition> hintMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'hint',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<KanjiHint, KanjiHint, QAfterFilterCondition> idEqualTo(
      int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<KanjiHint, KanjiHint, QAfterFilterCondition> idGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<KanjiHint, KanjiHint, QAfterFilterCondition> idLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<KanjiHint, KanjiHint, QAfterFilterCondition> idBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'id',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<KanjiHint, KanjiHint, QAfterFilterCondition>
      writingSystemEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'writingSystem',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<KanjiHint, KanjiHint, QAfterFilterCondition>
      writingSystemGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'writingSystem',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<KanjiHint, KanjiHint, QAfterFilterCondition>
      writingSystemLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'writingSystem',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<KanjiHint, KanjiHint, QAfterFilterCondition>
      writingSystemBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'writingSystem',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<KanjiHint, KanjiHint, QAfterFilterCondition>
      writingSystemStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'writingSystem',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<KanjiHint, KanjiHint, QAfterFilterCondition>
      writingSystemEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'writingSystem',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<KanjiHint, KanjiHint, QAfterFilterCondition>
      writingSystemContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'writingSystem',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<KanjiHint, KanjiHint, QAfterFilterCondition>
      writingSystemMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'writingSystem',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }
}

extension KanjiHintQueryLinks
    on QueryBuilder<KanjiHint, KanjiHint, QFilterCondition> {}

extension KanjiHintQueryWhereSortBy
    on QueryBuilder<KanjiHint, KanjiHint, QSortBy> {
  QueryBuilder<KanjiHint, KanjiHint, QAfterSortBy> sortByCharacterId() {
    return addSortByInternal('characterId', Sort.asc);
  }

  QueryBuilder<KanjiHint, KanjiHint, QAfterSortBy> sortByCharacterIdDesc() {
    return addSortByInternal('characterId', Sort.desc);
  }

  QueryBuilder<KanjiHint, KanjiHint, QAfterSortBy> sortByHint() {
    return addSortByInternal('hint', Sort.asc);
  }

  QueryBuilder<KanjiHint, KanjiHint, QAfterSortBy> sortByHintDesc() {
    return addSortByInternal('hint', Sort.desc);
  }

  QueryBuilder<KanjiHint, KanjiHint, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<KanjiHint, KanjiHint, QAfterSortBy> sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<KanjiHint, KanjiHint, QAfterSortBy> sortByWritingSystem() {
    return addSortByInternal('writingSystem', Sort.asc);
  }

  QueryBuilder<KanjiHint, KanjiHint, QAfterSortBy> sortByWritingSystemDesc() {
    return addSortByInternal('writingSystem', Sort.desc);
  }
}

extension KanjiHintQueryWhereSortThenBy
    on QueryBuilder<KanjiHint, KanjiHint, QSortThenBy> {
  QueryBuilder<KanjiHint, KanjiHint, QAfterSortBy> thenByCharacterId() {
    return addSortByInternal('characterId', Sort.asc);
  }

  QueryBuilder<KanjiHint, KanjiHint, QAfterSortBy> thenByCharacterIdDesc() {
    return addSortByInternal('characterId', Sort.desc);
  }

  QueryBuilder<KanjiHint, KanjiHint, QAfterSortBy> thenByHint() {
    return addSortByInternal('hint', Sort.asc);
  }

  QueryBuilder<KanjiHint, KanjiHint, QAfterSortBy> thenByHintDesc() {
    return addSortByInternal('hint', Sort.desc);
  }

  QueryBuilder<KanjiHint, KanjiHint, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<KanjiHint, KanjiHint, QAfterSortBy> thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<KanjiHint, KanjiHint, QAfterSortBy> thenByWritingSystem() {
    return addSortByInternal('writingSystem', Sort.asc);
  }

  QueryBuilder<KanjiHint, KanjiHint, QAfterSortBy> thenByWritingSystemDesc() {
    return addSortByInternal('writingSystem', Sort.desc);
  }
}

extension KanjiHintQueryWhereDistinct
    on QueryBuilder<KanjiHint, KanjiHint, QDistinct> {
  QueryBuilder<KanjiHint, KanjiHint, QDistinct> distinctByCharacterId() {
    return addDistinctByInternal('characterId');
  }

  QueryBuilder<KanjiHint, KanjiHint, QDistinct> distinctByHint(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('hint', caseSensitive: caseSensitive);
  }

  QueryBuilder<KanjiHint, KanjiHint, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<KanjiHint, KanjiHint, QDistinct> distinctByWritingSystem(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('writingSystem', caseSensitive: caseSensitive);
  }
}

extension KanjiHintQueryProperty
    on QueryBuilder<KanjiHint, KanjiHint, QQueryProperty> {
  QueryBuilder<KanjiHint, int, QQueryOperations> characterIdProperty() {
    return addPropertyNameInternal('characterId');
  }

  QueryBuilder<KanjiHint, String, QQueryOperations> hintProperty() {
    return addPropertyNameInternal('hint');
  }

  QueryBuilder<KanjiHint, int, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<KanjiHint, String, QQueryOperations> writingSystemProperty() {
    return addPropertyNameInternal('writingSystem');
  }
}
