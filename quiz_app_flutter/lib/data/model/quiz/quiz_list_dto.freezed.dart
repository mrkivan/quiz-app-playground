// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz_list_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

QuizListDto _$QuizListDtoFromJson(Map<String, dynamic> json) {
  return _QuizListDto.fromJson(json);
}

/// @nodoc
mixin _$QuizListDto {
  int get total => throw _privateConstructorUsedError;
  List<QuizItemDto> get items => throw _privateConstructorUsedError;

  /// Serializes this QuizListDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of QuizListDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QuizListDtoCopyWith<QuizListDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizListDtoCopyWith<$Res> {
  factory $QuizListDtoCopyWith(
    QuizListDto value,
    $Res Function(QuizListDto) then,
  ) = _$QuizListDtoCopyWithImpl<$Res, QuizListDto>;
  @useResult
  $Res call({int total, List<QuizItemDto> items});
}

/// @nodoc
class _$QuizListDtoCopyWithImpl<$Res, $Val extends QuizListDto>
    implements $QuizListDtoCopyWith<$Res> {
  _$QuizListDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QuizListDto
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
                        as List<QuizItemDto>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$QuizListDtoImplCopyWith<$Res>
    implements $QuizListDtoCopyWith<$Res> {
  factory _$$QuizListDtoImplCopyWith(
    _$QuizListDtoImpl value,
    $Res Function(_$QuizListDtoImpl) then,
  ) = __$$QuizListDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int total, List<QuizItemDto> items});
}

