// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

QuizData _$QuizDataFromJson(Map<String, dynamic> json) {
  return _QuizData.fromJson(json);
}

/// @nodoc
mixin _$QuizData {
  int get questionId => throw _privateConstructorUsedError;
  String get question => throw _privateConstructorUsedError;
  int get answerCellType => throw _privateConstructorUsedError;
  List<int>? get selectedOptions => throw _privateConstructorUsedError;
  String? get answerSectionTitle => throw _privateConstructorUsedError;
  String get explanation => throw _privateConstructorUsedError;
  List<QuizAnswerCell> get answerCellList => throw _privateConstructorUsedError;
  QuizCorrectAnswer get correctAnswer => throw _privateConstructorUsedError;

  /// Serializes this QuizData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of QuizData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QuizDataCopyWith<QuizData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizDataCopyWith<$Res> {
  factory $QuizDataCopyWith(QuizData value, $Res Function(QuizData) then) =
      _$QuizDataCopyWithImpl<$Res, QuizData>;
  @useResult
  $Res call({
    int questionId,
    String question,
    int answerCellType,
    List<int>? selectedOptions,
    String? answerSectionTitle,
    String explanation,
    List<QuizAnswerCell> answerCellList,
    QuizCorrectAnswer correctAnswer,
  });

  $QuizCorrectAnswerCopyWith<$Res> get correctAnswer;
}

