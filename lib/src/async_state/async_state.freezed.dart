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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Async<T> {
  String get message => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;
  T? get data => throw _privateConstructorUsedError;
  List<T>? get listData => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String message, String code, T? data, List<T>? listData)
        initializing,
    required TResult Function(
            String message, String code, List<T>? listData, T? data)
        refreshing,
    required TResult Function(
            String message, String code, List<T>? listData, T? data)
        loading,
    required TResult Function(
            String message, String code, List<T>? listData, T? data)
        success,
    required TResult Function(
            String message, String code, T? data, List<T>? listData)
        error,
    required TResult Function(
            String message, String code, List<T>? listData, T? data)
        uninitialized,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, String code, T? data, List<T>? listData)?
        initializing,
    TResult? Function(String message, String code, List<T>? listData, T? data)?
        refreshing,
    TResult? Function(String message, String code, List<T>? listData, T? data)?
        loading,
    TResult? Function(String message, String code, List<T>? listData, T? data)?
        success,
    TResult? Function(String message, String code, T? data, List<T>? listData)?
        error,
    TResult? Function(String message, String code, List<T>? listData, T? data)?
        uninitialized,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, String code, T? data, List<T>? listData)?
        initializing,
    TResult Function(String message, String code, List<T>? listData, T? data)?
        refreshing,
    TResult Function(String message, String code, List<T>? listData, T? data)?
        loading,
    TResult Function(String message, String code, List<T>? listData, T? data)?
        success,
    TResult Function(String message, String code, T? data, List<T>? listData)?
        error,
    TResult Function(String message, String code, List<T>? listData, T? data)?
        uninitialized,
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
  $Res call({String message, String code, T? data, List<T>? listData});
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
    Object? listData = freezed,
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
      listData: freezed == listData
          ? _value.listData
          : listData // ignore: cast_nullable_to_non_nullable
              as List<T>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitializingImplCopyWith<T, $Res>
    implements $AsyncCopyWith<T, $Res> {
  factory _$$InitializingImplCopyWith(_$InitializingImpl<T> value,
          $Res Function(_$InitializingImpl<T>) then) =
      __$$InitializingImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({String message, String code, T? data, List<T>? listData});
}

/// @nodoc
class __$$InitializingImplCopyWithImpl<T, $Res>
    extends _$AsyncCopyWithImpl<T, $Res, _$InitializingImpl<T>>
    implements _$$InitializingImplCopyWith<T, $Res> {
  __$$InitializingImplCopyWithImpl(
      _$InitializingImpl<T> _value, $Res Function(_$InitializingImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? code = null,
    Object? data = freezed,
    Object? listData = freezed,
  }) {
    return _then(_$InitializingImpl<T>(
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
      listData: freezed == listData
          ? _value._listData
          : listData // ignore: cast_nullable_to_non_nullable
              as List<T>?,
    ));
  }
}

/// @nodoc

class _$InitializingImpl<T> implements Initializing<T> {
  _$InitializingImpl(
      {this.message = "", this.code = "", this.data, final List<T>? listData})
      : _listData = listData;

