class FixerIoResponse {
  FixerIoResponse({
    required bool success,
    required int timestamp,
    required String base,
    required String date,
    required Map<String, double> rates,
  }) {
    _success = success;
    _timestamp = timestamp;
    _base = base;
    _date = date;
    _rates = rates;
  }

  FixerIoResponse.fromJson(dynamic json) {
    _success = json['success'];
    _timestamp = json['timestamp'];
    _base = json['base'];
    _date = json['date'];
    _rates = json['rates'];
  }

  late bool _success;
  late int _timestamp;
  late String _base;
  late String _date;
  late Map<String, dynamic> _rates;

  bool get success => _success;

  int get timestamp => _timestamp;

  String get base => _base;

  String get date => _date;

  Map<String, dynamic> get rates => _rates;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    map['timestamp'] = _timestamp;
    map['base'] = _base;
    map['date'] = _date;
    map['rates'] = _rates;
    return map;
  }
}
