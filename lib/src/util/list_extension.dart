extension ListExtensions on List<dynamic> {
  /// remove first element and return it.
  dynamic shift() {
    if (length == 1) return first;
    final remove = first;
    removeAt(0);
    return remove;
  }

  List<T> sublistSafely<T>(int start, [int? end]) {
    if (isEmpty) return this as List<T>;
    if ((end ?? 0) > length) {
      return this as List<T>;
    }
    return sublist(start, end) as List<T>;
  }

  List<T> joinElement<T>(T join) {
    if (length == 0) return [];

    final l = <T>[];
    for (int i = 0; i < length; i++) {
      l.add(this[i]);
      if (i < length - 1) {
        l.add(join);
      }
    }

    return l;
  }
}
