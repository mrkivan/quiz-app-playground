// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz_set_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

QuizSetData _$QuizSetDataFromJson(Map<String, dynamic> json) {
  return _QuizSetData.fromJson(json);
}

/// @nodoc
mixin _$QuizSetData {
  int get total => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get topic => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  int get sectionId => throw _privateConstructorUsedError;
  List<QuizSetItem> get sections => throw _privateConstructorUsedError;

  /// Serializes this QuizSetData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of QuizSetData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QuizSetDataCopyWith<QuizSetData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizSetDataCopyWith<$Res> {
  factory $QuizSetDataCopyWith(
    QuizSetData value,
    $Res Function(QuizSetData) then,
  ) = _$QuizSetDataCopyWithImpl<$Res, QuizSetData>;
  @useResult
  $Res call({
    int total,
    String title,
    String topic,
    String description,
    int sectionId,
    List<QuizSetItem> sections,
  });
}

/// @nodoc
class _$QuizSetDataCopyWithImpl<$Res, $Val extends QuizSetData>
    implements $QuizSetDataCopyWith<$Res> {
  _$QuizSetDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QuizSetData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
    Object? title = null,
    Object? topic = null,
    Object? description = null,
    Object? sectionId = null,
    Object? sections = null,
  }) {
    return _then(
      _value.copyWith(
            total:
                null == total
                    ? _value.total
                    : total // ignore: cast_nullable_to_non_nullable
                        as int,
            title:
                null == title
                    ? _value.title
                    : title // ignore: cast_nullable_to_non_nullable
                        as String,
            topic:
                null == topic
                    ? _value.topic
                    : topic // ignore: cast_nullable_to_non_nullable
                        as String,
            description:
                null == description
                    ? _value.description
                    : description // ignore: cast_nullable_to_non_nullable
                        as String,
            sectionId:
                null == sectionId
                    ? _value.sectionId
                    : sectionId // ignore: cast_nullable_to_non_nullable
                        as int,
            sections:
                null == sections
                    ? _value.sections
                    : sections // ignore: cast_nullable_to_non_nullable
                        as List<QuizSetItem>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$QuizSetDataImplCopyWith<$Res>
    implements $QuizSetDataCopyWith<$Res> {
  factory _$$QuizSetDataImplCopyWith(
    _$QuizSetDataImpl value,
    $Res Function(_$QuizSetDataImpl) then,
  ) = __$$QuizSetDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int total,
    String title,
    String topic,
    String description,
    int sectionId,
    List<QuizSetItem> sections,
  });
}

/// @nodoc
class __$$QuizSetDataImplCopyWithImpl<$Res>
    extends _$QuizSetDataCopyWithImpl<$Res, _$QuizSetDataImpl>
    implements _$$QuizSetDataImplCopyWith<$Res> {
  __$$QuizSetDataImplCopyWithImpl(
    _$QuizSetDataImpl _value,
    $Res Function(_$QuizSetDataImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of QuizSetData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
    Object? title = null,
    Object? topic = null,
    Object? description = null,
    Object? sectionId = null,
    Object? sections = null,
  }) {
    return _then(
      _$QuizSetDataImpl(
        total:
            null == total
                ? _value.total
                : total // ignore: cast_nullable_to_non_nullable
                    as int,
        title:
            null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                    as String,
        topic:
            null == topic
                ? _value.topic
                : topic // ignore: cast_nullable_to_non_nullable
                    as String,
        description:
            null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                    as String,
        sectionId:
            null == sectionId
                ? _value.sectionId
                : sectionId // ignore: cast_nullable_to_non_nullable
                    as int,
        sections:
            null == sections
                ? _value._sections
                : sections // ignore: cast_nullable_to_non_nullable
                    as List<QuizSetItem>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$QuizSetDataImpl implements _QuizSetData {
  const _$QuizSetDataImpl({
    required this.total,
    required this.title,
    required this.topic,
    required this.description,
    required this.sectionId,
    required final List<QuizSetItem> sections,
  }) : _sections = sections;

  factory _$QuizSetDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuizSetDataImplFromJson(json);

  @override
  final int total;
  @override
  final String title;
  @override
  final String topic;
  @override
  final String description;
  @override
  final int sectionId;
  final List<QuizSetItem> _sections;
  @override
  List<QuizSetItem> get sections {
    if (_sections is EqualUnmodifiableListView) return _sections;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sections);
  }

  @override
  String toString() {
    return 'QuizSetData(total: $total, title: $title, topic: $topic, description: $description, sectionId: $sectionId, sections: $sections)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuizSetDataImpl &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.topic, topic) || other.topic == topic) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.sectionId, sectionId) ||
                other.sectionId == sectionId) &&
            const DeepCollectionEquality().equals(other._sections, _sections));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    total,
    title,
    topic,
    description,
    sectionId,
    const DeepCollectionEquality().hash(_sections),
  );

  /// Create a copy of QuizSetData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuizSetDataImplCopyWith<_$QuizSetDataImpl> get copyWith =>
      __$$QuizSetDataImplCopyWithImpl<_$QuizSetDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuizSetDataImplToJson(this);
  }
}

abstract class _QuizSetData implements QuizSetData {
  const factory _QuizSetData({
    required final int total,
    required final String title,
    required final String topic,
    required final String description,
    required final int sectionId,
    required final List<QuizSetItem> sections,
  }) = _$QuizSetDataImpl;

  factory _QuizSetData.fromJson(Map<String, dynamic> json) =
      _$QuizSetDataImpl.fromJson;

  @override
  int get total;
  @override
  String get title;
  @override
  String get topic;
  @override
  String get description;
  @override
  int get sectionId;
  @override
  List<QuizSetItem> get sections;

  /// Create a copy of QuizSetData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuizSetDataImplCopyWith<_$QuizSetDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

QuizSetItem _$QuizSetItemFromJson(Map<String, dynamic> json) {
  return _QuizSetItem.fromJson(json);
}

/// @nodoc
mixin _$QuizSetItem {
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  int get position => throw _privateConstructorUsedError;
  String get fileName => throw _privateConstructorUsedError;
  ResultData? get previousResult => throw _privateConstructorUsedError;

  /// Serializes this QuizSetItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of QuizSetItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QuizSetItemCopyWith<QuizSetItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizSetItemCopyWith<$Res> {
  factory $QuizSetItemCopyWith(
    QuizSetItem value,
    $Res Function(QuizSetItem) then,
  ) = _$QuizSetItemCopyWithImpl<$Res, QuizSetItem>;
  @useResult
  $Res call({
    String title,
    String description,
    int position,
    String fileName,
    ResultData? previousResult,
  });

  $ResultDataCopyWith<$Res>? get previousResult;
}

/// @nodoc
class _$QuizSetItemCopyWithImpl<$Res, $Val extends QuizSetItem>
    implements $QuizSetItemCopyWith<$Res> {
  _$QuizSetItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QuizSetItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
    Object? position = null,
    Object? fileName = null,
    Object? previousResult = freezed,
  }) {
    return _then(
      _value.copyWith(
            title:
                null == title
                    ? _value.title
                    : title // ignore: cast_nullable_to_non_nullable
                        as String,
            description:
                null == description
                    ? _value.description
                    : description // ignore: cast_nullable_to_non_nullable
                        as String,
            position:
                null == position
                    ? _value.position
                    : position // ignore: cast_nullable_to_non_nullable
                        as int,
            fileName:
                null == fileName
                    ? _value.fileName
                    : fileName // ignore: cast_nullable_to_non_nullable
                        as String,
            previousResult:
                freezed == previousResult
                    ? _value.previousResult
                    : previousResult // ignore: cast_nullable_to_non_nullable
                        as ResultData?,
          )
          as $Val,
    );
  }

  /// Create a copy of QuizSetItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ResultDataCopyWith<$Res>? get previousResult {
    if (_value.previousResult == null) {
      return null;
    }

    return $ResultDataCopyWith<$Res>(_value.previousResult!, (value) {
      return _then(_value.copyWith(previousResult: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$QuizSetItemImplCopyWith<$Res>
    implements $QuizSetItemCopyWith<$Res> {
  factory _$$QuizSetItemImplCopyWith(
    _$QuizSetItemImpl value,
    $Res Function(_$QuizSetItemImpl) then,
  ) = __$$QuizSetItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String title,
    String description,
    int position,
    String fileName,
    ResultData? previousResult,
  });

  @override
  $ResultDataCopyWith<$Res>? get previousResult;
}

/// @nodoc
class __$$QuizSetItemImplCopyWithImpl<$Res>
    extends _$QuizSetItemCopyWithImpl<$Res, _$QuizSetItemImpl>
    implements _$$QuizSetItemImplCopyWith<$Res> {
  __$$QuizSetItemImplCopyWithImpl(
    _$QuizSetItemImpl _value,
    $Res Function(_$QuizSetItemImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of QuizSetItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
    Object? position = null,
    Object? fileName = null,
    Object? previousResult = freezed,
  }) {
    return _then(
      _$QuizSetItemImpl(
        title:
            null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                    as String,
        description:
            null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                    as String,
        position:
            null == position
                ? _value.position
                : position // ignore: cast_nullable_to_non_nullable
                    as int,
        fileName:
            null == fileName
                ? _value.fileName
                : fileName // ignore: cast_nullable_to_non_nullable
                    as String,
        previousResult:
            freezed == previousResult
                ? _value.previousResult
                : previousResult // ignore: cast_nullable_to_non_nullable
                    as ResultData?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$QuizSetItemImpl implements _QuizSetItem {
  const _$QuizSetItemImpl({
    required this.title,
    required this.description,
    required this.position,
    required this.fileName,
    this.previousResult,
  });

  factory _$QuizSetItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuizSetItemImplFromJson(json);

  @override
  final String title;
  @override
  final String description;
  @override
  final int position;
  @override
  final String fileName;
  @override
  final ResultData? previousResult;

  @override
  String toString() {
    return 'QuizSetItem(title: $title, description: $description, position: $position, fileName: $fileName, previousResult: $previousResult)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuizSetItemImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.fileName, fileName) ||
                other.fileName == fileName) &&
            (identical(other.previousResult, previousResult) ||
                other.previousResult == previousResult));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    title,
    description,
    position,
    fileName,
    previousResult,
  );

  /// Create a copy of QuizSetItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuizSetItemImplCopyWith<_$QuizSetItemImpl> get copyWith =>
      __$$QuizSetItemImplCopyWithImpl<_$QuizSetItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuizSetItemImplToJson(this);
  }
}

abstract class _QuizSetItem implements QuizSetItem {
  const factory _QuizSetItem({
    required final String title,
    required final String description,
    required final int position,
    required final String fileName,
    final ResultData? previousResult,
  }) = _$QuizSetItemImpl;

  factory _QuizSetItem.fromJson(Map<String, dynamic> json) =
      _$QuizSetItemImpl.fromJson;

  @override
  String get title;
  @override
  String get description;
  @override
  int get position;
  @override
  String get fileName;
  @override
  ResultData? get previousResult;

  /// Create a copy of QuizSetItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuizSetItemImplCopyWith<_$QuizSetItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