  @override
  @JsonKey()
  final String message;
  @override
  @JsonKey()
  final String code;
  @override
  final T? data;
  final List<T>? _listData;
  @override
  List<T>? get listData {
    final value = _listData;
    if (value == null) return null;
    if (_listData is EqualUnmodifiableListView) return _listData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Async<$T>.initializing(message: $message, code: $code, data: $data, listData: $listData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitializingImpl<T> &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code) &&
            const DeepCollectionEquality().equals(other.data, data) &&
            const DeepCollectionEquality().equals(other._listData, _listData));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      message,
      code,
      const DeepCollectionEquality().hash(data),
      const DeepCollectionEquality().hash(_listData));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitializingImplCopyWith<T, _$InitializingImpl<T>> get copyWith =>
      __$$InitializingImplCopyWithImpl<T, _$InitializingImpl<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String message, String code, T? data, List<T>? listData)
        initializing,
    required TResult Function(
            String message, String code, List<T>? listData, T? data)
        refreshing,
    required TResult Function(
            String message, String code, List<T>? listData, T? data)
        loading,
    required TResult Function(
            String message, String code, List<T>? listData, T? data)
        success,
    required TResult Function(
            String message, String code, T? data, List<T>? listData)
        error,
    required TResult Function(
            String message, String code, List<T>? listData, T? data)
        uninitialized,
  }) {
    return initializing(message, code, data, listData);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, String code, T? data, List<T>? listData)?
        initializing,
    TResult? Function(String message, String code, List<T>? listData, T? data)?
        refreshing,
    TResult? Function(String message, String code, List<T>? listData, T? data)?
        loading,
    TResult? Function(String message, String code, List<T>? listData, T? data)?
        success,
    TResult? Function(String message, String code, T? data, List<T>? listData)?
        error,
    TResult? Function(String message, String code, List<T>? listData, T? data)?
        uninitialized,
  }) {
    return initializing?.call(message, code, data, listData);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, String code, T? data, List<T>? listData)?
        initializing,
    TResult Function(String message, String code, List<T>? listData, T? data)?
        refreshing,
    TResult Function(String message, String code, List<T>? listData, T? data)?
        loading,
    TResult Function(String message, String code, List<T>? listData, T? data)?
        success,
    TResult Function(String message, String code, T? data, List<T>? listData)?
        error,
    TResult Function(String message, String code, List<T>? listData, T? data)?
        uninitialized,
    required TResult orElse(),
  }) {
    if (initializing != null) {
      return initializing(message, code, data, listData);
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
      final T? data,
      final List<T>? listData}) = _$InitializingImpl<T>;

  @override
  String get message;
  @override
  String get code;
  @override
  T? get data;
  @override
  List<T>? get listData;
  @override
  @JsonKey(ignore: true)
  _$$InitializingImplCopyWith<T, _$InitializingImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RefreshingImplCopyWith<T, $Res>
    implements $AsyncCopyWith<T, $Res> {
  factory _$$RefreshingImplCopyWith(
          _$RefreshingImpl<T> value, $Res Function(_$RefreshingImpl<T>) then) =
      __$$RefreshingImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({String message, String code, List<T>? listData, T? data});
}

/// @nodoc
class __$$RefreshingImplCopyWithImpl<T, $Res>
    extends _$AsyncCopyWithImpl<T, $Res, _$RefreshingImpl<T>>
    implements _$$RefreshingImplCopyWith<T, $Res> {
  __$$RefreshingImplCopyWithImpl(
      _$RefreshingImpl<T> _value, $Res Function(_$RefreshingImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? code = null,
    Object? listData = freezed,
    Object? data = freezed,
  }) {
    return _then(_$RefreshingImpl<T>(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      listData: freezed == listData
          ? _value._listData
          : listData // ignore: cast_nullable_to_non_nullable
              as List<T>?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T?,
    ));
  }
}

/// @nodoc

class _$RefreshingImpl<T> implements Refreshing<T> {
  _$RefreshingImpl(
      {this.message = "", this.code = "", final List<T>? listData, this.data})
      : _listData = listData;

