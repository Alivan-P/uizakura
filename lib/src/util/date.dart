/// @author luwenjie on 2023/12/24 21:02:23

import 'package:intl/intl.dart';

class UizakuraDateUtil {
  static int _offset = 0;
  static const hour48Mills = 48 * 60 * 60 * 1000;
  static const hour24Mills = 24 * 60 * 60 * 1000;
  static const hour1Mills = 1 * 60 * 60 * 1000;
  static const _TAG = "DateUtil";
  static final DateFormat defaultDateFormat = DateFormat("yyyy/MM/dd HH:mm");

  static set offset(int value) {
    _offset = value;
  }

  /// milliseconds
  static int get currentTimeMillis {
    return DateTime.now().millisecondsSinceEpoch + _offset;
  }

  /// 社区时间
  /// time 只能是 Milliseconds / DateTime
  static String prettyTime(Object? time) {
    DateTime? timeDate;
    if (time == null) return "";
    if (time is String) {
      timeDate = DateTime.fromMillisecondsSinceEpoch(int.tryParse(time) ?? 0);
    }
    if (time is DateTime) {
      timeDate = time;
    }

    if (timeDate == null) {
      return "";
    }

    final now = DateTime.now();
    final diff = now.millisecondsSinceEpoch - timeDate.millisecondsSinceEpoch;
    int seconds = diff ~/ 1000;
    if (seconds < 1) {
      seconds = 1;
    }
    if (seconds < 60) {
      return "$seconds s ago";
    }
    final minute = seconds ~/ 60;
    if (minute < 60) {
      return "$minute min ago";
    }

    final h = minute ~/ 60;
    if (h <= 3) {
      return "$h h ago";
    }

    if (isToday(timeDate.millisecondsSinceEpoch)) {
      return "today ${DateFormat("HH:mm").format(timeDate)}";
    }

    if (isYesterday(timeDate.millisecondsSinceEpoch)) {
      return "yesterday ${DateFormat("HH:mm").format(timeDate)}";
    }

    if (isThisYear(timeDate.millisecondsSinceEpoch)) {
      return DateFormat("MM-dd").format(timeDate);
    }

    return DateFormat("yyyy-MM-dd").format(timeDate);
  }

  static DateTime getLastMonday({bool isUtc = false}) {
    DateTime now = DateTime.now();
    if (isUtc) {
      now = now.toUtc();
    }
    // 计算本周一的日期
    DateTime thisMonday = now.subtract(Duration(days: now.weekday - 1));
    // 计算上周一的日期
    DateTime lastMonday = thisMonday.subtract(const Duration(days: 7));
    // 格式化日期
    return lastMonday;
  }

  static String getLastMondayStr({bool isUtc = false, DateFormat? dateFormat}) {
    // 计算上周一的日期
    DateTime lastMonday = getLastMonday(isUtc: isUtc);
    // 格式化日期
    String lastMondayStr = (dateFormat ?? defaultDateFormat).format(lastMonday);
    return lastMondayStr;
  }

  static String getLastSunday({bool isUtc = false, DateFormat? dateFormat}) {
    DateTime now = DateTime.now();
    if (isUtc) {
      now = now.toUtc();
    }
    // 计算本周一的日期
    DateTime thisMonday = now.subtract(Duration(days: now.weekday - 1));
    // 计算上周一的日期
    DateTime lastMonday = thisMonday.subtract(const Duration(days: 7));
    // 计算上周日的日期
    DateTime lastSunday = lastMonday.add(const Duration(days: 6));
    // 格式化日期
    return (dateFormat ?? defaultDateFormat).format(lastSunday);
  }

  static List<String> getTimer(int milliseconds) {
    if (milliseconds < 0) return ["", "", ""];
    var h = milliseconds / 60 / 60 ~/ 1000;
    int m = (milliseconds - h * 60 * 60 * 100) / 60 ~/ 1000;
    int s = (milliseconds - h * 60 * 60 * 100 - m * 60 * 1000) ~/ 1000;
    return [
      h < 10 ? "0$h" : "$h",
      m < 10 ? "0$m" : "$m",
      s < 10 ? "0$s" : "$s"
    ];
  }

  /// milliseconds -> String
  static String msToString(Object milliseconds,
      {bool isUtc = false, DateFormat? dateFormat}) {
    final DateTime date;
    if (milliseconds is int) {
      date = DateTime.fromMillisecondsSinceEpoch(milliseconds, isUtc: isUtc);
    } else {
      date = DateTime.fromMillisecondsSinceEpoch(
          int.tryParse(milliseconds.toString()) ?? 0,
          isUtc: isUtc);
    }
    final df = dateFormat ?? defaultDateFormat;
    return df.format(date);
  }

