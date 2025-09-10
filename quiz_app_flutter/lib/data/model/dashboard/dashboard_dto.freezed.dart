// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

DashboardDto _$DashboardDtoFromJson(Map<String, dynamic> json) {
  return _DashboardDto.fromJson(json);
}

/// @nodoc
mixin _$DashboardDto {
  int get total => throw _privateConstructorUsedError;
  List<ItemDto> get items => throw _privateConstructorUsedError;

  /// Serializes this DashboardDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DashboardDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DashboardDtoCopyWith<DashboardDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DashboardDtoCopyWith<$Res> {
  factory $DashboardDtoCopyWith(
    DashboardDto value,
    $Res Function(DashboardDto) then,
  ) = _$DashboardDtoCopyWithImpl<$Res, DashboardDto>;
  @useResult
  $Res call({int total, List<ItemDto> items});
}

/// @nodoc
class _$DashboardDtoCopyWithImpl<$Res, $Val extends DashboardDto>
    implements $DashboardDtoCopyWith<$Res> {
  _$DashboardDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DashboardDto
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
                        as List<ItemDto>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DashboardDtoImplCopyWith<$Res>
    implements $DashboardDtoCopyWith<$Res> {
  factory _$$DashboardDtoImplCopyWith(
    _$DashboardDtoImpl value,
    $Res Function(_$DashboardDtoImpl) then,
  ) = __$$DashboardDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int total, List<ItemDto> items});
}