  @override
  @JsonKey()
  final String message;
  @override
  @JsonKey()
  final String code;
  final List<T>? _listData;
  @override
  List<T>? get listData {
    final value = _listData;
    if (value == null) return null;
    if (_listData is EqualUnmodifiableListView) return _listData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final T? data;

  @override
  String toString() {
    return 'Async<$T>.refreshing(message: $message, code: $code, listData: $listData, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RefreshingImpl<T> &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code) &&
            const DeepCollectionEquality().equals(other._listData, _listData) &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      message,
      code,
      const DeepCollectionEquality().hash(_listData),
      const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RefreshingImplCopyWith<T, _$RefreshingImpl<T>> get copyWith =>
      __$$RefreshingImplCopyWithImpl<T, _$RefreshingImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String message, String code, T? data, List<T>? listData)
        initializing,
    required TResult Function(
            String message, String code, List<T>? listData, T? data)
        refreshing,
    required TResult Function(
            String message, String code, List<T>? listData, T? data)
        loading,
    required TResult Function(
            String message, String code, List<T>? listData, T? data)
        success,
    required TResult Function(
            String message, String code, T? data, List<T>? listData)
        error,
    required TResult Function(
            String message, String code, List<T>? listData, T? data)
        uninitialized,
  }) {
    return refreshing(message, code, listData, data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, String code, T? data, List<T>? listData)?
        initializing,
    TResult? Function(String message, String code, List<T>? listData, T? data)?
        refreshing,
    TResult? Function(String message, String code, List<T>? listData, T? data)?
        loading,
    TResult? Function(String message, String code, List<T>? listData, T? data)?
        success,
    TResult? Function(String message, String code, T? data, List<T>? listData)?
        error,
    TResult? Function(String message, String code, List<T>? listData, T? data)?
        uninitialized,
  }) {
    return refreshing?.call(message, code, listData, data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, String code, T? data, List<T>? listData)?
        initializing,
    TResult Function(String message, String code, List<T>? listData, T? data)?
        refreshing,
    TResult Function(String message, String code, List<T>? listData, T? data)?
        loading,
    TResult Function(String message, String code, List<T>? listData, T? data)?
        success,
    TResult Function(String message, String code, T? data, List<T>? listData)?
        error,
    TResult Function(String message, String code, List<T>? listData, T? data)?
        uninitialized,
    required TResult orElse(),
  }) {
    if (refreshing != null) {
      return refreshing(message, code, listData, data);
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
  factory Refreshing(
      {final String message,
      final String code,
      final List<T>? listData,
      final T? data}) = _$RefreshingImpl<T>;

  @override
  String get message;
  @override
  String get code;
  @override
  List<T>? get listData;
  @override
  T? get data;
  @override
  @JsonKey(ignore: true)
  _$$RefreshingImplCopyWith<T, _$RefreshingImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<T, $Res>
    implements $AsyncCopyWith<T, $Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl<T> value, $Res Function(_$LoadingImpl<T>) then) =
      __$$LoadingImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({String message, String code, List<T>? listData, T? data});
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<T, $Res>
    extends _$AsyncCopyWithImpl<T, $Res, _$LoadingImpl<T>>
    implements _$$LoadingImplCopyWith<T, $Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl<T> _value, $Res Function(_$LoadingImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? code = null,
    Object? listData = freezed,
    Object? data = freezed,
  }) {
    return _then(_$LoadingImpl<T>(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      listData: freezed == listData
          ? _value._listData
          : listData // ignore: cast_nullable_to_non_nullable
              as List<T>?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T?,
    ));
  }
}

/// @nodoc

class _$LoadingImpl<T> implements Loading<T> {
  _$LoadingImpl(
      {this.message = "", this.code = "", final List<T>? listData, this.data})
      : _listData = listData;