  static bool isTheDayAfterTomorrow(int? milliseconds,
      {bool isUtc = false, int? locMs}) {
    if (milliseconds == null || milliseconds == 0) return false;
    DateTime now;
    if (locMs != null) {
      now = DateTime.fromMillisecondsSinceEpoch(locMs, isUtc: isUtc);
    } else {
      now = isUtc ? DateTime.now().toUtc() : DateTime.now().toLocal();
    }

    final theDayAfterTomorrow =
        DateTime(now.year, now.month, now.day).millisecondsSinceEpoch +
            48 * 60 * 60 * 1000;
    return isMillisecondsEqualsYearMonthDay(theDayAfterTomorrow, milliseconds,
        isUtc: isUtc);
  }

  static bool isThisYear(int? milliseconds, {bool isUtc = false, int? locMs}) {
    if (milliseconds == null || milliseconds == 0) return false;
    DateTime old =
        DateTime.fromMillisecondsSinceEpoch(milliseconds, isUtc: isUtc);
    DateTime now;
    if (locMs != null) {
      now = DateTime.fromMillisecondsSinceEpoch(locMs, isUtc: isUtc);
    } else {
      now = isUtc ? DateTime.now().toUtc() : DateTime.now().toLocal();
    }
    return old.year == now.year;
  }

  static bool isTomorrow(int? milliseconds, {bool isUtc = false, int? locMs}) {
    if (milliseconds == null || milliseconds == 0) return false;
    DateTime now;
    if (locMs != null) {
      now = DateTime.fromMillisecondsSinceEpoch(locMs, isUtc: isUtc);
    } else {
      now = isUtc ? DateTime.now().toUtc() : DateTime.now().toLocal();
    }
    final tomorrowMs = isUtc
        ? DateTime.utc(now.year, now.month, now.day).millisecondsSinceEpoch
        : DateTime(now.year, now.month, now.day).millisecondsSinceEpoch +
            24 * 60 * 60 * 1000;
    return isMillisecondsEqualsYearMonthDay(tomorrowMs, milliseconds,
        isUtc: isUtc);
  }

  static bool isYesterday(int? milliseconds, {bool isUtc = false}) {
    if (milliseconds == null || milliseconds == 0) return false;
    final now = isUtc ? DateTime.now().toUtc() : DateTime.now();
    final yesterdayMs = isUtc
        ? DateTime.utc(now.year, now.month, now.day).millisecondsSinceEpoch
        : DateTime(now.year, now.month, now.day).millisecondsSinceEpoch -
            24 * 60 * 60 * 1000;
    return isMillisecondsEqualsYearMonthDay(yesterdayMs, milliseconds,
        isUtc: isUtc);
  }

  static bool isEqualsYearMonthDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  /// 比较是否同一天
  static bool isMillisecondsEqualsYearMonthDay(
      int? millisecondsA, int? millisecondsB,
      {bool isUtc = false}) {
    if (millisecondsA == null || millisecondsA == 0) return false;
    if (millisecondsB == null || millisecondsB == 0) return false;
    DateTime a =
        DateTime.fromMillisecondsSinceEpoch(millisecondsA, isUtc: isUtc);
    DateTime b =
        DateTime.fromMillisecondsSinceEpoch(millisecondsB, isUtc: isUtc);

    return isEqualsYearMonthDay(a, b);
  }

  /// 统一用 utc 时间判断
  static bool isToday(int? milliseconds, {bool isUtc = false}) {
    if (milliseconds == null || milliseconds == 0) return false;
    DateTime old =
        DateTime.fromMillisecondsSinceEpoch(milliseconds, isUtc: isUtc);
    DateTime now = isUtc ? DateTime.now().toUtc() : DateTime.now().toLocal();
    return old.year == now.year && old.month == now.month && old.day == now.day;
  }

  static bool isSameMonthDay(int? milliseconds, {bool isUtc = false}) {
    if (milliseconds == null || milliseconds == 0) return false;
    DateTime old =
        DateTime.fromMillisecondsSinceEpoch(milliseconds, isUtc: isUtc);
    DateTime now = isUtc ? DateTime.now().toUtc() : DateTime.now().toLocal();
    return old.month == now.month && old.day == now.day;
  }

  /// 比较小时
  static bool isEqualsHourWithNow(int? milliseconds,
      {bool isUtc = false, int? locMs}) {
    if (milliseconds == null || milliseconds == 0) return false;
    DateTime old =
        DateTime.fromMillisecondsSinceEpoch(milliseconds, isUtc: isUtc);
    DateTime now;
    if (locMs != null) {
      now = DateTime.fromMillisecondsSinceEpoch(locMs, isUtc: isUtc);
    } else {
      now = isUtc ? DateTime.now().toUtc() : DateTime.now().toLocal();
    }
    return old.hour == now.hour;
  }
}
