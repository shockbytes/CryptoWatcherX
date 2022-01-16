import 'package:cryptowatcherx/data/core/percentage.dart';

Percentage computePercentage({
  required double base,
  required double now,
}) {
  double computed = ((now / base) * 100) - 100;
  return Percentage(double.parse(computed.toStringAsFixed(2)));
}
