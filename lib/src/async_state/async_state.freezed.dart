// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'async_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Async<T> {
  String get message => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;
  T? get data => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, String code, T? data)
        initializing,
    required TResult Function(String message, String code, T? data) refreshing,
    required TResult Function(String message, String code, T? data) loading,
    required TResult Function(String message, String code, T? data) success,
    required TResult Function(String message, String code, T? data) error,
    required TResult Function(String message, String code, T? data)
        uninitialized,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, String code, T? data)? initializing,
    TResult? Function(String message, String code, T? data)? refreshing,
    TResult? Function(String message, String code, T? data)? loading,
    TResult? Function(String message, String code, T? data)? success,
    TResult? Function(String message, String code, T? data)? error,
    TResult? Function(String message, String code, T? data)? uninitialized,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, String code, T? data)? initializing,
    TResult Function(String message, String code, T? data)? refreshing,
    TResult Function(String message, String code, T? data)? loading,
    TResult Function(String message, String code, T? data)? success,
    TResult Function(String message, String code, T? data)? error,
    TResult Function(String message, String code, T? data)? uninitialized,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initializing<T> value) initializing,
    required TResult Function(Refreshing<T> value) refreshing,
    required TResult Function(Loading<T> value) loading,
    required TResult Function(Success<T> value) success,
    required TResult Function(Error<T> value) error,
    required TResult Function(Uninitialized<T> value) uninitialized,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initializing<T> value)? initializing,
    TResult? Function(Refreshing<T> value)? refreshing,
    TResult? Function(Loading<T> value)? loading,
    TResult? Function(Success<T> value)? success,
    TResult? Function(Error<T> value)? error,
    TResult? Function(Uninitialized<T> value)? uninitialized,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initializing<T> value)? initializing,
    TResult Function(Refreshing<T> value)? refreshing,
    TResult Function(Loading<T> value)? loading,
    TResult Function(Success<T> value)? success,
    TResult Function(Error<T> value)? error,
    TResult Function(Uninitialized<T> value)? uninitialized,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AsyncCopyWith<T, Async<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AsyncCopyWith<T, $Res> {
  factory $AsyncCopyWith(Async<T> value, $Res Function(Async<T>) then) =
      _$AsyncCopyWithImpl<T, $Res, Async<T>>;
  @useResult
  $Res call({String message, String code, T? data});
}