/// @nodoc
class __$$DashboardDtoImplCopyWithImpl<$Res>
    extends _$DashboardDtoCopyWithImpl<$Res, _$DashboardDtoImpl>
    implements _$$DashboardDtoImplCopyWith<$Res> {
  __$$DashboardDtoImplCopyWithImpl(
    _$DashboardDtoImpl _value,
    $Res Function(_$DashboardDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DashboardDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? total = null, Object? items = null}) {
    return _then(
      _$DashboardDtoImpl(
        total:
            null == total
                ? _value.total
                : total // ignore: cast_nullable_to_non_nullable
                    as int,
        items:
            null == items
                ? _value._items
                : items // ignore: cast_nullable_to_non_nullable
                    as List<ItemDto>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DashboardDtoImpl implements _DashboardDto {
  const _$DashboardDtoImpl({
    required this.total,
    required final List<ItemDto> items,
  }) : _items = items;

  factory _$DashboardDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$DashboardDtoImplFromJson(json);

  @override
  final int total;
  final List<ItemDto> _items;
  @override
  List<ItemDto> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'DashboardDto(total: $total, items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DashboardDtoImpl &&
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

  /// Create a copy of DashboardDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DashboardDtoImplCopyWith<_$DashboardDtoImpl> get copyWith =>
      __$$DashboardDtoImplCopyWithImpl<_$DashboardDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DashboardDtoImplToJson(this);
  }
}

abstract class _DashboardDto implements DashboardDto {
  const factory _DashboardDto({
    required final int total,
    required final List<ItemDto> items,
  }) = _$DashboardDtoImpl;

  factory _DashboardDto.fromJson(Map<String, dynamic> json) =
      _$DashboardDtoImpl.fromJson;

  @override
  int get total;
  @override
  List<ItemDto> get items;

  /// Create a copy of DashboardDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DashboardDtoImplCopyWith<_$DashboardDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ItemDto _$ItemDtoFromJson(Map<String, dynamic> json) {
  return _ItemDto.fromJson(json);
}

/// @nodoc
mixin _$ItemDto {
  int get total => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get topic => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  List<SectionDto> get sections => throw _privateConstructorUsedError;
  int get sectionId => throw _privateConstructorUsedError;

  /// Serializes this ItemDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ItemDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ItemDtoCopyWith<ItemDto> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemDtoCopyWith<$Res> {
  factory $ItemDtoCopyWith(ItemDto value, $Res Function(ItemDto) then) =
      _$ItemDtoCopyWithImpl<$Res, ItemDto>;
  @useResult
  $Res call({
    int total,
    String title,
    String topic,
    String description,
    List<SectionDto> sections,
    int sectionId,
  });
}

/// @nodoc
class _$ItemDtoCopyWithImpl<$Res, $Val extends ItemDto>
    implements $ItemDtoCopyWith<$Res> {
  _$ItemDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ItemDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
    Object? title = null,
    Object? topic = null,
    Object? description = null,
    Object? sections = null,
    Object? sectionId = null,
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
            sections:
                null == sections
                    ? _value.sections
                    : sections // ignore: cast_nullable_to_non_nullable
                        as List<SectionDto>,
            sectionId:
                null == sectionId
                    ? _value.sectionId
                    : sectionId // ignore: cast_nullable_to_non_nullable
                        as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ItemDtoImplCopyWith<$Res> implements $ItemDtoCopyWith<$Res> {
  factory _$$ItemDtoImplCopyWith(
    _$ItemDtoImpl value,
    $Res Function(_$ItemDtoImpl) then,
  ) = __$$ItemDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int total,
    String title,
    String topic,
    String description,
    List<SectionDto> sections,
    int sectionId,
  });
}

/// @nodoc
class __$$ItemDtoImplCopyWithImpl<$Res>
    extends _$ItemDtoCopyWithImpl<$Res, _$ItemDtoImpl>
    implements _$$ItemDtoImplCopyWith<$Res> {
  __$$ItemDtoImplCopyWithImpl(
    _$ItemDtoImpl _value,
    $Res Function(_$ItemDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ItemDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
    Object? title = null,
    Object? topic = null,
    Object? description = null,
    Object? sections = null,
    Object? sectionId = null,
  }) {
    return _then(
      _$ItemDtoImpl(
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
        sections:
            null == sections
                ? _value._sections
                : sections // ignore: cast_nullable_to_non_nullable
                    as List<SectionDto>,
        sectionId:
            null == sectionId
                ? _value.sectionId
                : sectionId // ignore: cast_nullable_to_non_nullable
                    as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ItemDtoImpl implements _ItemDto {
  const _$ItemDtoImpl({
    required this.total,
    required this.title,
    required this.topic,
    required this.description,
    required final List<SectionDto> sections,
    required this.sectionId,
  }) : _sections = sections;

  factory _$ItemDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ItemDtoImplFromJson(json);

  @override
  final int total;
  @override
  final String title;
  @override
  final String topic;
  @override
  final String description;
  final List<SectionDto> _sections;
  @override
  List<SectionDto> get sections {
    if (_sections is EqualUnmodifiableListView) return _sections;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sections);
  }

  @override
  final int sectionId;

  @override
  String toString() {
    return 'ItemDto(total: $total, title: $title, topic: $topic, description: $description, sections: $sections, sectionId: $sectionId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ItemDtoImpl &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.topic, topic) || other.topic == topic) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other._sections, _sections) &&
            (identical(other.sectionId, sectionId) ||
                other.sectionId == sectionId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    total,
    title,
    topic,
    description,
    const DeepCollectionEquality().hash(_sections),
    sectionId,
  );

  /// Create a copy of ItemDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ItemDtoImplCopyWith<_$ItemDtoImpl> get copyWith =>
      __$$ItemDtoImplCopyWithImpl<_$ItemDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ItemDtoImplToJson(this);
  }
}

abstract class _ItemDto implements ItemDto {
  const factory _ItemDto({
    required final int total,
    required final String title,
    required final String topic,
    required final String description,
    required final List<SectionDto> sections,
    required final int sectionId,
  }) = _$ItemDtoImpl;

  factory _ItemDto.fromJson(Map<String, dynamic> json) = _$ItemDtoImpl.fromJson;

  @override
  int get total;
  @override
  String get title;
  @override
  String get topic;
  @override
  String get description;
  @override
  List<SectionDto> get sections;
  @override
  int get sectionId;

  /// Create a copy of ItemDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ItemDtoImplCopyWith<_$ItemDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SectionDto _$SectionDtoFromJson(Map<String, dynamic> json) {
  return _SectionDto.fromJson(json);
}

/// @nodoc
mixin _$SectionDto {
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  int get position => throw _privateConstructorUsedError;
  String get fileName => throw _privateConstructorUsedError;

  /// Serializes this SectionDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SectionDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SectionDtoCopyWith<SectionDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SectionDtoCopyWith<$Res> {
  factory $SectionDtoCopyWith(
    SectionDto value,
    $Res Function(SectionDto) then,
  ) = _$SectionDtoCopyWithImpl<$Res, SectionDto>;
  @useResult
  $Res call({String title, String description, int position, String fileName});
}

/// @nodoc
class _$SectionDtoCopyWithImpl<$Res, $Val extends SectionDto>
    implements $SectionDtoCopyWith<$Res> {
  _$SectionDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SectionDto
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
abstract class _$$SectionDtoImplCopyWith<$Res>
    implements $SectionDtoCopyWith<$Res> {
  factory _$$SectionDtoImplCopyWith(
    _$SectionDtoImpl value,
    $Res Function(_$SectionDtoImpl) then,
  ) = __$$SectionDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, String description, int position, String fileName});
}

/// @nodoc
class __$$SectionDtoImplCopyWithImpl<$Res>
    extends _$SectionDtoCopyWithImpl<$Res, _$SectionDtoImpl>
    implements _$$SectionDtoImplCopyWith<$Res> {
  __$$SectionDtoImplCopyWithImpl(
    _$SectionDtoImpl _value,
    $Res Function(_$SectionDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SectionDto
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
      _$SectionDtoImpl(
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
class _$SectionDtoImpl implements _SectionDto {
  const _$SectionDtoImpl({
    required this.title,
    required this.description,
    required this.position,
    required this.fileName,
  });

  factory _$SectionDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$SectionDtoImplFromJson(json);

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
    return 'SectionDto(title: $title, description: $description, position: $position, fileName: $fileName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SectionDtoImpl &&
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

  /// Create a copy of SectionDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SectionDtoImplCopyWith<_$SectionDtoImpl> get copyWith =>
      __$$SectionDtoImplCopyWithImpl<_$SectionDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SectionDtoImplToJson(this);
  }
}

abstract class _SectionDto implements SectionDto {
  const factory _SectionDto({
    required final String title,
    required final String description,
    required final int position,
    required final String fileName,
  }) = _$SectionDtoImpl;

  factory _SectionDto.fromJson(Map<String, dynamic> json) =
      _$SectionDtoImpl.fromJson;

  @override
  String get title;
  @override
  String get description;
  @override
  int get position;
  @override
  String get fileName;

  /// Create a copy of SectionDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SectionDtoImplCopyWith<_$SectionDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
