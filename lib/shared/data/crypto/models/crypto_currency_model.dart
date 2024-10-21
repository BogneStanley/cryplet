import 'dart:convert';

class CryptoCurrencyModel {
  final String? id;
  final String? symbol;
  final String? name;
  final String? image;
  final double? currentPrice;
  final double? myBalance;
  final bool? isFavorite;
  final double? high24H;
  final double? low24H;

  CryptoCurrencyModel({
    this.id,
    this.symbol,
    this.name,
    this.image,
    this.currentPrice,
    this.high24H,
    this.low24H,
    this.myBalance,
    this.isFavorite,
  });

  factory CryptoCurrencyModel.fromJson(String str) =>
      CryptoCurrencyModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  CryptoCurrencyModel copyWith({
    String? id,
    String? symbol,
    String? name,
    String? image,
    double? currentPrice,
    double? high24H,
    double? low24H,
    double? myBalance,
    bool? isFavorite,
  }) =>
      CryptoCurrencyModel(
        id: id ?? this.id,
        symbol: symbol ?? this.symbol,
        name: name ?? this.name,
        image: image ?? this.image,
        currentPrice: currentPrice ?? this.currentPrice,
        high24H: high24H ?? this.high24H,
        low24H: low24H ?? this.low24H,
        myBalance: myBalance ?? this.myBalance,
        isFavorite: isFavorite ?? this.isFavorite,
      );

  factory CryptoCurrencyModel.fromMap(Map<String, dynamic> json) =>
      CryptoCurrencyModel(
        id: json['id'],
        symbol: json['symbol'],
        name: json['name'],
        image: json['image'],
        currentPrice: json['current_price']?.toDouble(),
        high24H: json['high_24h']?.toDouble(),
        low24H: json['low_24h']?.toDouble(),
        myBalance: json['my_balance']?.toDouble(),
        isFavorite: json['is_favorite'],
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'symbol': symbol,
        'name': name,
        'image': image,
        'current_price': currentPrice,
        'high_24h': high24H,
        'low_24h': low24H,
        'my_balance': myBalance,
        'is_favorite': isFavorite,
      };
}
