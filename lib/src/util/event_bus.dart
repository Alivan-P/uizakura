import 'dart:async';

class EventBus {
  static final _EventBus _eventBus = _EventBus(sync: false);

  EventBus._();

  static void send(dynamic event) {
    _eventBus.fire(event);
  }

  static Function() listen<T>(Function(T event) onData) {
    var listen = _eventBus.on<T>().listen(onData);
    return listen.cancel;
  }
}

/// Dispatches events to listeners using the Dart [Stream] API. The [_EventBus]
/// enables decoupled applications. It allows objects to interact without
/// requiring to explicitly define listeners and keeping track of them.
///
/// Not all events should be broadcasted through the [_EventBus] but only those of
/// general interest.
///
/// Events are normal Dart objects. By specifying a class, listeners can
/// filter events.
///
class _EventBus {
  final StreamController<Object> _streamController;

  /// Controller for the event bus stream.
  StreamController<Object> get streamController => _streamController;

  /// Creates an [_EventBus].
  ///
  /// If [sync] is true, events are passed directly to the stream's listeners
  /// during a [fire] call. If false (the default), the event will be passed to
  /// the listeners at a later time, after the code creating the event has
  /// completed.
  _EventBus({bool sync = false})
      : _streamController = StreamController.broadcast(sync: sync);

  /// Instead of using the default [StreamController] you can use this constructor
  /// to pass your own controller.
  ///
  /// An example would be to use an RxDart Subject as the controller.
  _EventBus.customController(StreamController<Object> controller)
      : _streamController = controller;

  Stream<T> _getStream<T>() {
    if (T == dynamic) {
      return streamController.stream as Stream<T>;
    } else {
      return streamController.stream.where((event) => event is T).cast<T>();
    }
  }

  Stream<T> on<T>() {
    return _getStream<T>();
  }

  /// Fires a new event on the event bus with the specified [event].
  ///
  void fire(event) {
    streamController.add(event);
  }

  /// Destroy this [_EventBus]. This is generally only in a testing context.
  ///
  void destroy() {
    _streamController.close();
  }
}