/// @nodoc
class _$QuizDataCopyWithImpl<$Res, $Val extends QuizData>
    implements $QuizDataCopyWith<$Res> {
  _$QuizDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QuizData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? questionId = null,
    Object? question = null,
    Object? answerCellType = null,
    Object? selectedOptions = freezed,
    Object? answerSectionTitle = freezed,
    Object? explanation = null,
    Object? answerCellList = null,
    Object? correctAnswer = null,
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
            answerCellType:
                null == answerCellType
                    ? _value.answerCellType
                    : answerCellType // ignore: cast_nullable_to_non_nullable
                        as int,
            selectedOptions:
                freezed == selectedOptions
                    ? _value.selectedOptions
                    : selectedOptions // ignore: cast_nullable_to_non_nullable
                        as List<int>?,
            answerSectionTitle:
                freezed == answerSectionTitle
                    ? _value.answerSectionTitle
                    : answerSectionTitle // ignore: cast_nullable_to_non_nullable
                        as String?,
            explanation:
                null == explanation
                    ? _value.explanation
                    : explanation // ignore: cast_nullable_to_non_nullable
                        as String,
            answerCellList:
                null == answerCellList
                    ? _value.answerCellList
                    : answerCellList // ignore: cast_nullable_to_non_nullable
                        as List<QuizAnswerCell>,
            correctAnswer:
                null == correctAnswer
                    ? _value.correctAnswer
                    : correctAnswer // ignore: cast_nullable_to_non_nullable
                        as QuizCorrectAnswer,
          )
          as $Val,
    );
  }

  /// Create a copy of QuizData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $QuizCorrectAnswerCopyWith<$Res> get correctAnswer {
    return $QuizCorrectAnswerCopyWith<$Res>(_value.correctAnswer, (value) {
      return _then(_value.copyWith(correctAnswer: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$QuizDataImplCopyWith<$Res>
    implements $QuizDataCopyWith<$Res> {
  factory _$$QuizDataImplCopyWith(
    _$QuizDataImpl value,
    $Res Function(_$QuizDataImpl) then,
  ) = __$$QuizDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int questionId,
    String question,
    int answerCellType,
    List<int>? selectedOptions,
    String? answerSectionTitle,
    String explanation,
    List<QuizAnswerCell> answerCellList,
    QuizCorrectAnswer correctAnswer,
  });

  @override
  $QuizCorrectAnswerCopyWith<$Res> get correctAnswer;
}

/// @nodoc
class __$$QuizDataImplCopyWithImpl<$Res>
    extends _$QuizDataCopyWithImpl<$Res, _$QuizDataImpl>
    implements _$$QuizDataImplCopyWith<$Res> {
  __$$QuizDataImplCopyWithImpl(
    _$QuizDataImpl _value,
    $Res Function(_$QuizDataImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of QuizData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? questionId = null,
    Object? question = null,
    Object? answerCellType = null,
    Object? selectedOptions = freezed,
    Object? answerSectionTitle = freezed,
    Object? explanation = null,
    Object? answerCellList = null,
    Object? correctAnswer = null,
  }) {
    return _then(
      _$QuizDataImpl(
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
        answerCellType:
            null == answerCellType
                ? _value.answerCellType
                : answerCellType // ignore: cast_nullable_to_non_nullable
                    as int,
        selectedOptions:
            freezed == selectedOptions
                ? _value._selectedOptions
                : selectedOptions // ignore: cast_nullable_to_non_nullable
                    as List<int>?,
        answerSectionTitle:
            freezed == answerSectionTitle
                ? _value.answerSectionTitle
                : answerSectionTitle // ignore: cast_nullable_to_non_nullable
                    as String?,
        explanation:
            null == explanation
                ? _value.explanation
                : explanation // ignore: cast_nullable_to_non_nullable
                    as String,
        answerCellList:
            null == answerCellList
                ? _value._answerCellList
                : answerCellList // ignore: cast_nullable_to_non_nullable
                    as List<QuizAnswerCell>,
        correctAnswer:
            null == correctAnswer
                ? _value.correctAnswer
                : correctAnswer // ignore: cast_nullable_to_non_nullable
                    as QuizCorrectAnswer,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$QuizDataImpl implements _QuizData {
  const _$QuizDataImpl({
    required this.questionId,
    required this.question,
    required this.answerCellType,
    final List<int>? selectedOptions,
    this.answerSectionTitle,
    required this.explanation,
    required final List<QuizAnswerCell> answerCellList,
    required this.correctAnswer,
  }) : _selectedOptions = selectedOptions,
       _answerCellList = answerCellList;

  factory _$QuizDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuizDataImplFromJson(json);

  @override
  final int questionId;
  @override
  final String question;
  @override
  final int answerCellType;
  final List<int>? _selectedOptions;
  @override
  List<int>? get selectedOptions {
    final value = _selectedOptions;
    if (value == null) return null;
    if (_selectedOptions is EqualUnmodifiableListView) return _selectedOptions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? answerSectionTitle;
  @override
  final String explanation;
  final List<QuizAnswerCell> _answerCellList;
  @override
  List<QuizAnswerCell> get answerCellList {
    if (_answerCellList is EqualUnmodifiableListView) return _answerCellList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_answerCellList);
  }

  @override
  final QuizCorrectAnswer correctAnswer;

  @override
  String toString() {
    return 'QuizData(questionId: $questionId, question: $question, answerCellType: $answerCellType, selectedOptions: $selectedOptions, answerSectionTitle: $answerSectionTitle, explanation: $explanation, answerCellList: $answerCellList, correctAnswer: $correctAnswer)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuizDataImpl &&
            (identical(other.questionId, questionId) ||
                other.questionId == questionId) &&
            (identical(other.question, question) ||
                other.question == question) &&
            (identical(other.answerCellType, answerCellType) ||
                other.answerCellType == answerCellType) &&
            const DeepCollectionEquality().equals(
              other._selectedOptions,
              _selectedOptions,
            ) &&
            (identical(other.answerSectionTitle, answerSectionTitle) ||
                other.answerSectionTitle == answerSectionTitle) &&
            (identical(other.explanation, explanation) ||
                other.explanation == explanation) &&
            const DeepCollectionEquality().equals(
              other._answerCellList,
              _answerCellList,
            ) &&
            (identical(other.correctAnswer, correctAnswer) ||
                other.correctAnswer == correctAnswer));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    questionId,
    question,
    answerCellType,
    const DeepCollectionEquality().hash(_selectedOptions),
    answerSectionTitle,
    explanation,
    const DeepCollectionEquality().hash(_answerCellList),
    correctAnswer,
  );

  /// Create a copy of QuizData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuizDataImplCopyWith<_$QuizDataImpl> get copyWith =>
      __$$QuizDataImplCopyWithImpl<_$QuizDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuizDataImplToJson(this);
  }
}

abstract class _QuizData implements QuizData {
  const factory _QuizData({
    required final int questionId,
    required final String question,
    required final int answerCellType,
    final List<int>? selectedOptions,
    final String? answerSectionTitle,
    required final String explanation,
    required final List<QuizAnswerCell> answerCellList,
    required final QuizCorrectAnswer correctAnswer,
  }) = _$QuizDataImpl;

  factory _QuizData.fromJson(Map<String, dynamic> json) =
      _$QuizDataImpl.fromJson;

  @override
  int get questionId;
  @override
  String get question;
  @override
  int get answerCellType;
  @override
  List<int>? get selectedOptions;
  @override
  String? get answerSectionTitle;
  @override
  String get explanation;
  @override
  List<QuizAnswerCell> get answerCellList;
  @override
  QuizCorrectAnswer get correctAnswer;

  /// Create a copy of QuizData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuizDataImplCopyWith<_$QuizDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

QuizAnswerCell _$QuizAnswerCellFromJson(Map<String, dynamic> json) {
  return _QuizAnswerCell.fromJson(json);
}

/// @nodoc
mixin _$QuizAnswerCell {
  int get answerId => throw _privateConstructorUsedError;
  int get questionId => throw _privateConstructorUsedError;
  String get data => throw _privateConstructorUsedError;
  bool get isItAnswer => throw _privateConstructorUsedError;
  int get position => throw _privateConstructorUsedError;

  /// Serializes this QuizAnswerCell to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of QuizAnswerCell
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QuizAnswerCellCopyWith<QuizAnswerCell> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizAnswerCellCopyWith<$Res> {
  factory $QuizAnswerCellCopyWith(
    QuizAnswerCell value,
    $Res Function(QuizAnswerCell) then,
  ) = _$QuizAnswerCellCopyWithImpl<$Res, QuizAnswerCell>;
  @useResult
  $Res call({
    int answerId,
    int questionId,
    String data,
    bool isItAnswer,
    int position,
  });
}

/// @nodoc
class _$QuizAnswerCellCopyWithImpl<$Res, $Val extends QuizAnswerCell>
    implements $QuizAnswerCellCopyWith<$Res> {
  _$QuizAnswerCellCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QuizAnswerCell
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? answerId = null,
    Object? questionId = null,
    Object? data = null,
    Object? isItAnswer = null,
    Object? position = null,
  }) {
    return _then(
      _value.copyWith(
            answerId:
                null == answerId
                    ? _value.answerId
                    : answerId // ignore: cast_nullable_to_non_nullable
                        as int,
            questionId:
                null == questionId
                    ? _value.questionId
                    : questionId // ignore: cast_nullable_to_non_nullable
                        as int,
            data:
                null == data
                    ? _value.data
                    : data // ignore: cast_nullable_to_non_nullable
                        as String,
            isItAnswer:
                null == isItAnswer
                    ? _value.isItAnswer
                    : isItAnswer // ignore: cast_nullable_to_non_nullable
                        as bool,
            position:
                null == position
                    ? _value.position
                    : position // ignore: cast_nullable_to_non_nullable
                        as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$QuizAnswerCellImplCopyWith<$Res>
    implements $QuizAnswerCellCopyWith<$Res> {
  factory _$$QuizAnswerCellImplCopyWith(
    _$QuizAnswerCellImpl value,
    $Res Function(_$QuizAnswerCellImpl) then,
  ) = __$$QuizAnswerCellImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int answerId,
    int questionId,
    String data,
    bool isItAnswer,
    int position,
  });
}

/// @nodoc
class __$$QuizAnswerCellImplCopyWithImpl<$Res>
    extends _$QuizAnswerCellCopyWithImpl<$Res, _$QuizAnswerCellImpl>
    implements _$$QuizAnswerCellImplCopyWith<$Res> {
  __$$QuizAnswerCellImplCopyWithImpl(
    _$QuizAnswerCellImpl _value,
    $Res Function(_$QuizAnswerCellImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of QuizAnswerCell
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? answerId = null,
    Object? questionId = null,
    Object? data = null,
    Object? isItAnswer = null,
    Object? position = null,
  }) {
    return _then(
      _$QuizAnswerCellImpl(
        answerId:
            null == answerId
                ? _value.answerId
                : answerId // ignore: cast_nullable_to_non_nullable
                    as int,
        questionId:
            null == questionId
                ? _value.questionId
                : questionId // ignore: cast_nullable_to_non_nullable
                    as int,
        data:
            null == data
                ? _value.data
                : data // ignore: cast_nullable_to_non_nullable
                    as String,
        isItAnswer:
            null == isItAnswer
                ? _value.isItAnswer
                : isItAnswer // ignore: cast_nullable_to_non_nullable
                    as bool,
        position:
            null == position
                ? _value.position
                : position // ignore: cast_nullable_to_non_nullable
                    as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$QuizAnswerCellImpl implements _QuizAnswerCell {
  const _$QuizAnswerCellImpl({
    required this.answerId,
    required this.questionId,
    required this.data,
    required this.isItAnswer,
    required this.position,
  });

  factory _$QuizAnswerCellImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuizAnswerCellImplFromJson(json);

  @override
  final int answerId;
  @override
  final int questionId;
  @override
  final String data;
  @override
  final bool isItAnswer;
  @override
  final int position;

  @override
  String toString() {
    return 'QuizAnswerCell(answerId: $answerId, questionId: $questionId, data: $data, isItAnswer: $isItAnswer, position: $position)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuizAnswerCellImpl &&
            (identical(other.answerId, answerId) ||
                other.answerId == answerId) &&
            (identical(other.questionId, questionId) ||
                other.questionId == questionId) &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.isItAnswer, isItAnswer) ||
                other.isItAnswer == isItAnswer) &&
            (identical(other.position, position) ||
                other.position == position));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    answerId,
    questionId,
    data,
    isItAnswer,
    position,
  );

  /// Create a copy of QuizAnswerCell
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuizAnswerCellImplCopyWith<_$QuizAnswerCellImpl> get copyWith =>
      __$$QuizAnswerCellImplCopyWithImpl<_$QuizAnswerCellImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$QuizAnswerCellImplToJson(this);
  }
}

abstract class _QuizAnswerCell implements QuizAnswerCell {
  const factory _QuizAnswerCell({
    required final int answerId,
    required final int questionId,
    required final String data,
    required final bool isItAnswer,
    required final int position,
  }) = _$QuizAnswerCellImpl;

  factory _QuizAnswerCell.fromJson(Map<String, dynamic> json) =
      _$QuizAnswerCellImpl.fromJson;

  @override
  int get answerId;
  @override
  int get questionId;
  @override
  String get data;
  @override
  bool get isItAnswer;
  @override
  int get position;

  /// Create a copy of QuizAnswerCell
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuizAnswerCellImplCopyWith<_$QuizAnswerCellImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

QuizCorrectAnswer _$QuizCorrectAnswerFromJson(Map<String, dynamic> json) {
  return _QuizCorrectAnswer.fromJson(json);
}

/// @nodoc
mixin _$QuizCorrectAnswer {
  int get questionId => throw _privateConstructorUsedError;
  List<int> get answerId => throw _privateConstructorUsedError;
  List<String> get answer => throw _privateConstructorUsedError;
  String get explanation => throw _privateConstructorUsedError;

  /// Serializes this QuizCorrectAnswer to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of QuizCorrectAnswer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QuizCorrectAnswerCopyWith<QuizCorrectAnswer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizCorrectAnswerCopyWith<$Res> {
  factory $QuizCorrectAnswerCopyWith(
    QuizCorrectAnswer value,
    $Res Function(QuizCorrectAnswer) then,
  ) = _$QuizCorrectAnswerCopyWithImpl<$Res, QuizCorrectAnswer>;
  @useResult
  $Res call({
    int questionId,
    List<int> answerId,
    List<String> answer,
    String explanation,
  });
}

/// @nodoc
class _$QuizCorrectAnswerCopyWithImpl<$Res, $Val extends QuizCorrectAnswer>
    implements $QuizCorrectAnswerCopyWith<$Res> {
  _$QuizCorrectAnswerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QuizCorrectAnswer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? questionId = null,
    Object? answerId = null,
    Object? answer = null,
    Object? explanation = null,
  }) {
    return _then(
      _value.copyWith(
            questionId:
                null == questionId
                    ? _value.questionId
                    : questionId // ignore: cast_nullable_to_non_nullable
                        as int,
            answerId:
                null == answerId
                    ? _value.answerId
                    : answerId // ignore: cast_nullable_to_non_nullable
                        as List<int>,
            answer:
                null == answer
                    ? _value.answer
                    : answer // ignore: cast_nullable_to_non_nullable
                        as List<String>,
            explanation:
                null == explanation
                    ? _value.explanation
                    : explanation // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$QuizCorrectAnswerImplCopyWith<$Res>
    implements $QuizCorrectAnswerCopyWith<$Res> {
  factory _$$QuizCorrectAnswerImplCopyWith(
    _$QuizCorrectAnswerImpl value,
    $Res Function(_$QuizCorrectAnswerImpl) then,
  ) = __$$QuizCorrectAnswerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int questionId,
    List<int> answerId,
    List<String> answer,
    String explanation,
  });
}

/// @nodoc
class __$$QuizCorrectAnswerImplCopyWithImpl<$Res>
    extends _$QuizCorrectAnswerCopyWithImpl<$Res, _$QuizCorrectAnswerImpl>
    implements _$$QuizCorrectAnswerImplCopyWith<$Res> {
  __$$QuizCorrectAnswerImplCopyWithImpl(
    _$QuizCorrectAnswerImpl _value,
    $Res Function(_$QuizCorrectAnswerImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of QuizCorrectAnswer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? questionId = null,
    Object? answerId = null,
    Object? answer = null,
    Object? explanation = null,
  }) {
    return _then(
      _$QuizCorrectAnswerImpl(
        questionId:
            null == questionId
                ? _value.questionId
                : questionId // ignore: cast_nullable_to_non_nullable
                    as int,
        answerId:
            null == answerId
                ? _value._answerId
                : answerId // ignore: cast_nullable_to_non_nullable
                    as List<int>,
        answer:
            null == answer
                ? _value._answer
                : answer // ignore: cast_nullable_to_non_nullable
                    as List<String>,
        explanation:
            null == explanation
                ? _value.explanation
                : explanation // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$QuizCorrectAnswerImpl implements _QuizCorrectAnswer {
  const _$QuizCorrectAnswerImpl({
    required this.questionId,
    required final List<int> answerId,
    required final List<String> answer,
    required this.explanation,
  }) : _answerId = answerId,
       _answer = answer;

  factory _$QuizCorrectAnswerImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuizCorrectAnswerImplFromJson(json);

  @override
  final int questionId;
  final List<int> _answerId;
  @override
  List<int> get answerId {
    if (_answerId is EqualUnmodifiableListView) return _answerId;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_answerId);
  }

  final List<String> _answer;
  @override
  List<String> get answer {
    if (_answer is EqualUnmodifiableListView) return _answer;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_answer);
  }

  @override
  final String explanation;

  @override
  String toString() {
    return 'QuizCorrectAnswer(questionId: $questionId, answerId: $answerId, answer: $answer, explanation: $explanation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuizCorrectAnswerImpl &&
            (identical(other.questionId, questionId) ||
                other.questionId == questionId) &&
            const DeepCollectionEquality().equals(other._answerId, _answerId) &&
            const DeepCollectionEquality().equals(other._answer, _answer) &&
            (identical(other.explanation, explanation) ||
                other.explanation == explanation));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    questionId,
    const DeepCollectionEquality().hash(_answerId),
    const DeepCollectionEquality().hash(_answer),
    explanation,
  );

  /// Create a copy of QuizCorrectAnswer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuizCorrectAnswerImplCopyWith<_$QuizCorrectAnswerImpl> get copyWith =>
      __$$QuizCorrectAnswerImplCopyWithImpl<_$QuizCorrectAnswerImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$QuizCorrectAnswerImplToJson(this);
  }
}

abstract class _QuizCorrectAnswer implements QuizCorrectAnswer {
  const factory _QuizCorrectAnswer({
    required final int questionId,
    required final List<int> answerId,
    required final List<String> answer,
    required final String explanation,
  }) = _$QuizCorrectAnswerImpl;

  factory _QuizCorrectAnswer.fromJson(Map<String, dynamic> json) =
      _$QuizCorrectAnswerImpl.fromJson;

  @override
  int get questionId;
  @override
  List<int> get answerId;
  @override
  List<String> get answer;
  @override
  String get explanation;

  /// Create a copy of QuizCorrectAnswer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuizCorrectAnswerImplCopyWith<_$QuizCorrectAnswerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
