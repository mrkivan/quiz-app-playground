// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz_intent.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$QuizIntent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(QuizScreenData data) loadQuiz,
    required TResult Function() nextQuestion,
    required TResult Function() skipQuestion,
    required TResult Function(List<int> answers) updateSelectedAnswers,
    required TResult Function() submitAnswer,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(QuizScreenData data)? loadQuiz,
    TResult? Function()? nextQuestion,
    TResult? Function()? skipQuestion,
    TResult? Function(List<int> answers)? updateSelectedAnswers,
    TResult? Function()? submitAnswer,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(QuizScreenData data)? loadQuiz,
    TResult Function()? nextQuestion,
    TResult Function()? skipQuestion,
    TResult Function(List<int> answers)? updateSelectedAnswers,
    TResult Function()? submitAnswer,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadQuiz value) loadQuiz,
    required TResult Function(NextQuestion value) nextQuestion,
    required TResult Function(SkipQuestion value) skipQuestion,
    required TResult Function(UpdateSelectedAnswers value)
    updateSelectedAnswers,
    required TResult Function(SubmitAnswer value) submitAnswer,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadQuiz value)? loadQuiz,
    TResult? Function(NextQuestion value)? nextQuestion,
    TResult? Function(SkipQuestion value)? skipQuestion,
    TResult? Function(UpdateSelectedAnswers value)? updateSelectedAnswers,
    TResult? Function(SubmitAnswer value)? submitAnswer,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadQuiz value)? loadQuiz,
    TResult Function(NextQuestion value)? nextQuestion,
    TResult Function(SkipQuestion value)? skipQuestion,
    TResult Function(UpdateSelectedAnswers value)? updateSelectedAnswers,
    TResult Function(SubmitAnswer value)? submitAnswer,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizIntentCopyWith<$Res> {
  factory $QuizIntentCopyWith(
    QuizIntent value,
    $Res Function(QuizIntent) then,
  ) = _$QuizIntentCopyWithImpl<$Res, QuizIntent>;
}

/// @nodoc
class _$QuizIntentCopyWithImpl<$Res, $Val extends QuizIntent>
    implements $QuizIntentCopyWith<$Res> {
  _$QuizIntentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QuizIntent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LoadQuizImplCopyWith<$Res> {
  factory _$$LoadQuizImplCopyWith(
    _$LoadQuizImpl value,
    $Res Function(_$LoadQuizImpl) then,
  ) = __$$LoadQuizImplCopyWithImpl<$Res>;
  @useResult
  $Res call({QuizScreenData data});

  $QuizScreenDataCopyWith<$Res> get data;
}

/// @nodoc
class __$$LoadQuizImplCopyWithImpl<$Res>
    extends _$QuizIntentCopyWithImpl<$Res, _$LoadQuizImpl>
    implements _$$LoadQuizImplCopyWith<$Res> {
  __$$LoadQuizImplCopyWithImpl(
    _$LoadQuizImpl _value,
    $Res Function(_$LoadQuizImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of QuizIntent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? data = null}) {
    return _then(
      _$LoadQuizImpl(
        null == data
            ? _value.data
            : data // ignore: cast_nullable_to_non_nullable
                as QuizScreenData,
      ),
    );
  }

  /// Create a copy of QuizIntent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $QuizScreenDataCopyWith<$Res> get data {
    return $QuizScreenDataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value));
    });
  }
}

/// @nodoc

class _$LoadQuizImpl implements LoadQuiz {
  const _$LoadQuizImpl(this.data);

  @override
  final QuizScreenData data;