/// @nodoc
class _$AsyncCopyWithImpl<T, $Res, $Val extends Async<T>>
    implements $AsyncCopyWith<T, $Res> {
  _$AsyncCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? code = null,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitializingCopyWith<T, $Res>
    implements $AsyncCopyWith<T, $Res> {
  factory _$$InitializingCopyWith(
          _$Initializing<T> value, $Res Function(_$Initializing<T>) then) =
      __$$InitializingCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({String message, String code, T? data});
}

/// @nodoc
class __$$InitializingCopyWithImpl<T, $Res>
    extends _$AsyncCopyWithImpl<T, $Res, _$Initializing<T>>
    implements _$$InitializingCopyWith<T, $Res> {
  __$$InitializingCopyWithImpl(
      _$Initializing<T> _value, $Res Function(_$Initializing<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? code = null,
    Object? data = freezed,
  }) {
    return _then(_$Initializing<T>(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T?,
    ));
  }
}

/// @nodoc

class _$Initializing<T> implements Initializing<T> {
  _$Initializing({this.message = "", this.code = "", this.data});

  @override
  @JsonKey()
  final String message;
  @override
  @JsonKey()
  final String code;
  @override
  final T? data;

  @override
  String toString() {
    return 'Async<$T>.initializing(message: $message, code: $code, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Initializing<T> &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code) &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, message, code, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitializingCopyWith<T, _$Initializing<T>> get copyWith =>
      __$$InitializingCopyWithImpl<T, _$Initializing<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, String code, T? data)
        initializing,
    required TResult Function(String message, String code, T? data) refreshing,
    required TResult Function(String message, String code, T? data) loading,
    required TResult Function(String message, String code, T? data) success,
    required TResult Function(String message, String code, T? data) error,
    required TResult Function(String message, String code, T? data)
        uninitialized,
  }) {
    return initializing(message, code, data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, String code, T? data)? initializing,
    TResult? Function(String message, String code, T? data)? refreshing,
    TResult? Function(String message, String code, T? data)? loading,
    TResult? Function(String message, String code, T? data)? success,
    TResult? Function(String message, String code, T? data)? error,
    TResult? Function(String message, String code, T? data)? uninitialized,
  }) {
    return initializing?.call(message, code, data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, String code, T? data)? initializing,
    TResult Function(String message, String code, T? data)? refreshing,
    TResult Function(String message, String code, T? data)? loading,
    TResult Function(String message, String code, T? data)? success,
    TResult Function(String message, String code, T? data)? error,
    TResult Function(String message, String code, T? data)? uninitialized,
    required TResult orElse(),
  }) {
    if (initializing != null) {
      return initializing(message, code, data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initializing<T> value) initializing,
    required TResult Function(Refreshing<T> value) refreshing,
    required TResult Function(Loading<T> value) loading,
    required TResult Function(Success<T> value) success,
    required TResult Function(Error<T> value) error,
    required TResult Function(Uninitialized<T> value) uninitialized,
  }) {
    return initializing(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initializing<T> value)? initializing,
    TResult? Function(Refreshing<T> value)? refreshing,
    TResult? Function(Loading<T> value)? loading,
    TResult? Function(Success<T> value)? success,
    TResult? Function(Error<T> value)? error,
    TResult? Function(Uninitialized<T> value)? uninitialized,
  }) {
    return initializing?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initializing<T> value)? initializing,
    TResult Function(Refreshing<T> value)? refreshing,
    TResult Function(Loading<T> value)? loading,
    TResult Function(Success<T> value)? success,
    TResult Function(Error<T> value)? error,
    TResult Function(Uninitialized<T> value)? uninitialized,
    required TResult orElse(),
  }) {
    if (initializing != null) {
      return initializing(this);
    }
    return orElse();
  }
}

abstract class Initializing<T> implements Async<T>, _AsyncData<T> {
  factory Initializing(
      {final String message,
      final String code,
      final T? data}) = _$Initializing<T>;

  @override
  String get message;
  @override
  String get code;
  @override
  T? get data;
  @override
  @JsonKey(ignore: true)
  _$$InitializingCopyWith<T, _$Initializing<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RefreshingCopyWith<T, $Res>
    implements $AsyncCopyWith<T, $Res> {
  factory _$$RefreshingCopyWith(
          _$Refreshing<T> value, $Res Function(_$Refreshing<T>) then) =
      __$$RefreshingCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({String message, String code, T? data});
}

/// @nodoc
class __$$RefreshingCopyWithImpl<T, $Res>
    extends _$AsyncCopyWithImpl<T, $Res, _$Refreshing<T>>
    implements _$$RefreshingCopyWith<T, $Res> {
  __$$RefreshingCopyWithImpl(
      _$Refreshing<T> _value, $Res Function(_$Refreshing<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? code = null,
    Object? data = freezed,
  }) {
    return _then(_$Refreshing<T>(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T?,
    ));
  }
}

/// @nodoc

class _$Refreshing<T> implements Refreshing<T> {
  _$Refreshing({this.message = "", this.code = "", this.data});

  @override
  @JsonKey()
  final String message;
  @override
  @JsonKey()
  final String code;
  @override
  final T? data;

