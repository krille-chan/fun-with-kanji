// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'learning_progress.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_variable

extension GetLearningProgressCollection on Isar {
  IsarCollection<LearningProgress> get learningProgresss => getCollection();
}

const LearningProgressSchema = CollectionSchema(
  name: 'LearningProgress',
  schema:
      '{"name":"LearningProgress","idName":"id","properties":[{"name":"characterId","type":"Long"},{"name":"stars","type":"Long"},{"name":"writingSystem","type":"String"}],"indexes":[],"links":[]}',
  idName: 'id',
  propertyIds: {'characterId': 0, 'stars': 1, 'writingSystem': 2},
  listProperties: {},
  indexIds: {},
  indexValueTypes: {},
  linkIds: {},
  backlinkLinkNames: {},
  getId: _learningProgressGetId,
  setId: _learningProgressSetId,
  getLinks: _learningProgressGetLinks,
  attachLinks: _learningProgressAttachLinks,
  serializeNative: _learningProgressSerializeNative,
  deserializeNative: _learningProgressDeserializeNative,
  deserializePropNative: _learningProgressDeserializePropNative,
  serializeWeb: _learningProgressSerializeWeb,
  deserializeWeb: _learningProgressDeserializeWeb,
  deserializePropWeb: _learningProgressDeserializePropWeb,
  version: 3,
);

int? _learningProgressGetId(LearningProgress object) {
  if (object.id == Isar.autoIncrement) {
    return null;
  } else {
    return object.id;
  }
}

void _learningProgressSetId(LearningProgress object, int id) {
  object.id = id;
}

List<IsarLinkBase> _learningProgressGetLinks(LearningProgress object) {
  return [];
}

void _learningProgressSerializeNative(
    IsarCollection<LearningProgress> collection,
    IsarRawObject rawObj,
    LearningProgress object,
    int staticSize,
    List<int> offsets,
    AdapterAlloc alloc) {
  var dynamicSize = 0;
  final value0 = object.characterId;
  final _characterId = value0;
  final value1 = object.stars;
  final _stars = value1;
  final value2 = object.writingSystem;
  final _writingSystem = IsarBinaryWriter.utf8Encoder.convert(value2);
  dynamicSize += (_writingSystem.length) as int;
  final size = staticSize + dynamicSize;

  rawObj.buffer = alloc(size);
  rawObj.buffer_length = size;
  final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeLong(offsets[0], _characterId);
  writer.writeLong(offsets[1], _stars);
  writer.writeBytes(offsets[2], _writingSystem);
}

LearningProgress _learningProgressDeserializeNative(
    IsarCollection<LearningProgress> collection,
    int id,
    IsarBinaryReader reader,
    List<int> offsets) {
  final object = LearningProgress();
  object.characterId = reader.readLong(offsets[0]);
  object.id = id;
  object.stars = reader.readLong(offsets[1]);
  object.writingSystem = reader.readString(offsets[2]);
  return object;
}

P _learningProgressDeserializePropNative<P>(
    int id, IsarBinaryReader reader, int propertyIndex, int offset) {
  switch (propertyIndex) {
    case -1:
      return id as P;
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    default:
      throw 'Illegal propertyIndex';
  }
}

dynamic _learningProgressSerializeWeb(
    IsarCollection<LearningProgress> collection, LearningProgress object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, 'characterId', object.characterId);
  IsarNative.jsObjectSet(jsObj, 'id', object.id);
  IsarNative.jsObjectSet(jsObj, 'stars', object.stars);
  IsarNative.jsObjectSet(jsObj, 'writingSystem', object.writingSystem);
  return jsObj;
}

LearningProgress _learningProgressDeserializeWeb(
    IsarCollection<LearningProgress> collection, dynamic jsObj) {
  final object = LearningProgress();
  object.characterId =
      IsarNative.jsObjectGet(jsObj, 'characterId') ?? double.negativeInfinity;
  object.id = IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity;
  object.stars =
      IsarNative.jsObjectGet(jsObj, 'stars') ?? double.negativeInfinity;
  object.writingSystem = IsarNative.jsObjectGet(jsObj, 'writingSystem') ?? '';
  return object;
}

