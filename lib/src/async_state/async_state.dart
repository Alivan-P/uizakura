import 'package:freezed_annotation/freezed_annotation.dart';

part 'async_state.freezed.dart';

abstract class _AsyncData<T> {
  String get message;

  /// 业务状态码
  String get code;

  T? get data;
}

@freezed
class Async<T> with _$Async<T> {
  @Implements.fromString('_AsyncData<T>')
  factory Async.initializing(
      {@Default("") String message,
      @Default("") String code,
      T? data}) = Initializing;

  @Implements.fromString('_AsyncData<T>')
  factory Async.refreshing(
      {@Default("") String message,
      @Default("") String code,
      T? data}) = Refreshing;

  @Implements.fromString('_AsyncData<T>')
  factory Async.loading(
      {@Default("") String message,
      @Default("") String code,
      T? data}) = Loading;

  @Implements.fromString('_AsyncData<T>')
  factory Async.success(
      {@Default("") String message,
      @Default("") String code,
      T? data}) = Success;

  @Implements.fromString('_AsyncData<T>')
  factory Async.error(
      {@Default("") String message, @Default("") String code, T? data}) = Error;

  @Implements.fromString('_AsyncData<T>')
  factory Async.uninitialized(
      {@Default("") String message,
      @Default("") String code,
      T? data}) = Uninitialized;
}

extension AsyncExtension on Async<dynamic> {
  bool get isSuccess => this is Success;

  bool get isError => this is Error;

  bool get isInitializing => this is Initializing;

  bool get isLoading => this is Loading;

  bool get isRefreshingOrLoading => isLoading || isRefreshing;

  bool get isRefreshing => this is Refreshing;

  bool get isComplete => isSuccess || isError;
}
