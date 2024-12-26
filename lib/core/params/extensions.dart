extension Conversion on double {
  String toCelsius() => (this - 273.15).toStringAsFixed(1);
}

extension ConversionOnInt on int {
  String toTime() {
    final dateTime = DateTime.fromMillisecondsSinceEpoch(this * 1000);
    return '${dateTime.hour}:${dateTime.minute}';
  }
}