P _learningProgressDeserializePropWeb<P>(Object jsObj, String propertyName) {
  switch (propertyName) {
    case 'characterId':
      return (IsarNative.jsObjectGet(jsObj, 'characterId') ??
          double.negativeInfinity) as P;
    case 'id':
      return (IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity)
          as P;
    case 'stars':
      return (IsarNative.jsObjectGet(jsObj, 'stars') ?? double.negativeInfinity)
          as P;
    case 'writingSystem':
      return (IsarNative.jsObjectGet(jsObj, 'writingSystem') ?? '') as P;
    default:
      throw 'Illegal propertyName';
  }
}

void _learningProgressAttachLinks(
    IsarCollection col, int id, LearningProgress object) {}

extension LearningProgressQueryWhereSort
    on QueryBuilder<LearningProgress, LearningProgress, QWhere> {
  QueryBuilder<LearningProgress, LearningProgress, QAfterWhere> anyId() {
    return addWhereClauseInternal(const IdWhereClause.any());
  }
}

extension LearningProgressQueryWhere
    on QueryBuilder<LearningProgress, LearningProgress, QWhereClause> {
  QueryBuilder<LearningProgress, LearningProgress, QAfterWhereClause> idEqualTo(
      int id) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: id,
      includeLower: true,
      upper: id,
      includeUpper: true,
    ));
  }

  QueryBuilder<LearningProgress, LearningProgress, QAfterWhereClause>
      idNotEqualTo(int id) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(
        IdWhereClause.lessThan(upper: id, includeUpper: false),
      ).addWhereClauseInternal(
        IdWhereClause.greaterThan(lower: id, includeLower: false),
      );
    } else {
      return addWhereClauseInternal(
        IdWhereClause.greaterThan(lower: id, includeLower: false),
      ).addWhereClauseInternal(
        IdWhereClause.lessThan(upper: id, includeUpper: false),
      );
    }
  }

  QueryBuilder<LearningProgress, LearningProgress, QAfterWhereClause>
      idGreaterThan(int id, {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.greaterThan(lower: id, includeLower: include),
    );
  }

  QueryBuilder<LearningProgress, LearningProgress, QAfterWhereClause>
      idLessThan(int id, {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.lessThan(upper: id, includeUpper: include),
    );
  }

  QueryBuilder<LearningProgress, LearningProgress, QAfterWhereClause> idBetween(
    int lowerId,
    int upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: lowerId,
      includeLower: includeLower,
      upper: upperId,
      includeUpper: includeUpper,
    ));
  }
}

extension LearningProgressQueryFilter
    on QueryBuilder<LearningProgress, LearningProgress, QFilterCondition> {
  QueryBuilder<LearningProgress, LearningProgress, QAfterFilterCondition>
      characterIdEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'characterId',
      value: value,
    ));
  }

  QueryBuilder<LearningProgress, LearningProgress, QAfterFilterCondition>
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

  QueryBuilder<LearningProgress, LearningProgress, QAfterFilterCondition>
      characterIdLessThan(
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

  QueryBuilder<LearningProgress, LearningProgress, QAfterFilterCondition>
      characterIdBetween(
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

  QueryBuilder<LearningProgress, LearningProgress, QAfterFilterCondition>
      idEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<LearningProgress, LearningProgress, QAfterFilterCondition>
      idGreaterThan(
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

  QueryBuilder<LearningProgress, LearningProgress, QAfterFilterCondition>
      idLessThan(
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

  QueryBuilder<LearningProgress, LearningProgress, QAfterFilterCondition>
      idBetween(
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

  QueryBuilder<LearningProgress, LearningProgress, QAfterFilterCondition>
      starsEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'stars',
      value: value,
    ));
  }

  QueryBuilder<LearningProgress, LearningProgress, QAfterFilterCondition>
      starsGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'stars',
      value: value,
    ));
  }

  QueryBuilder<LearningProgress, LearningProgress, QAfterFilterCondition>
      starsLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'stars',
      value: value,
    ));
  }

  QueryBuilder<LearningProgress, LearningProgress, QAfterFilterCondition>
      starsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'stars',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<LearningProgress, LearningProgress, QAfterFilterCondition>
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

  QueryBuilder<LearningProgress, LearningProgress, QAfterFilterCondition>
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

  QueryBuilder<LearningProgress, LearningProgress, QAfterFilterCondition>
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

  QueryBuilder<LearningProgress, LearningProgress, QAfterFilterCondition>
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

  QueryBuilder<LearningProgress, LearningProgress, QAfterFilterCondition>
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

  QueryBuilder<LearningProgress, LearningProgress, QAfterFilterCondition>
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

  QueryBuilder<LearningProgress, LearningProgress, QAfterFilterCondition>
      writingSystemContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'writingSystem',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<LearningProgress, LearningProgress, QAfterFilterCondition>
      writingSystemMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'writingSystem',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }
}

