import 'package:cryptowatcherx/data/core/money.dart';

class Conversion {
  final FiatCurrency source;
  final FiatCurrency target;
  final double rate;
  final DateTime timestamp;

  Conversion({
    required this.source,
    required this.target,
    required this.rate,
    required this.timestamp,
  });

  bool isExpired(DateTime threshold) {
    return threshold.isAfter(timestamp);
  }

  Conversion.fromJson(Map<String, dynamic> json)
      : source = FiatCurrencyExtension.ofCode(json['source'])!,
        target = FiatCurrencyExtension.ofCode(json['target'])!,
        rate = json['rate'],
        timestamp = DateTime.parse(json['timestamp']);

  Map<String, dynamic> toJson() {
    return {
      'source': source.code,
      'target': target.code,
      'rate': rate,
      'timestamp': timestamp.toIso8601String()
    };
  }
}
