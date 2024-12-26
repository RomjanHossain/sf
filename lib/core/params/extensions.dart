extension Conversion on double {
  String toCelsius() => (this - 273.15).toStringAsFixed(1);
}

extension ConversionOnInt on int {
  String toTime() {
    final dateTime = DateTime.fromMillisecondsSinceEpoch(this * 1000);
    return '${dateTime.hour}:${dateTime.minute}';
  }

  String toTime2() {
    final dateTime = DateTime.fromMillisecondsSinceEpoch(this * 1000);
    var hour = dateTime.hour.toString().padLeft(2, '0');
    final minute = dateTime.minute.toString().padLeft(2, '0');
    final amPm = dateTime.hour >= 12 ? 'PM' : 'AM';
    hour = (dateTime.hour > 12 ? dateTime.hour - 12 : dateTime.hour)
        .toString()
        .padLeft(2, '0');
    return '$hour:$minute $amPm';
  }

  String toDay() {
    final dateTime = DateTime.fromMillisecondsSinceEpoch(this * 1000);
    return '${dateTime.day} ${dateTime.month.currMonth()}';
  }

  // month
  String currMonth() {
    switch (this) {
      case 1:
        return 'Jan';
      case 2:
        return 'Feb';
      case 3:
        return 'Mar';
      case 4:
        return 'Apr';
      case 5:
        return 'May';
      case 6:
        return 'Jun';
      case 7:
        return 'Jul';
      case 8:
        return 'Aug';
      case 9:
        return 'Sep';
      case 10:
        return 'Oct';
      case 11:
        return 'Nov';
      case 12:
        return 'Dec';
      default:
        return 'Jan';
    }
  }
}