  @override
  String toString() {
    return 'QuizIntent.loadQuiz(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadQuizImpl &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data);

  /// Create a copy of QuizIntent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadQuizImplCopyWith<_$LoadQuizImpl> get copyWith =>
      __$$LoadQuizImplCopyWithImpl<_$LoadQuizImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(QuizScreenData data) loadQuiz,
    required TResult Function() nextQuestion,
    required TResult Function() skipQuestion,
    required TResult Function(List<int> answers) updateSelectedAnswers,
    required TResult Function() submitAnswer,
  }) {
    return loadQuiz(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(QuizScreenData data)? loadQuiz,
    TResult? Function()? nextQuestion,
    TResult? Function()? skipQuestion,
    TResult? Function(List<int> answers)? updateSelectedAnswers,
    TResult? Function()? submitAnswer,
  }) {
    return loadQuiz?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(QuizScreenData data)? loadQuiz,
    TResult Function()? nextQuestion,
    TResult Function()? skipQuestion,
    TResult Function(List<int> answers)? updateSelectedAnswers,
    TResult Function()? submitAnswer,
    required TResult orElse(),
  }) {
    if (loadQuiz != null) {
      return loadQuiz(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadQuiz value) loadQuiz,
    required TResult Function(NextQuestion value) nextQuestion,
    required TResult Function(SkipQuestion value) skipQuestion,
    required TResult Function(UpdateSelectedAnswers value)
    updateSelectedAnswers,
    required TResult Function(SubmitAnswer value) submitAnswer,
  }) {
    return loadQuiz(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadQuiz value)? loadQuiz,
    TResult? Function(NextQuestion value)? nextQuestion,
    TResult? Function(SkipQuestion value)? skipQuestion,
    TResult? Function(UpdateSelectedAnswers value)? updateSelectedAnswers,
    TResult? Function(SubmitAnswer value)? submitAnswer,
  }) {
    return loadQuiz?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadQuiz value)? loadQuiz,
    TResult Function(NextQuestion value)? nextQuestion,
    TResult Function(SkipQuestion value)? skipQuestion,
    TResult Function(UpdateSelectedAnswers value)? updateSelectedAnswers,
    TResult Function(SubmitAnswer value)? submitAnswer,
    required TResult orElse(),
  }) {
    if (loadQuiz != null) {
      return loadQuiz(this);
    }
    return orElse();
  }
}

abstract class LoadQuiz implements QuizIntent {
  const factory LoadQuiz(final QuizScreenData data) = _$LoadQuizImpl;

  QuizScreenData get data;

  /// Create a copy of QuizIntent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadQuizImplCopyWith<_$LoadQuizImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NextQuestionImplCopyWith<$Res> {
  factory _$$NextQuestionImplCopyWith(
    _$NextQuestionImpl value,
    $Res Function(_$NextQuestionImpl) then,
  ) = __$$NextQuestionImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NextQuestionImplCopyWithImpl<$Res>
    extends _$QuizIntentCopyWithImpl<$Res, _$NextQuestionImpl>
    implements _$$NextQuestionImplCopyWith<$Res> {
  __$$NextQuestionImplCopyWithImpl(
    _$NextQuestionImpl _value,
    $Res Function(_$NextQuestionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of QuizIntent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$NextQuestionImpl implements NextQuestion {
  const _$NextQuestionImpl();

  @override
  String toString() {
    return 'QuizIntent.nextQuestion()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$NextQuestionImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(QuizScreenData data) loadQuiz,
    required TResult Function() nextQuestion,
    required TResult Function() skipQuestion,
    required TResult Function(List<int> answers) updateSelectedAnswers,
    required TResult Function() submitAnswer,
  }) {
    return nextQuestion();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(QuizScreenData data)? loadQuiz,
    TResult? Function()? nextQuestion,
    TResult? Function()? skipQuestion,
    TResult? Function(List<int> answers)? updateSelectedAnswers,
    TResult? Function()? submitAnswer,
  }) {
    return nextQuestion?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(QuizScreenData data)? loadQuiz,
    TResult Function()? nextQuestion,
    TResult Function()? skipQuestion,
    TResult Function(List<int> answers)? updateSelectedAnswers,
    TResult Function()? submitAnswer,
    required TResult orElse(),
  }) {
    if (nextQuestion != null) {
      return nextQuestion();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadQuiz value) loadQuiz,
    required TResult Function(NextQuestion value) nextQuestion,
    required TResult Function(SkipQuestion value) skipQuestion,
    required TResult Function(UpdateSelectedAnswers value)
    updateSelectedAnswers,
    required TResult Function(SubmitAnswer value) submitAnswer,
  }) {
    return nextQuestion(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadQuiz value)? loadQuiz,
    TResult? Function(NextQuestion value)? nextQuestion,
    TResult? Function(SkipQuestion value)? skipQuestion,
    TResult? Function(UpdateSelectedAnswers value)? updateSelectedAnswers,
    TResult? Function(SubmitAnswer value)? submitAnswer,
  }) {
    return nextQuestion?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadQuiz value)? loadQuiz,
    TResult Function(NextQuestion value)? nextQuestion,
    TResult Function(SkipQuestion value)? skipQuestion,
    TResult Function(UpdateSelectedAnswers value)? updateSelectedAnswers,
    TResult Function(SubmitAnswer value)? submitAnswer,
    required TResult orElse(),
  }) {
    if (nextQuestion != null) {
      return nextQuestion(this);
    }
    return orElse();
  }
}

