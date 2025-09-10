// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'result_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ResultData _$ResultDataFromJson(Map<String, dynamic> json) {
  return _ResultData.fromJson(json);
}

/// @nodoc
mixin _$ResultData {
  String? get quizTitle => throw _privateConstructorUsedError;
  String? get quizDescription => throw _privateConstructorUsedError;
  List<ResultItem> get resultItems => throw _privateConstructorUsedError;
  int get totalCorrectAnswers => throw _privateConstructorUsedError;
  int get totalQuestions => throw _privateConstructorUsedError;
  int get resultPercentage => throw _privateConstructorUsedError;

  /// Serializes this ResultData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ResultData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ResultDataCopyWith<ResultData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResultDataCopyWith<$Res> {
  factory $ResultDataCopyWith(
    ResultData value,
    $Res Function(ResultData) then,
  ) = _$ResultDataCopyWithImpl<$Res, ResultData>;
  @useResult
  $Res call({
    String? quizTitle,
    String? quizDescription,
    List<ResultItem> resultItems,
    int totalCorrectAnswers,
    int totalQuestions,
    int resultPercentage,
  });
}

/// @nodoc
class _$ResultDataCopyWithImpl<$Res, $Val extends ResultData>
    implements $ResultDataCopyWith<$Res> {
  _$ResultDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ResultData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quizTitle = freezed,
    Object? quizDescription = freezed,
    Object? resultItems = null,
    Object? totalCorrectAnswers = null,
    Object? totalQuestions = null,
    Object? resultPercentage = null,
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
            resultItems:
                null == resultItems
                    ? _value.resultItems
                    : resultItems // ignore: cast_nullable_to_non_nullable
                        as List<ResultItem>,
            totalCorrectAnswers:
                null == totalCorrectAnswers
                    ? _value.totalCorrectAnswers
                    : totalCorrectAnswers // ignore: cast_nullable_to_non_nullable
                        as int,
            totalQuestions:
                null == totalQuestions
                    ? _value.totalQuestions
                    : totalQuestions // ignore: cast_nullable_to_non_nullable
                        as int,
            resultPercentage:
                null == resultPercentage
                    ? _value.resultPercentage
                    : resultPercentage // ignore: cast_nullable_to_non_nullable
                        as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ResultDataImplCopyWith<$Res>
    implements $ResultDataCopyWith<$Res> {
  factory _$$ResultDataImplCopyWith(
    _$ResultDataImpl value,
    $Res Function(_$ResultDataImpl) then,
  ) = __$$ResultDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? quizTitle,
    String? quizDescription,
    List<ResultItem> resultItems,
    int totalCorrectAnswers,
    int totalQuestions,
    int resultPercentage,
  });
}

