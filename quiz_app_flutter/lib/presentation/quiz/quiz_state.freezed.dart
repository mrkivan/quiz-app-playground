// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$QuizState {
  List<int> get selectedAnswers => throw _privateConstructorUsedError;

  bool get isSubmitted => throw _privateConstructorUsedError;

  bool get showExplanation => throw _privateConstructorUsedError;

  bool get isLastItem => throw _privateConstructorUsedError;

  int get currentQuestionNumber => throw _privateConstructorUsedError;

  int get totalQuestions => throw _privateConstructorUsedError;

  /// Create a copy of QuizState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QuizStateCopyWith<QuizState> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizStateCopyWith<$Res> {
  factory $QuizStateCopyWith(QuizState value, $Res Function(QuizState) then) = _$QuizStateCopyWithImpl<$Res, QuizState>;

  @useResult
  $Res call({
    List<int> selectedAnswers,
    bool isSubmitted,
    bool showExplanation,
    bool isLastItem,
    int currentQuestionNumber,
    int totalQuestions,
  });
}

/// @nodoc
class _$QuizStateCopyWithImpl<$Res, $Val extends QuizState> implements $QuizStateCopyWith<$Res> {
  _$QuizStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;

  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QuizState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedAnswers = null,
    Object? isSubmitted = null,
    Object? showExplanation = null,
    Object? isLastItem = null,
    Object? currentQuestionNumber = null,
    Object? totalQuestions = null,
  }) {
    return _then(
      _value.copyWith(
            selectedAnswers:
                null == selectedAnswers
                    ? _value.selectedAnswers
                    : selectedAnswers // ignore: cast_nullable_to_non_nullable
                        as List<int>,
            isSubmitted:
                null == isSubmitted
                    ? _value.isSubmitted
                    : isSubmitted // ignore: cast_nullable_to_non_nullable
                        as bool,
            showExplanation:
                null == showExplanation
                    ? _value.showExplanation
                    : showExplanation // ignore: cast_nullable_to_non_nullable
                        as bool,
            isLastItem:
                null == isLastItem
                    ? _value.isLastItem
                    : isLastItem // ignore: cast_nullable_to_non_nullable
                        as bool,
            currentQuestionNumber:
                null == currentQuestionNumber
                    ? _value.currentQuestionNumber
                    : currentQuestionNumber // ignore: cast_nullable_to_non_nullable
                        as int,
            totalQuestions:
                null == totalQuestions
                    ? _value.totalQuestions
                    : totalQuestions // ignore: cast_nullable_to_non_nullable
                        as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$QuizStateImplCopyWith<$Res> implements $QuizStateCopyWith<$Res> {
  factory _$$QuizStateImplCopyWith(_$QuizStateImpl value, $Res Function(_$QuizStateImpl) then) =
      __$$QuizStateImplCopyWithImpl<$Res>;

  @override
  @useResult
  $Res call({
    List<int> selectedAnswers,
    bool isSubmitted,
    bool showExplanation,
    bool isLastItem,
    int currentQuestionNumber,
    int totalQuestions,
  });
}

/// @nodoc
class __$$QuizStateImplCopyWithImpl<$Res> extends _$QuizStateCopyWithImpl<$Res, _$QuizStateImpl>
    implements _$$QuizStateImplCopyWith<$Res> {
  __$$QuizStateImplCopyWithImpl(_$QuizStateImpl _value, $Res Function(_$QuizStateImpl) _then) : super(_value, _then);

  /// Create a copy of QuizState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedAnswers = null,
    Object? isSubmitted = null,
    Object? showExplanation = null,
    Object? isLastItem = null,
    Object? currentQuestionNumber = null,
    Object? totalQuestions = null,
  }) {
    return _then(
      _$QuizStateImpl(
        selectedAnswers:
            null == selectedAnswers
                ? _value._selectedAnswers
                : selectedAnswers // ignore: cast_nullable_to_non_nullable
                    as List<int>,
        isSubmitted:
            null == isSubmitted
                ? _value.isSubmitted
                : isSubmitted // ignore: cast_nullable_to_non_nullable
                    as bool,
        showExplanation:
            null == showExplanation
                ? _value.showExplanation
                : showExplanation // ignore: cast_nullable_to_non_nullable
                    as bool,
        isLastItem:
            null == isLastItem
                ? _value.isLastItem
                : isLastItem // ignore: cast_nullable_to_non_nullable
                    as bool,
        currentQuestionNumber:
            null == currentQuestionNumber
                ? _value.currentQuestionNumber
                : currentQuestionNumber // ignore: cast_nullable_to_non_nullable
                    as int,
        totalQuestions:
            null == totalQuestions
                ? _value.totalQuestions
                : totalQuestions // ignore: cast_nullable_to_non_nullable
                    as int,
      ),
    );
  }
}

/// @nodoc

class _$QuizStateImpl implements _QuizState {
  const _$QuizStateImpl({
    final List<int> selectedAnswers = const [],
    this.isSubmitted = false,
    this.showExplanation = false,
    this.isLastItem = false,
    this.currentQuestionNumber = 0,
    this.totalQuestions = 0,
  }) : _selectedAnswers = selectedAnswers;

  final List<int> _selectedAnswers;

  @override
  @JsonKey()
  List<int> get selectedAnswers {
    if (_selectedAnswers is EqualUnmodifiableListView) return _selectedAnswers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedAnswers);
  }

  @override
  @JsonKey()
  final bool isSubmitted;
  @override
  @JsonKey()
  final bool showExplanation;
  @override
  @JsonKey()
  final bool isLastItem;
  @override
  @JsonKey()
  final int currentQuestionNumber;
  @override
  @JsonKey()
  final int totalQuestions;

  @override
  String toString() {
    return 'QuizState(selectedAnswers: $selectedAnswers, isSubmitted: $isSubmitted, showExplanation: $showExplanation, isLastItem: $isLastItem, currentQuestionNumber: $currentQuestionNumber, totalQuestions: $totalQuestions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuizStateImpl &&
            const DeepCollectionEquality().equals(other._selectedAnswers, _selectedAnswers) &&
            (identical(other.isSubmitted, isSubmitted) || other.isSubmitted == isSubmitted) &&
            (identical(other.showExplanation, showExplanation) || other.showExplanation == showExplanation) &&
            (identical(other.isLastItem, isLastItem) || other.isLastItem == isLastItem) &&
            (identical(other.currentQuestionNumber, currentQuestionNumber) ||
                other.currentQuestionNumber == currentQuestionNumber) &&
            (identical(other.totalQuestions, totalQuestions) || other.totalQuestions == totalQuestions));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_selectedAnswers),
    isSubmitted,
    showExplanation,
    isLastItem,
    currentQuestionNumber,
    totalQuestions,
  );

  /// Create a copy of QuizState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuizStateImplCopyWith<_$QuizStateImpl> get copyWith =>
      __$$QuizStateImplCopyWithImpl<_$QuizStateImpl>(this, _$identity);
}

abstract class _QuizState implements QuizState {
  const factory _QuizState({
    final List<int> selectedAnswers,
    final bool isSubmitted,
    final bool showExplanation,
    final bool isLastItem,
    final int currentQuestionNumber,
    final int totalQuestions,
  }) = _$QuizStateImpl;

  @override
  List<int> get selectedAnswers;

  @override
  bool get isSubmitted;

  @override
  bool get showExplanation;

  @override
  bool get isLastItem;

  @override
  int get currentQuestionNumber;

  @override
  int get totalQuestions;

  /// Create a copy of QuizState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuizStateImplCopyWith<_$QuizStateImpl> get copyWith => throw _privateConstructorUsedError;
}