  @override
  @JsonKey()
  final String message;
  @override
  @JsonKey()
  final String code;
  final List<T>? _listData;
  @override
  List<T>? get listData {
    final value = _listData;
    if (value == null) return null;
    if (_listData is EqualUnmodifiableListView) return _listData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final T? data;

  @override
  String toString() {
    return 'Async<$T>.loading(message: $message, code: $code, listData: $listData, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadingImpl<T> &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code) &&
            const DeepCollectionEquality().equals(other._listData, _listData) &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      message,
      code,
      const DeepCollectionEquality().hash(_listData),
      const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadingImplCopyWith<T, _$LoadingImpl<T>> get copyWith =>
      __$$LoadingImplCopyWithImpl<T, _$LoadingImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String message, String code, T? data, List<T>? listData)
        initializing,
    required TResult Function(
            String message, String code, List<T>? listData, T? data)
        refreshing,
    required TResult Function(
            String message, String code, List<T>? listData, T? data)
        loading,
    required TResult Function(
            String message, String code, List<T>? listData, T? data)
        success,
    required TResult Function(
            String message, String code, T? data, List<T>? listData)
        error,
    required TResult Function(
            String message, String code, List<T>? listData, T? data)
        uninitialized,
  }) {
    return loading(message, code, listData, data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, String code, T? data, List<T>? listData)?
        initializing,
    TResult? Function(String message, String code, List<T>? listData, T? data)?
        refreshing,
    TResult? Function(String message, String code, List<T>? listData, T? data)?
        loading,
    TResult? Function(String message, String code, List<T>? listData, T? data)?
        success,
    TResult? Function(String message, String code, T? data, List<T>? listData)?
        error,
    TResult? Function(String message, String code, List<T>? listData, T? data)?
        uninitialized,
  }) {
    return loading?.call(message, code, listData, data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, String code, T? data, List<T>? listData)?
        initializing,
    TResult Function(String message, String code, List<T>? listData, T? data)?
        refreshing,
    TResult Function(String message, String code, List<T>? listData, T? data)?
        loading,
    TResult Function(String message, String code, List<T>? listData, T? data)?
        success,
    TResult Function(String message, String code, T? data, List<T>? listData)?
        error,
    TResult Function(String message, String code, List<T>? listData, T? data)?
        uninitialized,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(message, code, listData, data);
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
  factory Loading(
      {final String message,
      final String code,
      final List<T>? listData,
      final T? data}) = _$LoadingImpl<T>;

  @override
  String get message;
  @override
  String get code;
  @override
  List<T>? get listData;
  @override
  T? get data;
  @override
  @JsonKey(ignore: true)
  _$$LoadingImplCopyWith<T, _$LoadingImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<T, $Res>
    implements $AsyncCopyWith<T, $Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl<T> value, $Res Function(_$SuccessImpl<T>) then) =
      __$$SuccessImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({String message, String code, List<T>? listData, T? data});
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<T, $Res>
    extends _$AsyncCopyWithImpl<T, $Res, _$SuccessImpl<T>>
    implements _$$SuccessImplCopyWith<T, $Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl<T> _value, $Res Function(_$SuccessImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? code = null,
    Object? listData = freezed,
    Object? data = freezed,
  }) {
    return _then(_$SuccessImpl<T>(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      listData: freezed == listData
          ? _value._listData
          : listData // ignore: cast_nullable_to_non_nullable
              as List<T>?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T?,
    ));
  }
}

/// @nodoc

class _$SuccessImpl<T> implements Success<T> {
  _$SuccessImpl(
      {this.message = "", this.code = "", final List<T>? listData, this.data})
      : _listData = listData;

  @override
  @JsonKey()
  final String message;
  @override
  @JsonKey()
  final String code;
  final List<T>? _listData;
  @override
  List<T>? get listData {
    final value = _listData;
    if (value == null) return null;
    if (_listData is EqualUnmodifiableListView) return _listData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final T? data;

  @override
  String toString() {
    return 'Async<$T>.success(message: $message, code: $code, listData: $listData, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessImpl<T> &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code) &&
            const DeepCollectionEquality().equals(other._listData, _listData) &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      message,
      code,
      const DeepCollectionEquality().hash(_listData),
      const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessImplCopyWith<T, _$SuccessImpl<T>> get copyWith =>
      __$$SuccessImplCopyWithImpl<T, _$SuccessImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String message, String code, T? data, List<T>? listData)
        initializing,
    required TResult Function(
            String message, String code, List<T>? listData, T? data)
        refreshing,
    required TResult Function(
            String message, String code, List<T>? listData, T? data)
        loading,
    required TResult Function(
            String message, String code, List<T>? listData, T? data)
        success,
    required TResult Function(
            String message, String code, T? data, List<T>? listData)
        error,
    required TResult Function(
            String message, String code, List<T>? listData, T? data)
        uninitialized,
  }) {
    return success(message, code, listData, data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, String code, T? data, List<T>? listData)?
        initializing,
    TResult? Function(String message, String code, List<T>? listData, T? data)?
        refreshing,
    TResult? Function(String message, String code, List<T>? listData, T? data)?
        loading,
    TResult? Function(String message, String code, List<T>? listData, T? data)?
        success,
    TResult? Function(String message, String code, T? data, List<T>? listData)?
        error,
    TResult? Function(String message, String code, List<T>? listData, T? data)?
        uninitialized,
  }) {
    return success?.call(message, code, listData, data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, String code, T? data, List<T>? listData)?
        initializing,
    TResult Function(String message, String code, List<T>? listData, T? data)?
        refreshing,
    TResult Function(String message, String code, List<T>? listData, T? data)?
        loading,
    TResult Function(String message, String code, List<T>? listData, T? data)?
        success,
    TResult Function(String message, String code, T? data, List<T>? listData)?
        error,
    TResult Function(String message, String code, List<T>? listData, T? data)?
        uninitialized,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(message, code, listData, data);
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
  factory Success(
      {final String message,
      final String code,
      final List<T>? listData,
      final T? data}) = _$SuccessImpl<T>;

  @override
  String get message;
  @override
  String get code;
  @override
  List<T>? get listData;
  @override
  T? get data;
  @override
  @JsonKey(ignore: true)
  _$$SuccessImplCopyWith<T, _$SuccessImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<T, $Res>
    implements $AsyncCopyWith<T, $Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl<T> value, $Res Function(_$ErrorImpl<T>) then) =
      __$$ErrorImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({String message, String code, T? data, List<T>? listData});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<T, $Res>
    extends _$AsyncCopyWithImpl<T, $Res, _$ErrorImpl<T>>
    implements _$$ErrorImplCopyWith<T, $Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl<T> _value, $Res Function(_$ErrorImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? code = null,
    Object? data = freezed,
    Object? listData = freezed,
  }) {
    return _then(_$ErrorImpl<T>(
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
      listData: freezed == listData
          ? _value._listData
          : listData // ignore: cast_nullable_to_non_nullable
              as List<T>?,
    ));
  }
}