  @override
  String toString() {
    return 'Async<$T>.refreshing(message: $message, code: $code, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Refreshing<T> &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code) &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, message, code, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RefreshingCopyWith<T, _$Refreshing<T>> get copyWith =>
      __$$RefreshingCopyWithImpl<T, _$Refreshing<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, String code, T? data)
        initializing,
    required TResult Function(String message, String code, T? data) refreshing,
    required TResult Function(String message, String code, T? data) loading,
    required TResult Function(String message, String code, T? data) success,
    required TResult Function(String message, String code, T? data) error,
    required TResult Function(String message, String code, T? data)
        uninitialized,
  }) {
    return refreshing(message, code, data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, String code, T? data)? initializing,
    TResult? Function(String message, String code, T? data)? refreshing,
    TResult? Function(String message, String code, T? data)? loading,
    TResult? Function(String message, String code, T? data)? success,
    TResult? Function(String message, String code, T? data)? error,
    TResult? Function(String message, String code, T? data)? uninitialized,
  }) {
    return refreshing?.call(message, code, data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, String code, T? data)? initializing,
    TResult Function(String message, String code, T? data)? refreshing,
    TResult Function(String message, String code, T? data)? loading,
    TResult Function(String message, String code, T? data)? success,
    TResult Function(String message, String code, T? data)? error,
    TResult Function(String message, String code, T? data)? uninitialized,
    required TResult orElse(),
  }) {
    if (refreshing != null) {
      return refreshing(message, code, data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initializing<T> value) initializing,
    required TResult Function(Refreshing<T> value) refreshing,
    required TResult Function(Loading<T> value) loading,
    required TResult Function(Success<T> value) success,
    required TResult Function(Error<T> value) error,
    required TResult Function(Uninitialized<T> value) uninitialized,
  }) {
    return refreshing(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initializing<T> value)? initializing,
    TResult? Function(Refreshing<T> value)? refreshing,
    TResult? Function(Loading<T> value)? loading,
    TResult? Function(Success<T> value)? success,
    TResult? Function(Error<T> value)? error,
    TResult? Function(Uninitialized<T> value)? uninitialized,
  }) {
    return refreshing?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initializing<T> value)? initializing,
    TResult Function(Refreshing<T> value)? refreshing,
    TResult Function(Loading<T> value)? loading,
    TResult Function(Success<T> value)? success,
    TResult Function(Error<T> value)? error,
    TResult Function(Uninitialized<T> value)? uninitialized,
    required TResult orElse(),
  }) {
    if (refreshing != null) {
      return refreshing(this);
    }
    return orElse();
  }
}

abstract class Refreshing<T> implements Async<T>, _AsyncData<T> {
  factory Refreshing({final String message, final String code, final T? data}) =
      _$Refreshing<T>;

  @override
  String get message;
  @override
  String get code;
  @override
  T? get data;
  @override
  @JsonKey(ignore: true)
  _$$RefreshingCopyWith<T, _$Refreshing<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadingCopyWith<T, $Res> implements $AsyncCopyWith<T, $Res> {
  factory _$$LoadingCopyWith(
          _$Loading<T> value, $Res Function(_$Loading<T>) then) =
      __$$LoadingCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({String message, String code, T? data});
}

/// @nodoc
class __$$LoadingCopyWithImpl<T, $Res>
    extends _$AsyncCopyWithImpl<T, $Res, _$Loading<T>>
    implements _$$LoadingCopyWith<T, $Res> {
  __$$LoadingCopyWithImpl(
      _$Loading<T> _value, $Res Function(_$Loading<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? code = null,
    Object? data = freezed,
  }) {
    return _then(_$Loading<T>(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T?,
    ));
  }
}

/// @nodoc

class _$Loading<T> implements Loading<T> {
  _$Loading({this.message = "", this.code = "", this.data});

  @override
  @JsonKey()
  final String message;
  @override
  @JsonKey()
  final String code;
  @override
  final T? data;

