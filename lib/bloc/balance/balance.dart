import 'package:cryptowatcherx/data/core/money.dart';
import 'package:cryptowatcherx/data/core/percentage.dart';
import 'package:cryptowatcherx/util/math_util.dart';

class Balance {
  final Money current;
  final Money invested;

  Balance({
    required this.current,
    required this.invested,
  });

  Percentage get development {
    return computePercentage(
      base: invested.amount,
      now: current.amount,
    );
  }

  bool get isPositive => development.percentage >= 0;
}
