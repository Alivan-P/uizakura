import 'package:flutter/foundation.dart';

/// @author luwenjie on 2023/10/22 22:22:25
abstract class ListCursorApiRepo<T> {
  final List<T> _all = <T>[];
  ListPaging<T>? previousPaging;
  final ValueNotifier<ListPaging<T>?> _dataNotifier = ValueNotifier(null);

  List<T> get all => _all;

  // flag cache
  var cache = true;

  ListCursorApiRepo();

  Function() listen(Function(ListPaging<T>) f) {
    l() {
      if (_dataNotifier.value != null) {
        f.call(_dataNotifier.value!);
      }
    }

    _dataNotifier.addListener(l);
    return () {
      _dataNotifier.removeListener(l);
    };
  }

  Future<ListPaging<T>> getList(bool refresh) async {
    int offset;
    if (refresh) {
      offset = 0;
      if (refresh && cache) {
        previousPaging = null;
      }
    } else {
      offset = _all.length;
    }
    try {
      final itemPaging =
          (await fetchPage(cache ? previousPaging : null)).copyWith(
        startingIndex: offset,
      );
      if (itemPaging.isSuccess) {
        if (refresh) {
          if (cache) {
            _all.clear();
          }
        }
        if (cache) {
          previousPaging = itemPaging;
          _all.addAll(itemPaging.items);
        }
      }

      _dataNotifier.value = itemPaging;
      return itemPaging;
    } catch (e, strace) {
      return ListPaging(
          items: [],
          errorMessage: e.toString(),
          isSuccess: false,
          hasMore: true);
    }
  }

  @protected
  Future<ListPaging<T>> fetchPage(ListPaging<T>? previousPaging);

  void update(List<T> newl) {
    _all.clear();
    _all.addAll(newl);
  }
}

class ListPaging<T> {
  final List<T> items;
  bool isSuccess;
  final int offset;
  final int total;
  final String? cursor;
  final bool hasMore;
  final String errorMessage;

//<editor-fold desc="Data Methods">
  ListPaging({
    this.items = const [],
    this.isSuccess = true,
    this.offset = 0,
    this.total = 0,
    this.hasMore = true,
    this.cursor,
    this.errorMessage = "",
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ListPaging &&
          runtimeType == other.runtimeType &&
          items == other.items &&
          isSuccess == other.isSuccess &&
          offset == other.offset &&
          total == other.total &&
          hasMore == other.hasMore &&
          cursor == other.cursor &&
          errorMessage == other.errorMessage);

  @override
  int get hashCode =>
      items.hashCode ^
      isSuccess.hashCode ^
      total.hashCode ^
      offset.hashCode ^
      hasMore.hashCode ^
      cursor.hashCode ^
      errorMessage.hashCode;

  @override
  String toString() {
    return 'ListPaging{ items: $items, total: $total, success: $isSuccess, startingIndex: $offset, hasMore: $hasMore, errorMessage: $errorMessage, next: $cursor,}';
  }

  ListPaging<T> copyWith({
    List<T>? items,
    bool? success,
    int? total,
    int? startingIndex,
    bool? hasMore,
    String? errorMessage,
    String? next,
  }) {
    return ListPaging(
      items: items ?? this.items,
      isSuccess: success ?? this.isSuccess,
      offset: startingIndex ?? this.offset,
      hasMore: hasMore ?? this.hasMore,
      errorMessage: errorMessage ?? this.errorMessage,
      cursor: next ?? this.cursor,
      total: total ?? this.total,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'items': this.items,
      'success': this.isSuccess,
      'startingIndex': this.offset,
      'hasMore': this.hasMore,
      'errorMessage': this.errorMessage,
    };
  }

  factory ListPaging.fromMap(Map<String, dynamic> map) {
    return ListPaging(
      items: map['items'] as List<T>,
      isSuccess: map['success'] as bool,
      offset: map['startingIndex'] as int,
      hasMore: map['hasMore'] as bool,
      errorMessage: map['errorMessage'] as String,
    );
  }

//</editor-fold>
}