extension LearningProgressQueryLinks
    on QueryBuilder<LearningProgress, LearningProgress, QFilterCondition> {}

extension LearningProgressQueryWhereSortBy
    on QueryBuilder<LearningProgress, LearningProgress, QSortBy> {
  QueryBuilder<LearningProgress, LearningProgress, QAfterSortBy>
      sortByCharacterId() {
    return addSortByInternal('characterId', Sort.asc);
  }

  QueryBuilder<LearningProgress, LearningProgress, QAfterSortBy>
      sortByCharacterIdDesc() {
    return addSortByInternal('characterId', Sort.desc);
  }

  QueryBuilder<LearningProgress, LearningProgress, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<LearningProgress, LearningProgress, QAfterSortBy>
      sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<LearningProgress, LearningProgress, QAfterSortBy> sortByStars() {
    return addSortByInternal('stars', Sort.asc);
  }

  QueryBuilder<LearningProgress, LearningProgress, QAfterSortBy>
      sortByStarsDesc() {
    return addSortByInternal('stars', Sort.desc);
  }

  QueryBuilder<LearningProgress, LearningProgress, QAfterSortBy>
      sortByWritingSystem() {
    return addSortByInternal('writingSystem', Sort.asc);
  }

  QueryBuilder<LearningProgress, LearningProgress, QAfterSortBy>
      sortByWritingSystemDesc() {
    return addSortByInternal('writingSystem', Sort.desc);
  }
}

extension LearningProgressQueryWhereSortThenBy
    on QueryBuilder<LearningProgress, LearningProgress, QSortThenBy> {
  QueryBuilder<LearningProgress, LearningProgress, QAfterSortBy>
      thenByCharacterId() {
    return addSortByInternal('characterId', Sort.asc);
  }

  QueryBuilder<LearningProgress, LearningProgress, QAfterSortBy>
      thenByCharacterIdDesc() {
    return addSortByInternal('characterId', Sort.desc);
  }

  QueryBuilder<LearningProgress, LearningProgress, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<LearningProgress, LearningProgress, QAfterSortBy>
      thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<LearningProgress, LearningProgress, QAfterSortBy> thenByStars() {
    return addSortByInternal('stars', Sort.asc);
  }

  QueryBuilder<LearningProgress, LearningProgress, QAfterSortBy>
      thenByStarsDesc() {
    return addSortByInternal('stars', Sort.desc);
  }

  QueryBuilder<LearningProgress, LearningProgress, QAfterSortBy>
      thenByWritingSystem() {
    return addSortByInternal('writingSystem', Sort.asc);
  }

  QueryBuilder<LearningProgress, LearningProgress, QAfterSortBy>
      thenByWritingSystemDesc() {
    return addSortByInternal('writingSystem', Sort.desc);
  }
}

extension LearningProgressQueryWhereDistinct
    on QueryBuilder<LearningProgress, LearningProgress, QDistinct> {
  QueryBuilder<LearningProgress, LearningProgress, QDistinct>
      distinctByCharacterId() {
    return addDistinctByInternal('characterId');
  }

  QueryBuilder<LearningProgress, LearningProgress, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<LearningProgress, LearningProgress, QDistinct>
      distinctByStars() {
    return addDistinctByInternal('stars');
  }

  QueryBuilder<LearningProgress, LearningProgress, QDistinct>
      distinctByWritingSystem({bool caseSensitive = true}) {
    return addDistinctByInternal('writingSystem', caseSensitive: caseSensitive);
  }
}

extension LearningProgressQueryProperty
    on QueryBuilder<LearningProgress, LearningProgress, QQueryProperty> {
  QueryBuilder<LearningProgress, int, QQueryOperations> characterIdProperty() {
    return addPropertyNameInternal('characterId');
  }

  QueryBuilder<LearningProgress, int, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<LearningProgress, int, QQueryOperations> starsProperty() {
    return addPropertyNameInternal('stars');
  }

  QueryBuilder<LearningProgress, String, QQueryOperations>
      writingSystemProperty() {
    return addPropertyNameInternal('writingSystem');
  }
}