/// @nodoc

class _$ErrorImpl<T> implements Error<T> {
  _$ErrorImpl(
      {this.message = "", this.code = "", this.data, final List<T>? listData})
      : _listData = listData;

  @override
  @JsonKey()
  final String message;
  @override
  @JsonKey()
  final String code;
  @override
  final T? data;
  final List<T>? _listData;
  @override
  List<T>? get listData {
    final value = _listData;
    if (value == null) return null;
    if (_listData is EqualUnmodifiableListView) return _listData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Async<$T>.error(message: $message, code: $code, data: $data, listData: $listData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl<T> &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code) &&
            const DeepCollectionEquality().equals(other.data, data) &&
            const DeepCollectionEquality().equals(other._listData, _listData));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      message,
      code,
      const DeepCollectionEquality().hash(data),
      const DeepCollectionEquality().hash(_listData));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<T, _$ErrorImpl<T>> get copyWith =>
      __$$ErrorImplCopyWithImpl<T, _$ErrorImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String message, String code, T? data, List<T>? listData)
        initializing,
    required TResult Function(
            String message, String code, List<T>? listData, T? data)
        refreshing,
    required TResult Function(
            String message, String code, List<T>? listData, T? data)
        loading,
    required TResult Function(
            String message, String code, List<T>? listData, T? data)
        success,
    required TResult Function(
            String message, String code, T? data, List<T>? listData)
        error,
    required TResult Function(
            String message, String code, List<T>? listData, T? data)
        uninitialized,
  }) {
    return error(message, code, data, listData);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, String code, T? data, List<T>? listData)?
        initializing,
    TResult? Function(String message, String code, List<T>? listData, T? data)?
        refreshing,
    TResult? Function(String message, String code, List<T>? listData, T? data)?
        loading,
    TResult? Function(String message, String code, List<T>? listData, T? data)?
        success,
    TResult? Function(String message, String code, T? data, List<T>? listData)?
        error,
    TResult? Function(String message, String code, List<T>? listData, T? data)?
        uninitialized,
  }) {
    return error?.call(message, code, data, listData);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, String code, T? data, List<T>? listData)?
        initializing,
    TResult Function(String message, String code, List<T>? listData, T? data)?
        refreshing,
    TResult Function(String message, String code, List<T>? listData, T? data)?
        loading,
    TResult Function(String message, String code, List<T>? listData, T? data)?
        success,
    TResult Function(String message, String code, T? data, List<T>? listData)?
        error,
    TResult Function(String message, String code, List<T>? listData, T? data)?
        uninitialized,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message, code, data, listData);
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
  factory Error(
      {final String message,
      final String code,
      final T? data,
      final List<T>? listData}) = _$ErrorImpl<T>;

  @override
  String get message;
  @override
  String get code;
  @override
  T? get data;
  @override
  List<T>? get listData;
  @override
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<T, _$ErrorImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UninitializedImplCopyWith<T, $Res>
    implements $AsyncCopyWith<T, $Res> {
  factory _$$UninitializedImplCopyWith(_$UninitializedImpl<T> value,
          $Res Function(_$UninitializedImpl<T>) then) =
      __$$UninitializedImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({String message, String code, List<T>? listData, T? data});
}

