// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz_screen_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

QuizScreenData _$QuizScreenDataFromJson(Map<String, dynamic> json) {
  return _QuizScreenData.fromJson(json);
}

/// @nodoc
mixin _$QuizScreenData {
  String? get quizTitle => throw _privateConstructorUsedError;
  String? get quizDescription => throw _privateConstructorUsedError;
  QuizSetItem? get quizSection => throw _privateConstructorUsedError;
  int get currentQuizPosition => throw _privateConstructorUsedError;

  /// Serializes this QuizScreenData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of QuizScreenData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QuizScreenDataCopyWith<QuizScreenData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizScreenDataCopyWith<$Res> {
  factory $QuizScreenDataCopyWith(
    QuizScreenData value,
    $Res Function(QuizScreenData) then,
  ) = _$QuizScreenDataCopyWithImpl<$Res, QuizScreenData>;
  @useResult
  $Res call({
    String? quizTitle,
    String? quizDescription,
    QuizSetItem? quizSection,
    int currentQuizPosition,
  });

  $QuizSetItemCopyWith<$Res>? get quizSection;
}

/// @nodoc
class _$QuizScreenDataCopyWithImpl<$Res, $Val extends QuizScreenData>
    implements $QuizScreenDataCopyWith<$Res> {
  _$QuizScreenDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QuizScreenData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quizTitle = freezed,
    Object? quizDescription = freezed,
    Object? quizSection = freezed,
    Object? currentQuizPosition = null,
  }) {
    return _then(
      _value.copyWith(
            quizTitle:
                freezed == quizTitle
                    ? _value.quizTitle
                    : quizTitle // ignore: cast_nullable_to_non_nullable
                        as String?,
            quizDescription:
                freezed == quizDescription
                    ? _value.quizDescription
                    : quizDescription // ignore: cast_nullable_to_non_nullable
                        as String?,
            quizSection:
                freezed == quizSection
                    ? _value.quizSection
                    : quizSection // ignore: cast_nullable_to_non_nullable
                        as QuizSetItem?,
            currentQuizPosition:
                null == currentQuizPosition
                    ? _value.currentQuizPosition
                    : currentQuizPosition // ignore: cast_nullable_to_non_nullable
                        as int,
          )
          as $Val,
    );
  }

  /// Create a copy of QuizScreenData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $QuizSetItemCopyWith<$Res>? get quizSection {
    if (_value.quizSection == null) {
      return null;
    }

    return $QuizSetItemCopyWith<$Res>(_value.quizSection!, (value) {
      return _then(_value.copyWith(quizSection: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$QuizScreenDataImplCopyWith<$Res>
    implements $QuizScreenDataCopyWith<$Res> {
  factory _$$QuizScreenDataImplCopyWith(
    _$QuizScreenDataImpl value,
    $Res Function(_$QuizScreenDataImpl) then,
  ) = __$$QuizScreenDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? quizTitle,
    String? quizDescription,
    QuizSetItem? quizSection,
    int currentQuizPosition,
  });

  @override
  $QuizSetItemCopyWith<$Res>? get quizSection;
}

/// @nodoc
class __$$QuizScreenDataImplCopyWithImpl<$Res>
    extends _$QuizScreenDataCopyWithImpl<$Res, _$QuizScreenDataImpl>
    implements _$$QuizScreenDataImplCopyWith<$Res> {
  __$$QuizScreenDataImplCopyWithImpl(
    _$QuizScreenDataImpl _value,
    $Res Function(_$QuizScreenDataImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of QuizScreenData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quizTitle = freezed,
    Object? quizDescription = freezed,
    Object? quizSection = freezed,
    Object? currentQuizPosition = null,
  }) {
    return _then(
      _$QuizScreenDataImpl(
        quizTitle:
            freezed == quizTitle
                ? _value.quizTitle
                : quizTitle // ignore: cast_nullable_to_non_nullable
                    as String?,
        quizDescription:
            freezed == quizDescription
                ? _value.quizDescription
                : quizDescription // ignore: cast_nullable_to_non_nullable
                    as String?,
        quizSection:
            freezed == quizSection
                ? _value.quizSection
                : quizSection // ignore: cast_nullable_to_non_nullable
                    as QuizSetItem?,
        currentQuizPosition:
            null == currentQuizPosition
                ? _value.currentQuizPosition
                : currentQuizPosition // ignore: cast_nullable_to_non_nullable
                    as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$QuizScreenDataImpl implements _QuizScreenData {
  const _$QuizScreenDataImpl({
    this.quizTitle,
    this.quizDescription,
    this.quizSection,
    this.currentQuizPosition = -1,
  });

  factory _$QuizScreenDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuizScreenDataImplFromJson(json);

  @override
  final String? quizTitle;
  @override
  final String? quizDescription;
  @override
  final QuizSetItem? quizSection;
  @override
  @JsonKey()
  final int currentQuizPosition;

  @override
  String toString() {
    return 'QuizScreenData(quizTitle: $quizTitle, quizDescription: $quizDescription, quizSection: $quizSection, currentQuizPosition: $currentQuizPosition)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuizScreenDataImpl &&
            (identical(other.quizTitle, quizTitle) ||
                other.quizTitle == quizTitle) &&
            (identical(other.quizDescription, quizDescription) ||
                other.quizDescription == quizDescription) &&
            (identical(other.quizSection, quizSection) ||
                other.quizSection == quizSection) &&
            (identical(other.currentQuizPosition, currentQuizPosition) ||
                other.currentQuizPosition == currentQuizPosition));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    quizTitle,
    quizDescription,
    quizSection,
    currentQuizPosition,
  );

  /// Create a copy of QuizScreenData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuizScreenDataImplCopyWith<_$QuizScreenDataImpl> get copyWith =>
      __$$QuizScreenDataImplCopyWithImpl<_$QuizScreenDataImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$QuizScreenDataImplToJson(this);
  }
}

abstract class _QuizScreenData implements QuizScreenData {
  const factory _QuizScreenData({
    final String? quizTitle,
    final String? quizDescription,
    final QuizSetItem? quizSection,
    final int currentQuizPosition,
  }) = _$QuizScreenDataImpl;

  factory _QuizScreenData.fromJson(Map<String, dynamic> json) =
      _$QuizScreenDataImpl.fromJson;

  @override
  String? get quizTitle;
  @override
  String? get quizDescription;
  @override
  QuizSetItem? get quizSection;
  @override
  int get currentQuizPosition;

  /// Create a copy of QuizScreenData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuizScreenDataImplCopyWith<_$QuizScreenDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