abstract class NextQuestion implements QuizIntent {
  const factory NextQuestion() = _$NextQuestionImpl;
}

/// @nodoc
abstract class _$$SkipQuestionImplCopyWith<$Res> {
  factory _$$SkipQuestionImplCopyWith(
    _$SkipQuestionImpl value,
    $Res Function(_$SkipQuestionImpl) then,
  ) = __$$SkipQuestionImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SkipQuestionImplCopyWithImpl<$Res>
    extends _$QuizIntentCopyWithImpl<$Res, _$SkipQuestionImpl>
    implements _$$SkipQuestionImplCopyWith<$Res> {
  __$$SkipQuestionImplCopyWithImpl(
    _$SkipQuestionImpl _value,
    $Res Function(_$SkipQuestionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of QuizIntent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SkipQuestionImpl implements SkipQuestion {
  const _$SkipQuestionImpl();

  @override
  String toString() {
    return 'QuizIntent.skipQuestion()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SkipQuestionImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(QuizScreenData data) loadQuiz,
    required TResult Function() nextQuestion,
    required TResult Function() skipQuestion,
    required TResult Function(List<int> answers) updateSelectedAnswers,
    required TResult Function() submitAnswer,
  }) {
    return skipQuestion();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(QuizScreenData data)? loadQuiz,
    TResult? Function()? nextQuestion,
    TResult? Function()? skipQuestion,
    TResult? Function(List<int> answers)? updateSelectedAnswers,
    TResult? Function()? submitAnswer,
  }) {
    return skipQuestion?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(QuizScreenData data)? loadQuiz,
    TResult Function()? nextQuestion,
    TResult Function()? skipQuestion,
    TResult Function(List<int> answers)? updateSelectedAnswers,
    TResult Function()? submitAnswer,
    required TResult orElse(),
  }) {
    if (skipQuestion != null) {
      return skipQuestion();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadQuiz value) loadQuiz,
    required TResult Function(NextQuestion value) nextQuestion,
    required TResult Function(SkipQuestion value) skipQuestion,
    required TResult Function(UpdateSelectedAnswers value)
    updateSelectedAnswers,
    required TResult Function(SubmitAnswer value) submitAnswer,
  }) {
    return skipQuestion(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadQuiz value)? loadQuiz,
    TResult? Function(NextQuestion value)? nextQuestion,
    TResult? Function(SkipQuestion value)? skipQuestion,
    TResult? Function(UpdateSelectedAnswers value)? updateSelectedAnswers,
    TResult? Function(SubmitAnswer value)? submitAnswer,
  }) {
    return skipQuestion?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadQuiz value)? loadQuiz,
    TResult Function(NextQuestion value)? nextQuestion,
    TResult Function(SkipQuestion value)? skipQuestion,
    TResult Function(UpdateSelectedAnswers value)? updateSelectedAnswers,
    TResult Function(SubmitAnswer value)? submitAnswer,
    required TResult orElse(),
  }) {
    if (skipQuestion != null) {
      return skipQuestion(this);
    }
    return orElse();
  }
}