/// @nodoc
class __$$UninitializedImplCopyWithImpl<T, $Res>
    extends _$AsyncCopyWithImpl<T, $Res, _$UninitializedImpl<T>>
    implements _$$UninitializedImplCopyWith<T, $Res> {
  __$$UninitializedImplCopyWithImpl(_$UninitializedImpl<T> _value,
      $Res Function(_$UninitializedImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? code = null,
    Object? listData = freezed,
    Object? data = freezed,
  }) {
    return _then(_$UninitializedImpl<T>(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      listData: freezed == listData
          ? _value._listData
          : listData // ignore: cast_nullable_to_non_nullable
              as List<T>?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T?,
    ));
  }
}

/// @nodoc

class _$UninitializedImpl<T> implements Uninitialized<T> {
  _$UninitializedImpl(
      {this.message = "", this.code = "", final List<T>? listData, this.data})
      : _listData = listData;

  @override
  @JsonKey()
  final String message;
  @override
  @JsonKey()
  final String code;
  final List<T>? _listData;
  @override
  List<T>? get listData {
    final value = _listData;
    if (value == null) return null;
    if (_listData is EqualUnmodifiableListView) return _listData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final T? data;

  @override
  String toString() {
    return 'Async<$T>.uninitialized(message: $message, code: $code, listData: $listData, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UninitializedImpl<T> &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code) &&
            const DeepCollectionEquality().equals(other._listData, _listData) &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      message,
      code,
      const DeepCollectionEquality().hash(_listData),
      const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UninitializedImplCopyWith<T, _$UninitializedImpl<T>> get copyWith =>
      __$$UninitializedImplCopyWithImpl<T, _$UninitializedImpl<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String message, String code, T? data, List<T>? listData)
        initializing,
    required TResult Function(
            String message, String code, List<T>? listData, T? data)
        refreshing,
    required TResult Function(
            String message, String code, List<T>? listData, T? data)
        loading,
    required TResult Function(
            String message, String code, List<T>? listData, T? data)
        success,
    required TResult Function(
            String message, String code, T? data, List<T>? listData)
        error,
    required TResult Function(
            String message, String code, List<T>? listData, T? data)
        uninitialized,
  }) {
    return uninitialized(message, code, listData, data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, String code, T? data, List<T>? listData)?
        initializing,
    TResult? Function(String message, String code, List<T>? listData, T? data)?
        refreshing,
    TResult? Function(String message, String code, List<T>? listData, T? data)?
        loading,
    TResult? Function(String message, String code, List<T>? listData, T? data)?
        success,
    TResult? Function(String message, String code, T? data, List<T>? listData)?
        error,
    TResult? Function(String message, String code, List<T>? listData, T? data)?
        uninitialized,
  }) {
    return uninitialized?.call(message, code, listData, data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, String code, T? data, List<T>? listData)?
        initializing,
    TResult Function(String message, String code, List<T>? listData, T? data)?
        refreshing,
    TResult Function(String message, String code, List<T>? listData, T? data)?
        loading,
    TResult Function(String message, String code, List<T>? listData, T? data)?
        success,
    TResult Function(String message, String code, T? data, List<T>? listData)?
        error,
    TResult Function(String message, String code, List<T>? listData, T? data)?
        uninitialized,
    required TResult orElse(),
  }) {
    if (uninitialized != null) {
      return uninitialized(message, code, listData, data);
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
      final List<T>? listData,
      final T? data}) = _$UninitializedImpl<T>;

  @override
  String get message;
  @override
  String get code;
  @override
  List<T>? get listData;
  @override
  T? get data;
  @override
  @JsonKey(ignore: true)
  _$$UninitializedImplCopyWith<T, _$UninitializedImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
