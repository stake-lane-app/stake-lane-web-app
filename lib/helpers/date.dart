const today = 0;
const tomorrow = 1;
const yesterday = -1;

int calculateDifference(DateTime date) {
  DateTime now = DateTime.now();
  return DateTime(date.year, date.month, date.day)
      .difference(DateTime(now.year, now.month, now.day))
      .inDays;
}

bool isToday(DateTime date) {
  return calculateDifference(date) == today;
}

bool isTomorrow(DateTime date) {
  return calculateDifference(date) == tomorrow;
}

bool isYesterday(DateTime date) {
  return calculateDifference(date) == yesterday;
}