abstract class SkipQuestion implements QuizIntent {
  const factory SkipQuestion() = _$SkipQuestionImpl;
}

/// @nodoc
abstract class _$$UpdateSelectedAnswersImplCopyWith<$Res> {
  factory _$$UpdateSelectedAnswersImplCopyWith(
    _$UpdateSelectedAnswersImpl value,
    $Res Function(_$UpdateSelectedAnswersImpl) then,
  ) = __$$UpdateSelectedAnswersImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<int> answers});
}

/// @nodoc
class __$$UpdateSelectedAnswersImplCopyWithImpl<$Res>
    extends _$QuizIntentCopyWithImpl<$Res, _$UpdateSelectedAnswersImpl>
    implements _$$UpdateSelectedAnswersImplCopyWith<$Res> {
  __$$UpdateSelectedAnswersImplCopyWithImpl(
    _$UpdateSelectedAnswersImpl _value,
    $Res Function(_$UpdateSelectedAnswersImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of QuizIntent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? answers = null}) {
    return _then(
      _$UpdateSelectedAnswersImpl(
        null == answers
            ? _value._answers
            : answers // ignore: cast_nullable_to_non_nullable
                as List<int>,
      ),
    );
  }
}

/// @nodoc

class _$UpdateSelectedAnswersImpl implements UpdateSelectedAnswers {
  const _$UpdateSelectedAnswersImpl(final List<int> answers)
    : _answers = answers;

  final List<int> _answers;
  @override
  List<int> get answers {
    if (_answers is EqualUnmodifiableListView) return _answers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_answers);
  }

  @override
  String toString() {
    return 'QuizIntent.updateSelectedAnswers(answers: $answers)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateSelectedAnswersImpl &&
            const DeepCollectionEquality().equals(other._answers, _answers));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_answers));

  /// Create a copy of QuizIntent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateSelectedAnswersImplCopyWith<_$UpdateSelectedAnswersImpl>
  get copyWith =>
      __$$UpdateSelectedAnswersImplCopyWithImpl<_$UpdateSelectedAnswersImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(QuizScreenData data) loadQuiz,
    required TResult Function() nextQuestion,
    required TResult Function() skipQuestion,
    required TResult Function(List<int> answers) updateSelectedAnswers,
    required TResult Function() submitAnswer,
  }) {
    return updateSelectedAnswers(answers);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(QuizScreenData data)? loadQuiz,
    TResult? Function()? nextQuestion,
    TResult? Function()? skipQuestion,
    TResult? Function(List<int> answers)? updateSelectedAnswers,
    TResult? Function()? submitAnswer,
  }) {
    return updateSelectedAnswers?.call(answers);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(QuizScreenData data)? loadQuiz,
    TResult Function()? nextQuestion,
    TResult Function()? skipQuestion,
    TResult Function(List<int> answers)? updateSelectedAnswers,
    TResult Function()? submitAnswer,
    required TResult orElse(),
  }) {
    if (updateSelectedAnswers != null) {
      return updateSelectedAnswers(answers);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadQuiz value) loadQuiz,
    required TResult Function(NextQuestion value) nextQuestion,
    required TResult Function(SkipQuestion value) skipQuestion,
    required TResult Function(UpdateSelectedAnswers value)
    updateSelectedAnswers,
    required TResult Function(SubmitAnswer value) submitAnswer,
  }) {
    return updateSelectedAnswers(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadQuiz value)? loadQuiz,
    TResult? Function(NextQuestion value)? nextQuestion,
    TResult? Function(SkipQuestion value)? skipQuestion,
    TResult? Function(UpdateSelectedAnswers value)? updateSelectedAnswers,
    TResult? Function(SubmitAnswer value)? submitAnswer,
  }) {
    return updateSelectedAnswers?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadQuiz value)? loadQuiz,
    TResult Function(NextQuestion value)? nextQuestion,
    TResult Function(SkipQuestion value)? skipQuestion,
    TResult Function(UpdateSelectedAnswers value)? updateSelectedAnswers,
    TResult Function(SubmitAnswer value)? submitAnswer,
    required TResult orElse(),
  }) {
    if (updateSelectedAnswers != null) {
      return updateSelectedAnswers(this);
    }
    return orElse();
  }
}