/// @nodoc
class __$$QuizListDtoImplCopyWithImpl<$Res>
    extends _$QuizListDtoCopyWithImpl<$Res, _$QuizListDtoImpl>
    implements _$$QuizListDtoImplCopyWith<$Res> {
  __$$QuizListDtoImplCopyWithImpl(
    _$QuizListDtoImpl _value,
    $Res Function(_$QuizListDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of QuizListDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? total = null, Object? items = null}) {
    return _then(
      _$QuizListDtoImpl(
        total:
            null == total
                ? _value.total
                : total // ignore: cast_nullable_to_non_nullable
                    as int,
        items:
            null == items
                ? _value._items
                : items // ignore: cast_nullable_to_non_nullable
                    as List<QuizItemDto>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$QuizListDtoImpl implements _QuizListDto {
  const _$QuizListDtoImpl({
    required this.total,
    required final List<QuizItemDto> items,
  }) : _items = items;

  factory _$QuizListDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuizListDtoImplFromJson(json);

  @override
  final int total;
  final List<QuizItemDto> _items;
  @override
  List<QuizItemDto> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'QuizListDto(total: $total, items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuizListDtoImpl &&
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

  /// Create a copy of QuizListDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuizListDtoImplCopyWith<_$QuizListDtoImpl> get copyWith =>
      __$$QuizListDtoImplCopyWithImpl<_$QuizListDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuizListDtoImplToJson(this);
  }
}

abstract class _QuizListDto implements QuizListDto {
  const factory _QuizListDto({
    required final int total,
    required final List<QuizItemDto> items,
  }) = _$QuizListDtoImpl;

  factory _QuizListDto.fromJson(Map<String, dynamic> json) =
      _$QuizListDtoImpl.fromJson;

  @override
  int get total;
  @override
  List<QuizItemDto> get items;

  /// Create a copy of QuizListDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuizListDtoImplCopyWith<_$QuizListDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

QuizItemDto _$QuizItemDtoFromJson(Map<String, dynamic> json) {
  return _QuizItemDto.fromJson(json);
}

/// @nodoc
mixin _$QuizItemDto {
  int get questionId => throw _privateConstructorUsedError;
  String get question => throw _privateConstructorUsedError;
  int get answerCellType => throw _privateConstructorUsedError;
  List<int>? get selectedOptions => throw _privateConstructorUsedError;
  String? get answerSectionTitle => throw _privateConstructorUsedError;
  String get explanation => throw _privateConstructorUsedError;
  List<AnswerCellDto> get answerCellList => throw _privateConstructorUsedError;
  CorrectAnswerDto get correctAnswer => throw _privateConstructorUsedError;

  /// Serializes this QuizItemDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of QuizItemDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QuizItemDtoCopyWith<QuizItemDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizItemDtoCopyWith<$Res> {
  factory $QuizItemDtoCopyWith(
    QuizItemDto value,
    $Res Function(QuizItemDto) then,
  ) = _$QuizItemDtoCopyWithImpl<$Res, QuizItemDto>;
  @useResult
  $Res call({
    int questionId,
    String question,
    int answerCellType,
    List<int>? selectedOptions,
    String? answerSectionTitle,
    String explanation,
    List<AnswerCellDto> answerCellList,
    CorrectAnswerDto correctAnswer,
  });

  $CorrectAnswerDtoCopyWith<$Res> get correctAnswer;
}

/// @nodoc
class _$QuizItemDtoCopyWithImpl<$Res, $Val extends QuizItemDto>
    implements $QuizItemDtoCopyWith<$Res> {
  _$QuizItemDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QuizItemDto
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
                        as List<AnswerCellDto>,
            correctAnswer:
                null == correctAnswer
                    ? _value.correctAnswer
                    : correctAnswer // ignore: cast_nullable_to_non_nullable
                        as CorrectAnswerDto,
          )
          as $Val,
    );
  }

  /// Create a copy of QuizItemDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CorrectAnswerDtoCopyWith<$Res> get correctAnswer {
    return $CorrectAnswerDtoCopyWith<$Res>(_value.correctAnswer, (value) {
      return _then(_value.copyWith(correctAnswer: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$QuizItemDtoImplCopyWith<$Res>
    implements $QuizItemDtoCopyWith<$Res> {
  factory _$$QuizItemDtoImplCopyWith(
    _$QuizItemDtoImpl value,
    $Res Function(_$QuizItemDtoImpl) then,
  ) = __$$QuizItemDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int questionId,
    String question,
    int answerCellType,
    List<int>? selectedOptions,
    String? answerSectionTitle,
    String explanation,
    List<AnswerCellDto> answerCellList,
    CorrectAnswerDto correctAnswer,
  });

  @override
  $CorrectAnswerDtoCopyWith<$Res> get correctAnswer;
}

/// @nodoc
class __$$QuizItemDtoImplCopyWithImpl<$Res>
    extends _$QuizItemDtoCopyWithImpl<$Res, _$QuizItemDtoImpl>
    implements _$$QuizItemDtoImplCopyWith<$Res> {
  __$$QuizItemDtoImplCopyWithImpl(
    _$QuizItemDtoImpl _value,
    $Res Function(_$QuizItemDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of QuizItemDto
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
      _$QuizItemDtoImpl(
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
                    as List<AnswerCellDto>,
        correctAnswer:
            null == correctAnswer
                ? _value.correctAnswer
                : correctAnswer // ignore: cast_nullable_to_non_nullable
                    as CorrectAnswerDto,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$QuizItemDtoImpl implements _QuizItemDto {
  const _$QuizItemDtoImpl({
    required this.questionId,
    required this.question,
    required this.answerCellType,
    final List<int>? selectedOptions,
    this.answerSectionTitle,
    required this.explanation,
    required final List<AnswerCellDto> answerCellList,
    required this.correctAnswer,
  }) : _selectedOptions = selectedOptions,
       _answerCellList = answerCellList;

  factory _$QuizItemDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuizItemDtoImplFromJson(json);

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
  final List<AnswerCellDto> _answerCellList;
  @override
  List<AnswerCellDto> get answerCellList {
    if (_answerCellList is EqualUnmodifiableListView) return _answerCellList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_answerCellList);
  }

  @override
  final CorrectAnswerDto correctAnswer;

  @override
  String toString() {
    return 'QuizItemDto(questionId: $questionId, question: $question, answerCellType: $answerCellType, selectedOptions: $selectedOptions, answerSectionTitle: $answerSectionTitle, explanation: $explanation, answerCellList: $answerCellList, correctAnswer: $correctAnswer)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuizItemDtoImpl &&
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

  /// Create a copy of QuizItemDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuizItemDtoImplCopyWith<_$QuizItemDtoImpl> get copyWith =>
      __$$QuizItemDtoImplCopyWithImpl<_$QuizItemDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuizItemDtoImplToJson(this);
  }
}

abstract class _QuizItemDto implements QuizItemDto {
  const factory _QuizItemDto({
    required final int questionId,
    required final String question,
    required final int answerCellType,
    final List<int>? selectedOptions,
    final String? answerSectionTitle,
    required final String explanation,
    required final List<AnswerCellDto> answerCellList,
    required final CorrectAnswerDto correctAnswer,
  }) = _$QuizItemDtoImpl;

  factory _QuizItemDto.fromJson(Map<String, dynamic> json) =
      _$QuizItemDtoImpl.fromJson;

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
  List<AnswerCellDto> get answerCellList;
  @override
  CorrectAnswerDto get correctAnswer;

  /// Create a copy of QuizItemDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuizItemDtoImplCopyWith<_$QuizItemDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AnswerCellDto _$AnswerCellDtoFromJson(Map<String, dynamic> json) {
  return _AnswerCellDto.fromJson(json);
}

/// @nodoc
mixin _$AnswerCellDto {
  int get answerId => throw _privateConstructorUsedError;
  int get questionId => throw _privateConstructorUsedError;
  String get data => throw _privateConstructorUsedError;
  bool get isItAnswer => throw _privateConstructorUsedError;
  int get position => throw _privateConstructorUsedError;

  /// Serializes this AnswerCellDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AnswerCellDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AnswerCellDtoCopyWith<AnswerCellDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnswerCellDtoCopyWith<$Res> {
  factory $AnswerCellDtoCopyWith(
    AnswerCellDto value,
    $Res Function(AnswerCellDto) then,
  ) = _$AnswerCellDtoCopyWithImpl<$Res, AnswerCellDto>;
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
class _$AnswerCellDtoCopyWithImpl<$Res, $Val extends AnswerCellDto>
    implements $AnswerCellDtoCopyWith<$Res> {
  _$AnswerCellDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AnswerCellDto
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
abstract class _$$AnswerCellDtoImplCopyWith<$Res>
    implements $AnswerCellDtoCopyWith<$Res> {
  factory _$$AnswerCellDtoImplCopyWith(
    _$AnswerCellDtoImpl value,
    $Res Function(_$AnswerCellDtoImpl) then,
  ) = __$$AnswerCellDtoImplCopyWithImpl<$Res>;
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
class __$$AnswerCellDtoImplCopyWithImpl<$Res>
    extends _$AnswerCellDtoCopyWithImpl<$Res, _$AnswerCellDtoImpl>
    implements _$$AnswerCellDtoImplCopyWith<$Res> {
  __$$AnswerCellDtoImplCopyWithImpl(
    _$AnswerCellDtoImpl _value,
    $Res Function(_$AnswerCellDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AnswerCellDto
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
      _$AnswerCellDtoImpl(
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
class _$AnswerCellDtoImpl implements _AnswerCellDto {
  const _$AnswerCellDtoImpl({
    required this.answerId,
    required this.questionId,
    required this.data,
    required this.isItAnswer,
    required this.position,
  });

  factory _$AnswerCellDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnswerCellDtoImplFromJson(json);

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
    return 'AnswerCellDto(answerId: $answerId, questionId: $questionId, data: $data, isItAnswer: $isItAnswer, position: $position)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnswerCellDtoImpl &&
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

  /// Create a copy of AnswerCellDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AnswerCellDtoImplCopyWith<_$AnswerCellDtoImpl> get copyWith =>
      __$$AnswerCellDtoImplCopyWithImpl<_$AnswerCellDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AnswerCellDtoImplToJson(this);
  }
}

abstract class _AnswerCellDto implements AnswerCellDto {
  const factory _AnswerCellDto({
    required final int answerId,
    required final int questionId,
    required final String data,
    required final bool isItAnswer,
    required final int position,
  }) = _$AnswerCellDtoImpl;

  factory _AnswerCellDto.fromJson(Map<String, dynamic> json) =
      _$AnswerCellDtoImpl.fromJson;

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

  /// Create a copy of AnswerCellDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AnswerCellDtoImplCopyWith<_$AnswerCellDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CorrectAnswerDto _$CorrectAnswerDtoFromJson(Map<String, dynamic> json) {
  return _CorrectAnswerDto.fromJson(json);
}

/// @nodoc
mixin _$CorrectAnswerDto {
  int get questionId => throw _privateConstructorUsedError;
  List<int> get answerId => throw _privateConstructorUsedError;
  List<String> get answer => throw _privateConstructorUsedError;
  String get explanation => throw _privateConstructorUsedError;

  /// Serializes this CorrectAnswerDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CorrectAnswerDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CorrectAnswerDtoCopyWith<CorrectAnswerDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CorrectAnswerDtoCopyWith<$Res> {
  factory $CorrectAnswerDtoCopyWith(
    CorrectAnswerDto value,
    $Res Function(CorrectAnswerDto) then,
  ) = _$CorrectAnswerDtoCopyWithImpl<$Res, CorrectAnswerDto>;
  @useResult
  $Res call({
    int questionId,
    List<int> answerId,
    List<String> answer,
    String explanation,
  });
}

/// @nodoc
class _$CorrectAnswerDtoCopyWithImpl<$Res, $Val extends CorrectAnswerDto>
    implements $CorrectAnswerDtoCopyWith<$Res> {
  _$CorrectAnswerDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CorrectAnswerDto
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
abstract class _$$CorrectAnswerDtoImplCopyWith<$Res>
    implements $CorrectAnswerDtoCopyWith<$Res> {
  factory _$$CorrectAnswerDtoImplCopyWith(
    _$CorrectAnswerDtoImpl value,
    $Res Function(_$CorrectAnswerDtoImpl) then,
  ) = __$$CorrectAnswerDtoImplCopyWithImpl<$Res>;
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
class __$$CorrectAnswerDtoImplCopyWithImpl<$Res>
    extends _$CorrectAnswerDtoCopyWithImpl<$Res, _$CorrectAnswerDtoImpl>
    implements _$$CorrectAnswerDtoImplCopyWith<$Res> {
  __$$CorrectAnswerDtoImplCopyWithImpl(
    _$CorrectAnswerDtoImpl _value,
    $Res Function(_$CorrectAnswerDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CorrectAnswerDto
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
      _$CorrectAnswerDtoImpl(
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
class _$CorrectAnswerDtoImpl implements _CorrectAnswerDto {
  const _$CorrectAnswerDtoImpl({
    required this.questionId,
    required final List<int> answerId,
    required final List<String> answer,
    required this.explanation,
  }) : _answerId = answerId,
       _answer = answer;

  factory _$CorrectAnswerDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$CorrectAnswerDtoImplFromJson(json);

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
    return 'CorrectAnswerDto(questionId: $questionId, answerId: $answerId, answer: $answer, explanation: $explanation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CorrectAnswerDtoImpl &&
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

  /// Create a copy of CorrectAnswerDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CorrectAnswerDtoImplCopyWith<_$CorrectAnswerDtoImpl> get copyWith =>
      __$$CorrectAnswerDtoImplCopyWithImpl<_$CorrectAnswerDtoImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CorrectAnswerDtoImplToJson(this);
  }
}

abstract class _CorrectAnswerDto implements CorrectAnswerDto {
  const factory _CorrectAnswerDto({
    required final int questionId,
    required final List<int> answerId,
    required final List<String> answer,
    required final String explanation,
  }) = _$CorrectAnswerDtoImpl;

  factory _CorrectAnswerDto.fromJson(Map<String, dynamic> json) =
      _$CorrectAnswerDtoImpl.fromJson;

  @override
  int get questionId;
  @override
  List<int> get answerId;
  @override
  List<String> get answer;
  @override
  String get explanation;

  /// Create a copy of CorrectAnswerDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CorrectAnswerDtoImplCopyWith<_$CorrectAnswerDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