  @override
  String toString() {
    return 'Async<$T>.loading(message: $message, code: $code, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Loading<T> &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code) &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, message, code, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadingCopyWith<T, _$Loading<T>> get copyWith =>
      __$$LoadingCopyWithImpl<T, _$Loading<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, String code, T? data)
        initializing,
    required TResult Function(String message, String code, T? data) refreshing,
    required TResult Function(String message, String code, T? data) loading,
    required TResult Function(String message, String code, T? data) success,
    required TResult Function(String message, String code, T? data) error,
    required TResult Function(String message, String code, T? data)
        uninitialized,
  }) {
    return loading(message, code, data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, String code, T? data)? initializing,
    TResult? Function(String message, String code, T? data)? refreshing,
    TResult? Function(String message, String code, T? data)? loading,
    TResult? Function(String message, String code, T? data)? success,
    TResult? Function(String message, String code, T? data)? error,
    TResult? Function(String message, String code, T? data)? uninitialized,
  }) {
    return loading?.call(message, code, data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, String code, T? data)? initializing,
    TResult Function(String message, String code, T? data)? refreshing,
    TResult Function(String message, String code, T? data)? loading,
    TResult Function(String message, String code, T? data)? success,
    TResult Function(String message, String code, T? data)? error,
    TResult Function(String message, String code, T? data)? uninitialized,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(message, code, data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initializing<T> value) initializing,
    required TResult Function(Refreshing<T> value) refreshing,
    required TResult Function(Loading<T> value) loading,
    required TResult Function(Success<T> value) success,
    required TResult Function(Error<T> value) error,
    required TResult Function(Uninitialized<T> value) uninitialized,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initializing<T> value)? initializing,
    TResult? Function(Refreshing<T> value)? refreshing,
    TResult? Function(Loading<T> value)? loading,
    TResult? Function(Success<T> value)? success,
    TResult? Function(Error<T> value)? error,
    TResult? Function(Uninitialized<T> value)? uninitialized,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initializing<T> value)? initializing,
    TResult Function(Refreshing<T> value)? refreshing,
    TResult Function(Loading<T> value)? loading,
    TResult Function(Success<T> value)? success,
    TResult Function(Error<T> value)? error,
    TResult Function(Uninitialized<T> value)? uninitialized,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading<T> implements Async<T>, _AsyncData<T> {
  factory Loading({final String message, final String code, final T? data}) =
      _$Loading<T>;

  @override
  String get message;
  @override
  String get code;
  @override
  T? get data;
  @override
  @JsonKey(ignore: true)
  _$$LoadingCopyWith<T, _$Loading<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuccessCopyWith<T, $Res> implements $AsyncCopyWith<T, $Res> {
  factory _$$SuccessCopyWith(
          _$Success<T> value, $Res Function(_$Success<T>) then) =
      __$$SuccessCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({String message, String code, T? data});
}

/// @nodoc
class __$$SuccessCopyWithImpl<T, $Res>
    extends _$AsyncCopyWithImpl<T, $Res, _$Success<T>>
    implements _$$SuccessCopyWith<T, $Res> {
  __$$SuccessCopyWithImpl(
      _$Success<T> _value, $Res Function(_$Success<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? code = null,
    Object? data = freezed,
  }) {
    return _then(_$Success<T>(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T?,
    ));
  }
}

/// @nodoc

class _$Success<T> implements Success<T> {
  _$Success({this.message = "", this.code = "", this.data});

  @override
  @JsonKey()
  final String message;
  @override
  @JsonKey()
  final String code;
  @override
  final T? data;

  @override
  String toString() {
    return 'Async<$T>.success(message: $message, code: $code, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Success<T> &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code) &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, message, code, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessCopyWith<T, _$Success<T>> get copyWith =>
      __$$SuccessCopyWithImpl<T, _$Success<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, String code, T? data)
        initializing,
    required TResult Function(String message, String code, T? data) refreshing,
    required TResult Function(String message, String code, T? data) loading,
    required TResult Function(String message, String code, T? data) success,
    required TResult Function(String message, String code, T? data) error,
    required TResult Function(String message, String code, T? data)
        uninitialized,
  }) {
    return success(message, code, data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, String code, T? data)? initializing,
    TResult? Function(String message, String code, T? data)? refreshing,
    TResult? Function(String message, String code, T? data)? loading,
    TResult? Function(String message, String code, T? data)? success,
    TResult? Function(String message, String code, T? data)? error,
    TResult? Function(String message, String code, T? data)? uninitialized,
  }) {
    return success?.call(message, code, data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, String code, T? data)? initializing,
    TResult Function(String message, String code, T? data)? refreshing,
    TResult Function(String message, String code, T? data)? loading,
    TResult Function(String message, String code, T? data)? success,
    TResult Function(String message, String code, T? data)? error,
    TResult Function(String message, String code, T? data)? uninitialized,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(message, code, data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initializing<T> value) initializing,
    required TResult Function(Refreshing<T> value) refreshing,
    required TResult Function(Loading<T> value) loading,
    required TResult Function(Success<T> value) success,
    required TResult Function(Error<T> value) error,
    required TResult Function(Uninitialized<T> value) uninitialized,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initializing<T> value)? initializing,
    TResult? Function(Refreshing<T> value)? refreshing,
    TResult? Function(Loading<T> value)? loading,
    TResult? Function(Success<T> value)? success,
    TResult? Function(Error<T> value)? error,
    TResult? Function(Uninitialized<T> value)? uninitialized,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initializing<T> value)? initializing,
    TResult Function(Refreshing<T> value)? refreshing,
    TResult Function(Loading<T> value)? loading,
    TResult Function(Success<T> value)? success,
    TResult Function(Error<T> value)? error,
    TResult Function(Uninitialized<T> value)? uninitialized,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class Success<T> implements Async<T>, _AsyncData<T> {
  factory Success({final String message, final String code, final T? data}) =
      _$Success<T>;

  @override
  String get message;
  @override
  String get code;
  @override
  T? get data;
  @override
  @JsonKey(ignore: true)
  _$$SuccessCopyWith<T, _$Success<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorCopyWith<T, $Res> implements $AsyncCopyWith<T, $Res> {
  factory _$$ErrorCopyWith(_$Error<T> value, $Res Function(_$Error<T>) then) =
      __$$ErrorCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({String message, String code, T? data});
}

/// @nodoc
class __$$ErrorCopyWithImpl<T, $Res>
    extends _$AsyncCopyWithImpl<T, $Res, _$Error<T>>
    implements _$$ErrorCopyWith<T, $Res> {
  __$$ErrorCopyWithImpl(_$Error<T> _value, $Res Function(_$Error<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? code = null,
    Object? data = freezed,
  }) {
    return _then(_$Error<T>(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T?,
    ));
  }
}

/// @nodoc

class _$Error<T> implements Error<T> {
  _$Error({this.message = "", this.code = "", this.data});

  @override
  @JsonKey()
  final String message;
  @override
  @JsonKey()
  final String code;
  @override
  final T? data;

  @override
  String toString() {
    return 'Async<$T>.error(message: $message, code: $code, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Error<T> &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code) &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, message, code, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorCopyWith<T, _$Error<T>> get copyWith =>
      __$$ErrorCopyWithImpl<T, _$Error<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, String code, T? data)
        initializing,
    required TResult Function(String message, String code, T? data) refreshing,
    required TResult Function(String message, String code, T? data) loading,
    required TResult Function(String message, String code, T? data) success,
    required TResult Function(String message, String code, T? data) error,
    required TResult Function(String message, String code, T? data)
        uninitialized,
  }) {
    return error(message, code, data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, String code, T? data)? initializing,
    TResult? Function(String message, String code, T? data)? refreshing,
    TResult? Function(String message, String code, T? data)? loading,
    TResult? Function(String message, String code, T? data)? success,
    TResult? Function(String message, String code, T? data)? error,
    TResult? Function(String message, String code, T? data)? uninitialized,
  }) {
    return error?.call(message, code, data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, String code, T? data)? initializing,
    TResult Function(String message, String code, T? data)? refreshing,
    TResult Function(String message, String code, T? data)? loading,
    TResult Function(String message, String code, T? data)? success,
    TResult Function(String message, String code, T? data)? error,
    TResult Function(String message, String code, T? data)? uninitialized,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message, code, data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initializing<T> value) initializing,
    required TResult Function(Refreshing<T> value) refreshing,
    required TResult Function(Loading<T> value) loading,
    required TResult Function(Success<T> value) success,
    required TResult Function(Error<T> value) error,
    required TResult Function(Uninitialized<T> value) uninitialized,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initializing<T> value)? initializing,
    TResult? Function(Refreshing<T> value)? refreshing,
    TResult? Function(Loading<T> value)? loading,
    TResult? Function(Success<T> value)? success,
    TResult? Function(Error<T> value)? error,
    TResult? Function(Uninitialized<T> value)? uninitialized,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initializing<T> value)? initializing,
    TResult Function(Refreshing<T> value)? refreshing,
    TResult Function(Loading<T> value)? loading,
    TResult Function(Success<T> value)? success,
    TResult Function(Error<T> value)? error,
    TResult Function(Uninitialized<T> value)? uninitialized,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class Error<T> implements Async<T>, _AsyncData<T> {
  factory Error({final String message, final String code, final T? data}) =
      _$Error<T>;

  @override
  String get message;
  @override
  String get code;
  @override
  T? get data;
  @override
  @JsonKey(ignore: true)
  _$$ErrorCopyWith<T, _$Error<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UninitializedCopyWith<T, $Res>
    implements $AsyncCopyWith<T, $Res> {
  factory _$$UninitializedCopyWith(
          _$Uninitialized<T> value, $Res Function(_$Uninitialized<T>) then) =
      __$$UninitializedCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({String message, String code, T? data});
}

/// @nodoc
class __$$UninitializedCopyWithImpl<T, $Res>
    extends _$AsyncCopyWithImpl<T, $Res, _$Uninitialized<T>>
    implements _$$UninitializedCopyWith<T, $Res> {
  __$$UninitializedCopyWithImpl(
      _$Uninitialized<T> _value, $Res Function(_$Uninitialized<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? code = null,
    Object? data = freezed,
  }) {
    return _then(_$Uninitialized<T>(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T?,
    ));
  }
}

/// @nodoc

class _$Uninitialized<T> implements Uninitialized<T> {
  _$Uninitialized({this.message = "", this.code = "", this.data});

  @override
  @JsonKey()
  final String message;
  @override
  @JsonKey()
  final String code;
  @override
  final T? data;

  @override
  String toString() {
    return 'Async<$T>.uninitialized(message: $message, code: $code, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Uninitialized<T> &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code) &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, message, code, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UninitializedCopyWith<T, _$Uninitialized<T>> get copyWith =>
      __$$UninitializedCopyWithImpl<T, _$Uninitialized<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, String code, T? data)
        initializing,
    required TResult Function(String message, String code, T? data) refreshing,
    required TResult Function(String message, String code, T? data) loading,
    required TResult Function(String message, String code, T? data) success,
    required TResult Function(String message, String code, T? data) error,
    required TResult Function(String message, String code, T? data)
        uninitialized,
  }) {
    return uninitialized(message, code, data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, String code, T? data)? initializing,
    TResult? Function(String message, String code, T? data)? refreshing,
    TResult? Function(String message, String code, T? data)? loading,
    TResult? Function(String message, String code, T? data)? success,
    TResult? Function(String message, String code, T? data)? error,
    TResult? Function(String message, String code, T? data)? uninitialized,
  }) {
    return uninitialized?.call(message, code, data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, String code, T? data)? initializing,
    TResult Function(String message, String code, T? data)? refreshing,
    TResult Function(String message, String code, T? data)? loading,
    TResult Function(String message, String code, T? data)? success,
    TResult Function(String message, String code, T? data)? error,
    TResult Function(String message, String code, T? data)? uninitialized,
    required TResult orElse(),
  }) {
    if (uninitialized != null) {
      return uninitialized(message, code, data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initializing<T> value) initializing,
    required TResult Function(Refreshing<T> value) refreshing,
    required TResult Function(Loading<T> value) loading,
    required TResult Function(Success<T> value) success,
    required TResult Function(Error<T> value) error,
    required TResult Function(Uninitialized<T> value) uninitialized,
  }) {
    return uninitialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initializing<T> value)? initializing,
    TResult? Function(Refreshing<T> value)? refreshing,
    TResult? Function(Loading<T> value)? loading,
    TResult? Function(Success<T> value)? success,
    TResult? Function(Error<T> value)? error,
    TResult? Function(Uninitialized<T> value)? uninitialized,
  }) {
    return uninitialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initializing<T> value)? initializing,
    TResult Function(Refreshing<T> value)? refreshing,
    TResult Function(Loading<T> value)? loading,
    TResult Function(Success<T> value)? success,
    TResult Function(Error<T> value)? error,
    TResult Function(Uninitialized<T> value)? uninitialized,
    required TResult orElse(),
  }) {
    if (uninitialized != null) {
      return uninitialized(this);
    }
    return orElse();
  }
}

abstract class Uninitialized<T> implements Async<T>, _AsyncData<T> {
  factory Uninitialized(
      {final String message,
      final String code,
      final T? data}) = _$Uninitialized<T>;

  @override
  String get message;
  @override
  String get code;
  @override
  T? get data;
  @override
  @JsonKey(ignore: true)
  _$$UninitializedCopyWith<T, _$Uninitialized<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