abstract class UpdateSelectedAnswers implements QuizIntent {
  const factory UpdateSelectedAnswers(final List<int> answers) =
      _$UpdateSelectedAnswersImpl;

  List<int> get answers;

  /// Create a copy of QuizIntent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateSelectedAnswersImplCopyWith<_$UpdateSelectedAnswersImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SubmitAnswerImplCopyWith<$Res> {
  factory _$$SubmitAnswerImplCopyWith(
    _$SubmitAnswerImpl value,
    $Res Function(_$SubmitAnswerImpl) then,
  ) = __$$SubmitAnswerImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SubmitAnswerImplCopyWithImpl<$Res>
    extends _$QuizIntentCopyWithImpl<$Res, _$SubmitAnswerImpl>
    implements _$$SubmitAnswerImplCopyWith<$Res> {
  __$$SubmitAnswerImplCopyWithImpl(
    _$SubmitAnswerImpl _value,
    $Res Function(_$SubmitAnswerImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of QuizIntent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SubmitAnswerImpl implements SubmitAnswer {
  const _$SubmitAnswerImpl();

  @override
  String toString() {
    return 'QuizIntent.submitAnswer()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SubmitAnswerImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(QuizScreenData data) loadQuiz,
    required TResult Function() nextQuestion,
    required TResult Function() skipQuestion,
    required TResult Function(List<int> answers) updateSelectedAnswers,
    required TResult Function() submitAnswer,
  }) {
    return submitAnswer();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(QuizScreenData data)? loadQuiz,
    TResult? Function()? nextQuestion,
    TResult? Function()? skipQuestion,
    TResult? Function(List<int> answers)? updateSelectedAnswers,
    TResult? Function()? submitAnswer,
  }) {
    return submitAnswer?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(QuizScreenData data)? loadQuiz,
    TResult Function()? nextQuestion,
    TResult Function()? skipQuestion,
    TResult Function(List<int> answers)? updateSelectedAnswers,
    TResult Function()? submitAnswer,
    required TResult orElse(),
  }) {
    if (submitAnswer != null) {
      return submitAnswer();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadQuiz value) loadQuiz,
    required TResult Function(NextQuestion value) nextQuestion,
    required TResult Function(SkipQuestion value) skipQuestion,
    required TResult Function(UpdateSelectedAnswers value)
    updateSelectedAnswers,
    required TResult Function(SubmitAnswer value) submitAnswer,
  }) {
    return submitAnswer(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadQuiz value)? loadQuiz,
    TResult? Function(NextQuestion value)? nextQuestion,
    TResult? Function(SkipQuestion value)? skipQuestion,
    TResult? Function(UpdateSelectedAnswers value)? updateSelectedAnswers,
    TResult? Function(SubmitAnswer value)? submitAnswer,
  }) {
    return submitAnswer?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadQuiz value)? loadQuiz,
    TResult Function(NextQuestion value)? nextQuestion,
    TResult Function(SkipQuestion value)? skipQuestion,
    TResult Function(UpdateSelectedAnswers value)? updateSelectedAnswers,
    TResult Function(SubmitAnswer value)? submitAnswer,
    required TResult orElse(),
  }) {
    if (submitAnswer != null) {
      return submitAnswer(this);
    }
    return orElse();
  }
}

abstract class SubmitAnswer implements QuizIntent {
  const factory SubmitAnswer() = _$SubmitAnswerImpl;
}
