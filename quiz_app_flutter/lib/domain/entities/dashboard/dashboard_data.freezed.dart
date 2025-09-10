// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

DashboardData _$DashboardDataFromJson(Map<String, dynamic> json) {
  return _DashboardData.fromJson(json);
}

/// @nodoc
mixin _$DashboardData {
  int get total => throw _privateConstructorUsedError;
  List<DashboardDataItem> get items => throw _privateConstructorUsedError;

  /// Serializes this DashboardData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DashboardData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DashboardDataCopyWith<DashboardData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DashboardDataCopyWith<$Res> {
  factory $DashboardDataCopyWith(
    DashboardData value,
    $Res Function(DashboardData) then,
  ) = _$DashboardDataCopyWithImpl<$Res, DashboardData>;
  @useResult
  $Res call({int total, List<DashboardDataItem> items});
}

/// @nodoc
class _$DashboardDataCopyWithImpl<$Res, $Val extends DashboardData>
    implements $DashboardDataCopyWith<$Res> {
  _$DashboardDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DashboardData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? total = null, Object? items = null}) {
    return _then(
      _value.copyWith(
            total:
                null == total
                    ? _value.total
                    : total // ignore: cast_nullable_to_non_nullable
                        as int,
            items:
                null == items
                    ? _value.items
                    : items // ignore: cast_nullable_to_non_nullable
                        as List<DashboardDataItem>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DashboardDataImplCopyWith<$Res>
    implements $DashboardDataCopyWith<$Res> {
  factory _$$DashboardDataImplCopyWith(
    _$DashboardDataImpl value,
    $Res Function(_$DashboardDataImpl) then,
  ) = __$$DashboardDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int total, List<DashboardDataItem> items});
}

/// @nodoc
class __$$DashboardDataImplCopyWithImpl<$Res>
    extends _$DashboardDataCopyWithImpl<$Res, _$DashboardDataImpl>
    implements _$$DashboardDataImplCopyWith<$Res> {
  __$$DashboardDataImplCopyWithImpl(
    _$DashboardDataImpl _value,
    $Res Function(_$DashboardDataImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DashboardData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? total = null, Object? items = null}) {
    return _then(
      _$DashboardDataImpl(
        total:
            null == total
                ? _value.total
                : total // ignore: cast_nullable_to_non_nullable
                    as int,
        items:
            null == items
                ? _value._items
                : items // ignore: cast_nullable_to_non_nullable
                    as List<DashboardDataItem>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DashboardDataImpl implements _DashboardData {
  const _$DashboardDataImpl({
    required this.total,
    required final List<DashboardDataItem> items,
  }) : _items = items;

  factory _$DashboardDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$DashboardDataImplFromJson(json);

  @override
  final int total;
  final List<DashboardDataItem> _items;
  @override
  List<DashboardDataItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'DashboardData(total: $total, items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DashboardDataImpl &&
            (identical(other.total, total) || other.total == total) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    total,
    const DeepCollectionEquality().hash(_items),
  );

  /// Create a copy of DashboardData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DashboardDataImplCopyWith<_$DashboardDataImpl> get copyWith =>
      __$$DashboardDataImplCopyWithImpl<_$DashboardDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DashboardDataImplToJson(this);
  }
}

abstract class _DashboardData implements DashboardData {
  const factory _DashboardData({
    required final int total,
    required final List<DashboardDataItem> items,
  }) = _$DashboardDataImpl;

  factory _DashboardData.fromJson(Map<String, dynamic> json) =
      _$DashboardDataImpl.fromJson;

  @override
  int get total;
  @override
  List<DashboardDataItem> get items;

  /// Create a copy of DashboardData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DashboardDataImplCopyWith<_$DashboardDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DashboardDataItem _$DashboardDataItemFromJson(Map<String, dynamic> json) {
  return _DashboardDataItem.fromJson(json);
}

/// @nodoc
mixin _$DashboardDataItem {
  int get total => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get topic => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  int get sectionId => throw _privateConstructorUsedError;
  List<DashboardDataSection> get sections => throw _privateConstructorUsedError;

  /// Serializes this DashboardDataItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DashboardDataItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DashboardDataItemCopyWith<DashboardDataItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DashboardDataItemCopyWith<$Res> {
  factory $DashboardDataItemCopyWith(
    DashboardDataItem value,
    $Res Function(DashboardDataItem) then,
  ) = _$DashboardDataItemCopyWithImpl<$Res, DashboardDataItem>;
  @useResult
  $Res call({
    int total,
    String title,
    String topic,
    String description,
    int sectionId,
    List<DashboardDataSection> sections,
  });
}

/// @nodoc
class _$DashboardDataItemCopyWithImpl<$Res, $Val extends DashboardDataItem>
    implements $DashboardDataItemCopyWith<$Res> {
  _$DashboardDataItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DashboardDataItem
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
                        as List<DashboardDataSection>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DashboardDataItemImplCopyWith<$Res>
    implements $DashboardDataItemCopyWith<$Res> {
  factory _$$DashboardDataItemImplCopyWith(
    _$DashboardDataItemImpl value,
    $Res Function(_$DashboardDataItemImpl) then,
  ) = __$$DashboardDataItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int total,
    String title,
    String topic,
    String description,
    int sectionId,
    List<DashboardDataSection> sections,
  });
}

/// @nodoc
class __$$DashboardDataItemImplCopyWithImpl<$Res>
    extends _$DashboardDataItemCopyWithImpl<$Res, _$DashboardDataItemImpl>
    implements _$$DashboardDataItemImplCopyWith<$Res> {
  __$$DashboardDataItemImplCopyWithImpl(
    _$DashboardDataItemImpl _value,
    $Res Function(_$DashboardDataItemImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DashboardDataItem
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
      _$DashboardDataItemImpl(
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
                    as List<DashboardDataSection>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DashboardDataItemImpl implements _DashboardDataItem {
  const _$DashboardDataItemImpl({
    required this.total,
    required this.title,
    required this.topic,
    required this.description,
    required this.sectionId,
    required final List<DashboardDataSection> sections,
  }) : _sections = sections;

  factory _$DashboardDataItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$DashboardDataItemImplFromJson(json);

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
  final List<DashboardDataSection> _sections;
  @override
  List<DashboardDataSection> get sections {
    if (_sections is EqualUnmodifiableListView) return _sections;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sections);
  }

  @override
  String toString() {
    return 'DashboardDataItem(total: $total, title: $title, topic: $topic, description: $description, sectionId: $sectionId, sections: $sections)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DashboardDataItemImpl &&
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

  /// Create a copy of DashboardDataItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DashboardDataItemImplCopyWith<_$DashboardDataItemImpl> get copyWith =>
      __$$DashboardDataItemImplCopyWithImpl<_$DashboardDataItemImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$DashboardDataItemImplToJson(this);
  }
}

abstract class _DashboardDataItem implements DashboardDataItem {
  const factory _DashboardDataItem({
    required final int total,
    required final String title,
    required final String topic,
    required final String description,
    required final int sectionId,
    required final List<DashboardDataSection> sections,
  }) = _$DashboardDataItemImpl;

  factory _DashboardDataItem.fromJson(Map<String, dynamic> json) =
      _$DashboardDataItemImpl.fromJson;

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
  List<DashboardDataSection> get sections;

  /// Create a copy of DashboardDataItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DashboardDataItemImplCopyWith<_$DashboardDataItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DashboardDataSection _$DashboardDataSectionFromJson(Map<String, dynamic> json) {
  return _DashboardDataSection.fromJson(json);
}

/// @nodoc
mixin _$DashboardDataSection {
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  int get position => throw _privateConstructorUsedError;
  String get fileName => throw _privateConstructorUsedError;

  /// Serializes this DashboardDataSection to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DashboardDataSection
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DashboardDataSectionCopyWith<DashboardDataSection> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DashboardDataSectionCopyWith<$Res> {
  factory $DashboardDataSectionCopyWith(
    DashboardDataSection value,
    $Res Function(DashboardDataSection) then,
  ) = _$DashboardDataSectionCopyWithImpl<$Res, DashboardDataSection>;
  @useResult
  $Res call({String title, String description, int position, String fileName});
}

/// @nodoc
class _$DashboardDataSectionCopyWithImpl<
  $Res,
  $Val extends DashboardDataSection
>
    implements $DashboardDataSectionCopyWith<$Res> {
  _$DashboardDataSectionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DashboardDataSection
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
    Object? position = null,
    Object? fileName = null,
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
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DashboardDataSectionImplCopyWith<$Res>
    implements $DashboardDataSectionCopyWith<$Res> {
  factory _$$DashboardDataSectionImplCopyWith(
    _$DashboardDataSectionImpl value,
    $Res Function(_$DashboardDataSectionImpl) then,
  ) = __$$DashboardDataSectionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, String description, int position, String fileName});
}

/// @nodoc
class __$$DashboardDataSectionImplCopyWithImpl<$Res>
    extends _$DashboardDataSectionCopyWithImpl<$Res, _$DashboardDataSectionImpl>
    implements _$$DashboardDataSectionImplCopyWith<$Res> {
  __$$DashboardDataSectionImplCopyWithImpl(
    _$DashboardDataSectionImpl _value,
    $Res Function(_$DashboardDataSectionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DashboardDataSection
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
    Object? position = null,
    Object? fileName = null,
  }) {
    return _then(
      _$DashboardDataSectionImpl(
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
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DashboardDataSectionImpl implements _DashboardDataSection {
  const _$DashboardDataSectionImpl({
    required this.title,
    required this.description,
    required this.position,
    required this.fileName,
  });

  factory _$DashboardDataSectionImpl.fromJson(Map<String, dynamic> json) =>
      _$$DashboardDataSectionImplFromJson(json);

  @override
  final String title;
  @override
  final String description;
  @override
  final int position;
  @override
  final String fileName;

  @override
  String toString() {
    return 'DashboardDataSection(title: $title, description: $description, position: $position, fileName: $fileName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DashboardDataSectionImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.fileName, fileName) ||
                other.fileName == fileName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, title, description, position, fileName);

  /// Create a copy of DashboardDataSection
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DashboardDataSectionImplCopyWith<_$DashboardDataSectionImpl>
  get copyWith =>
      __$$DashboardDataSectionImplCopyWithImpl<_$DashboardDataSectionImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$DashboardDataSectionImplToJson(this);
  }
}

abstract class _DashboardDataSection implements DashboardDataSection {
  const factory _DashboardDataSection({
    required final String title,
    required final String description,
    required final int position,
    required final String fileName,
  }) = _$DashboardDataSectionImpl;

  factory _DashboardDataSection.fromJson(Map<String, dynamic> json) =
      _$DashboardDataSectionImpl.fromJson;

  @override
  String get title;
  @override
  String get description;
  @override
  int get position;
  @override
  String get fileName;

  /// Create a copy of DashboardDataSection
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DashboardDataSectionImplCopyWith<_$DashboardDataSectionImpl>
  get copyWith => throw _privateConstructorUsedError;
}
