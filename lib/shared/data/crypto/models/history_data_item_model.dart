class HistoryDataItemModel {
  final int time;
  final double price;

  HistoryDataItemModel({
    required this.time,
    required this.price,
  });

  String get timeFormatted => DateTime.fromMillisecondsSinceEpoch(time)
      .toLocal()
      .toString()
      .substring(0, 19)
      .replaceAll(' ', 'T');
}
