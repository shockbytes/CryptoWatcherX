import 'package:cryptowatcherx/data/core/money.dart';
import 'package:cryptowatcherx/data/core/percentage.dart';

class Balance {
  final Money current;
  final Money initial;
  final Percentage development;

  Balance({
    required this.current,
    required this.initial,
    required this.development,
  });

  bool get isPositive => development.percentage >= 0;
}
