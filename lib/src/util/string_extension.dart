extension StringExtensions on String? {
  String get ellipsisBreakWord {
    if (isNullOrEmpty) {
      return this ?? "";
    }
    String breakWord = ' ';
    for (var element in (this!).runes) {
      breakWord += String.fromCharCode(element);
      breakWord += '\u200B';
    }
    return breakWord;
  }

  bool get isNotNullOrEmpty {
    return (this != null && this!.replaceAll(" ", "").isNotEmpty);
  }

  bool get isNullOrEmpty {
    if (this == null) return true;
    return this!.replaceAll(" ", "").isEmpty;
  }

  bool get isGif {
    final path = this ?? "";
    final b = path.toLowerCase().endsWith(".gif");
    return b;
  }

  bool get isPng {
    final path = this ?? "";
    final b = path.toLowerCase().endsWith(".png");
    return b;
  }

  bool get isWebp {
    final path = this ?? "";
    final b = path.toLowerCase().endsWith(".webp");
    return b;
  }

  String substringAfterLast(String delimiter,
      {String missingDelimiterValue = ""}) {
    if (this == null) return "";
    final index = this!.lastIndexOf(delimiter);
    if (index == -1) {
      return missingDelimiterValue;
    } else {
      return this!.substring(index + delimiter.length, this!.length);
    }
  }

  String substringAfter(String delimiter, {String missingDelimiterValue = ""}) {
    if (this == null) return "";
    final index = this!.indexOf(delimiter);
    if (index == -1) {
      return missingDelimiterValue;
    } else {
      return this!.substring(index + delimiter.length, this!.length);
    }
  }

  String substringBefore(String delimiter,
      {String missingDelimiterValue = ""}) {
    if (this == null) return "";
    final index = this!.indexOf(delimiter);
    if (index == -1) {
      return missingDelimiterValue;
    } else {
      return this!.substring(0, index);
    }
  }

  String substringBeforeLast(String delimiter,
      {String missingDelimiterValue = ""}) {
    if (this == null) return "";
    final index = this!.lastIndexOf(delimiter);
    if (index == -1) {
      return missingDelimiterValue;
    } else {
      return this!.substring(0, index);
    }
  }
}
