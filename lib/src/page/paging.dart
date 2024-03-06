import 'dart:async';

import 'package:flutter/foundation.dart';

/// @author luwenjie on 2023/10/22 22:22:25
abstract class UizakuraPagingDateSource<T> {
  final List<T> _all = <T>[];
  ListPaging<T>? previousPaging;
  final ValueNotifier<ListPaging<T>?> _dataNotifier = ValueNotifier(null);

  List<T> get all => _all;

  // no effect with [all] [previousPaging]
  var _dryRun = false;

  UizakuraPagingDateSource();

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

  Future<void> dryRun(FutureOr<dynamic>? Function() block) async {
    _dryRun = true;
    await block.call();
    _dryRun = false;
  }

  Future<ListPaging<T>> getList(bool refresh) async {
    if (refresh) {
      if (!_dryRun) {
        previousPaging = null;
      }
    }
    try {
      final itemPaging = (await fetchPage(!_dryRun ? previousPaging : null));
      if (itemPaging.isSuccess) {
        if (refresh) {
          if (!_dryRun) {
            _all.clear();
          }
        }
        if (!_dryRun) {
          previousPaging = itemPaging;
          _all.addAll(itemPaging.items);
        }
      }
      _dataNotifier.value = itemPaging;
      return itemPaging;
    } catch (e) {
      return ListPaging(
          items: [],
          errorMessage: e.toString(),
          isSuccess: false,
          hasMore: false);
    }
  }

  @protected
  Future<ListPaging<T>> fetchPage(ListPaging<T>? previousPaging);

  void setData(List<T> list) {
    _all.clear();
    _all.addAll(list);
  }
}

class ListPaging<T> {
  final List<T> items;
  bool isSuccess;
  final int total;
  final String? cursor;
  final int? intCursor;
  final bool hasMore;
  final String errorMessage;

  ListPaging({
    this.items = const [],
    this.isSuccess = true,
    this.total = 0,
    this.hasMore = true,
    this.cursor,
    this.intCursor,
    this.errorMessage = "",
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ListPaging &&
          runtimeType == other.runtimeType &&
          items == other.items &&
          isSuccess == other.isSuccess &&
          total == other.total &&
          intCursor == other.intCursor &&
          hasMore == other.hasMore &&
          cursor == other.cursor &&
          errorMessage == other.errorMessage);

  @override
  int get hashCode =>
      items.hashCode ^
      isSuccess.hashCode ^
      total.hashCode ^
      hasMore.hashCode ^
      intCursor.hashCode ^
      cursor.hashCode ^
      errorMessage.hashCode;

  @override
  String toString() {
    return 'ListPaging{ items: $items, total: $total, success: $isSuccess, hasMore: $hasMore, errorMessage: $errorMessage, next: $cursor, intCursor: $intCursor}';
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
      'hasMore': this.hasMore,
      'errorMessage': this.errorMessage,
    };
  }

  factory ListPaging.fromMap(Map<String, dynamic> map) {
    return ListPaging(
      items: map['items'] as List<T>,
      isSuccess: map['success'] as bool,
      hasMore: map['hasMore'] as bool,
      errorMessage: map['errorMessage'] as String,
    );
  }
}