/// @nodoc
class __$$ResultDataImplCopyWithImpl<$Res>
    extends _$ResultDataCopyWithImpl<$Res, _$ResultDataImpl>
    implements _$$ResultDataImplCopyWith<$Res> {
  __$$ResultDataImplCopyWithImpl(
    _$ResultDataImpl _value,
    $Res Function(_$ResultDataImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ResultData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quizTitle = freezed,
    Object? quizDescription = freezed,
    Object? resultItems = null,
    Object? totalCorrectAnswers = null,
    Object? totalQuestions = null,
    Object? resultPercentage = null,
  }) {
    return _then(
      _$ResultDataImpl(
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
        resultItems:
            null == resultItems
                ? _value._resultItems
                : resultItems // ignore: cast_nullable_to_non_nullable
                    as List<ResultItem>,
        totalCorrectAnswers:
            null == totalCorrectAnswers
                ? _value.totalCorrectAnswers
                : totalCorrectAnswers // ignore: cast_nullable_to_non_nullable
                    as int,
        totalQuestions:
            null == totalQuestions
                ? _value.totalQuestions
                : totalQuestions // ignore: cast_nullable_to_non_nullable
                    as int,
        resultPercentage:
            null == resultPercentage
                ? _value.resultPercentage
                : resultPercentage // ignore: cast_nullable_to_non_nullable
                    as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ResultDataImpl implements _ResultData {
  const _$ResultDataImpl({
    this.quizTitle,
    this.quizDescription,
    required final List<ResultItem> resultItems,
    required this.totalCorrectAnswers,
    required this.totalQuestions,
    required this.resultPercentage,
  }) : _resultItems = resultItems;

  factory _$ResultDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResultDataImplFromJson(json);

  @override
  final String? quizTitle;
  @override
  final String? quizDescription;
  final List<ResultItem> _resultItems;
  @override
  List<ResultItem> get resultItems {
    if (_resultItems is EqualUnmodifiableListView) return _resultItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_resultItems);
  }

  @override
  final int totalCorrectAnswers;
  @override
  final int totalQuestions;
  @override
  final int resultPercentage;

  @override
  String toString() {
    return 'ResultData(quizTitle: $quizTitle, quizDescription: $quizDescription, resultItems: $resultItems, totalCorrectAnswers: $totalCorrectAnswers, totalQuestions: $totalQuestions, resultPercentage: $resultPercentage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResultDataImpl &&
            (identical(other.quizTitle, quizTitle) ||
                other.quizTitle == quizTitle) &&
            (identical(other.quizDescription, quizDescription) ||
                other.quizDescription == quizDescription) &&
            const DeepCollectionEquality().equals(
              other._resultItems,
              _resultItems,
            ) &&
            (identical(other.totalCorrectAnswers, totalCorrectAnswers) ||
                other.totalCorrectAnswers == totalCorrectAnswers) &&
            (identical(other.totalQuestions, totalQuestions) ||
                other.totalQuestions == totalQuestions) &&
            (identical(other.resultPercentage, resultPercentage) ||
                other.resultPercentage == resultPercentage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    quizTitle,
    quizDescription,
    const DeepCollectionEquality().hash(_resultItems),
    totalCorrectAnswers,
    totalQuestions,
    resultPercentage,
  );

  /// Create a copy of ResultData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResultDataImplCopyWith<_$ResultDataImpl> get copyWith =>
      __$$ResultDataImplCopyWithImpl<_$ResultDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ResultDataImplToJson(this);
  }
}

abstract class _ResultData implements ResultData {
  const factory _ResultData({
    final String? quizTitle,
    final String? quizDescription,
    required final List<ResultItem> resultItems,
    required final int totalCorrectAnswers,
    required final int totalQuestions,
    required final int resultPercentage,
  }) = _$ResultDataImpl;

  factory _ResultData.fromJson(Map<String, dynamic> json) =
      _$ResultDataImpl.fromJson;

  @override
  String? get quizTitle;
  @override
  String? get quizDescription;
  @override
  List<ResultItem> get resultItems;
  @override
  int get totalCorrectAnswers;
  @override
  int get totalQuestions;
  @override
  int get resultPercentage;

  /// Create a copy of ResultData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResultDataImplCopyWith<_$ResultDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ResultItem _$ResultItemFromJson(Map<String, dynamic> json) {
  return _ResultItem.fromJson(json);
}

/// @nodoc
mixin _$ResultItem {
  int get questionId => throw _privateConstructorUsedError;
  String get question => throw _privateConstructorUsedError;
  bool get result => throw _privateConstructorUsedError;
  String? get answerSectionTitle => throw _privateConstructorUsedError;
  List<String> get correctAnswer => throw _privateConstructorUsedError;
  String get explanation => throw _privateConstructorUsedError;
  bool get isSkipped => throw _privateConstructorUsedError;

  /// Serializes this ResultItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ResultItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ResultItemCopyWith<ResultItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResultItemCopyWith<$Res> {
  factory $ResultItemCopyWith(
    ResultItem value,
    $Res Function(ResultItem) then,
  ) = _$ResultItemCopyWithImpl<$Res, ResultItem>;
  @useResult
  $Res call({
    int questionId,
    String question,
    bool result,
    String? answerSectionTitle,
    List<String> correctAnswer,
    String explanation,
    bool isSkipped,
  });
}

/// @nodoc
class _$ResultItemCopyWithImpl<$Res, $Val extends ResultItem>
    implements $ResultItemCopyWith<$Res> {
  _$ResultItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ResultItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? questionId = null,
    Object? question = null,
    Object? result = null,
    Object? answerSectionTitle = freezed,
    Object? correctAnswer = null,
    Object? explanation = null,
    Object? isSkipped = null,
  }) {
    return _then(
      _value.copyWith(
            questionId:
                null == questionId
                    ? _value.questionId
                    : questionId // ignore: cast_nullable_to_non_nullable
                        as int,
            question:
                null == question
                    ? _value.question
                    : question // ignore: cast_nullable_to_non_nullable
                        as String,
            result:
                null == result
                    ? _value.result
                    : result // ignore: cast_nullable_to_non_nullable
                        as bool,
            answerSectionTitle:
                freezed == answerSectionTitle
                    ? _value.answerSectionTitle
                    : answerSectionTitle // ignore: cast_nullable_to_non_nullable
                        as String?,
            correctAnswer:
                null == correctAnswer
                    ? _value.correctAnswer
                    : correctAnswer // ignore: cast_nullable_to_non_nullable
                        as List<String>,
            explanation:
                null == explanation
                    ? _value.explanation
                    : explanation // ignore: cast_nullable_to_non_nullable
                        as String,
            isSkipped:
                null == isSkipped
                    ? _value.isSkipped
                    : isSkipped // ignore: cast_nullable_to_non_nullable
                        as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ResultItemImplCopyWith<$Res>
    implements $ResultItemCopyWith<$Res> {
  factory _$$ResultItemImplCopyWith(
    _$ResultItemImpl value,
    $Res Function(_$ResultItemImpl) then,
  ) = __$$ResultItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int questionId,
    String question,
    bool result,
    String? answerSectionTitle,
    List<String> correctAnswer,
    String explanation,
    bool isSkipped,
  });
}

/// @nodoc
class __$$ResultItemImplCopyWithImpl<$Res>
    extends _$ResultItemCopyWithImpl<$Res, _$ResultItemImpl>
    implements _$$ResultItemImplCopyWith<$Res> {
  __$$ResultItemImplCopyWithImpl(
    _$ResultItemImpl _value,
    $Res Function(_$ResultItemImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ResultItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? questionId = null,
    Object? question = null,
    Object? result = null,
    Object? answerSectionTitle = freezed,
    Object? correctAnswer = null,
    Object? explanation = null,
    Object? isSkipped = null,
  }) {
    return _then(
      _$ResultItemImpl(
        questionId:
            null == questionId
                ? _value.questionId
                : questionId // ignore: cast_nullable_to_non_nullable
                    as int,
        question:
            null == question
                ? _value.question
                : question // ignore: cast_nullable_to_non_nullable
                    as String,
        result:
            null == result
                ? _value.result
                : result // ignore: cast_nullable_to_non_nullable
                    as bool,
        answerSectionTitle:
            freezed == answerSectionTitle
                ? _value.answerSectionTitle
                : answerSectionTitle // ignore: cast_nullable_to_non_nullable
                    as String?,
        correctAnswer:
            null == correctAnswer
                ? _value._correctAnswer
                : correctAnswer // ignore: cast_nullable_to_non_nullable
                    as List<String>,
        explanation:
            null == explanation
                ? _value.explanation
                : explanation // ignore: cast_nullable_to_non_nullable
                    as String,
        isSkipped:
            null == isSkipped
                ? _value.isSkipped
                : isSkipped // ignore: cast_nullable_to_non_nullable
                    as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ResultItemImpl implements _ResultItem {
  const _$ResultItemImpl({
    required this.questionId,
    required this.question,
    required this.result,
    this.answerSectionTitle,
    required final List<String> correctAnswer,
    required this.explanation,
    this.isSkipped = false,
  }) : _correctAnswer = correctAnswer;

  factory _$ResultItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResultItemImplFromJson(json);

  @override
  final int questionId;
  @override
  final String question;
  @override
  final bool result;
  @override
  final String? answerSectionTitle;
  final List<String> _correctAnswer;
  @override
  List<String> get correctAnswer {
    if (_correctAnswer is EqualUnmodifiableListView) return _correctAnswer;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_correctAnswer);
  }

  @override
  final String explanation;
  @override
  @JsonKey()
  final bool isSkipped;

  @override
  String toString() {
    return 'ResultItem(questionId: $questionId, question: $question, result: $result, answerSectionTitle: $answerSectionTitle, correctAnswer: $correctAnswer, explanation: $explanation, isSkipped: $isSkipped)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResultItemImpl &&
            (identical(other.questionId, questionId) ||
                other.questionId == questionId) &&
            (identical(other.question, question) ||
                other.question == question) &&
            (identical(other.result, result) || other.result == result) &&
            (identical(other.answerSectionTitle, answerSectionTitle) ||
                other.answerSectionTitle == answerSectionTitle) &&
            const DeepCollectionEquality().equals(
              other._correctAnswer,
              _correctAnswer,
            ) &&
            (identical(other.explanation, explanation) ||
                other.explanation == explanation) &&
            (identical(other.isSkipped, isSkipped) ||
                other.isSkipped == isSkipped));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    questionId,
    question,
    result,
    answerSectionTitle,
    const DeepCollectionEquality().hash(_correctAnswer),
    explanation,
    isSkipped,
  );

  /// Create a copy of ResultItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResultItemImplCopyWith<_$ResultItemImpl> get copyWith =>
      __$$ResultItemImplCopyWithImpl<_$ResultItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ResultItemImplToJson(this);
  }
}

abstract class _ResultItem implements ResultItem {
  const factory _ResultItem({
    required final int questionId,
    required final String question,
    required final bool result,
    final String? answerSectionTitle,
    required final List<String> correctAnswer,
    required final String explanation,
    final bool isSkipped,
  }) = _$ResultItemImpl;

  factory _ResultItem.fromJson(Map<String, dynamic> json) =
      _$ResultItemImpl.fromJson;

  @override
  int get questionId;
  @override
  String get question;
  @override
  bool get result;
  @override
  String? get answerSectionTitle;
  @override
  List<String> get correctAnswer;
  @override
  String get explanation;
  @override
  bool get isSkipped;

  /// Create a copy of ResultItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResultItemImplCopyWith<_$ResultItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
