

class Percentage {

  final double percentage;

  Percentage(this.percentage);

  @override
  String toString() {
    return '${percentage > 0 ? '+' : ''}$percentage%';
  }
}