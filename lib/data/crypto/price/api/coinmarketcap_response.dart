class CoinmarketCapResponse {
  CoinmarketCapResponse({
    required Status status,
    required Map<String, dynamic> data,
  }) {
    _status = status;
    _data = data;
  }

  CoinmarketCapResponse.fromJson(dynamic json) {
    _status = Status.fromJson(json['status']);
    _data = json['data'];
  }

  late Status _status;
  late Map<String, dynamic> _data;

  Status? get status => _status;

  Map<String, dynamic> get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status.toJson();

    return map;
  }
}

class CoinInfo {
  CoinInfo({
    int? id,
    required String name,
    required String symbol,
    String? slug,
    num? numMarketPairs,
    String? dateAdded,
    List<String>? tags,
    num? maxSupply,
    num? circulatingSupply,
    num? totalSupply,
    Platform? platform,
    num? isActive,
    num? cmcRank,
    num? isFiat,
    String? lastUpdated,
    required Quote quote,
  }) {
    _id = id;
    _name = name;
    _symbol = symbol;
    _slug = slug;
    _numMarketPairs = numMarketPairs;
    _dateAdded = dateAdded;
    _tags = tags;
    _maxSupply = maxSupply;
    _circulatingSupply = circulatingSupply;
    _totalSupply = totalSupply;
    _platform = platform;
    _isActive = isActive;
    _cmcRank = cmcRank;
    _isFiat = isFiat;
    _lastUpdated = lastUpdated;
    _quote = quote;
  }

  CoinInfo.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _symbol = json['symbol'];
    _slug = json['slug'];
    _numMarketPairs = json['num_market_pairs'];
    _dateAdded = json['date_added'];
    _tags = json['tags'] != null ? json['tags'].cast<String>() : [];
    _maxSupply = json['max_supply'];
    _circulatingSupply = json['circulating_supply'];
    _totalSupply = json['total_supply'];
    _platform =
        json['platform'] != null ? Platform.fromJson(json['platform']) : null;
    _isActive = json['is_active'];
    _cmcRank = json['cmc_rank'];
    _isFiat = json['is_fiat'];
    _lastUpdated = json['last_updated'];
    _quote = Quote.fromJson(json['quote']);
  }

  int? _id;
  late String _name;
  late String _symbol;
  String? _slug;
  num? _numMarketPairs;
  String? _dateAdded;
  List<String>? _tags;
  num? _maxSupply;
  num? _circulatingSupply;
  num? _totalSupply;
  Platform? _platform;
  num? _isActive;
  num? _cmcRank;
  num? _isFiat;
  String? _lastUpdated;
  late Quote _quote;

  int? get id => _id;

  String? get name => _name;

  String? get symbol => _symbol;

  String? get slug => _slug;

  num? get numMarketPairs => _numMarketPairs;

  String? get dateAdded => _dateAdded;

  List<String>? get tags => _tags;

  num? get maxSupply => _maxSupply;

  num? get circulatingSupply => _circulatingSupply;

  num? get totalSupply => _totalSupply;

  Platform? get platform => _platform;

  num? get isActive => _isActive;

  num? get cmcRank => _cmcRank;

  num? get isFiat => _isFiat;

  String? get lastUpdated => _lastUpdated;

  Quote get quote => _quote;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['symbol'] = _symbol;
    map['slug'] = _slug;
    map['num_market_pairs'] = _numMarketPairs;
    map['date_added'] = _dateAdded;
    map['tags'] = _tags;
    map['max_supply'] = _maxSupply;
    map['circulating_supply'] = _circulatingSupply;
    map['total_supply'] = _totalSupply;
    if (_platform != null) {
      map['platform'] = _platform?.toJson();
    }
    map['is_active'] = _isActive;
    map['cmc_rank'] = _cmcRank;
    map['is_fiat'] = _isFiat;
    map['last_updated'] = _lastUpdated;
    map['quote'] = _quote.toJson();
    return map;
  }
}

class Quote {
  Quote({
    required USD usd,
  }) {
    _usd = usd;
  }

  Quote.fromJson(dynamic json) {
    _usd = USD.fromJson(json['USD']);
  }

  late USD _usd;

  USD get usd => _usd;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['USD'] = _usd.toJson();
    return map;
  }
}

class USD {
  USD({
    required num price,
    required num volume24h,
    required num volumeChange24h,
    required num percentChange1h,
    required num percentChange24h,
    required num percentChange7d,
    required num percentChange30d,
    required num percentChange60d,
    required num percentChange90d,
    required num marketCap,
    required num marketCapDominance,
    required num fullyDilutedMarketCap,
    String? lastUpdated,
  }) {
    _price = price;
    _volume24h = volume24h;
    _volumeChange24h = volumeChange24h;
    _percentChange1h = percentChange1h;
    _percentChange24h = percentChange24h;
    _percentChange7d = percentChange7d;
    _percentChange30d = percentChange30d;
    _percentChange60d = percentChange60d;
    _percentChange90d = percentChange90d;
    _marketCap = marketCap;
    _marketCapDominance = marketCapDominance;
    _fullyDilutedMarketCap = fullyDilutedMarketCap;
    _lastUpdated = lastUpdated;
  }

  USD.fromJson(dynamic json) {
    _price = json['price'];
    _volume24h = json['volume_24h'];
    _volumeChange24h = json['volume_change_24h'];
    _percentChange1h = json['percent_change_1h'];
    _percentChange24h = json['percent_change_24h'];
    _percentChange7d = json['percent_change_7d'];
    _percentChange30d = json['percent_change_30d'];
    _percentChange60d = json['percent_change_60d'];
    _percentChange90d = json['percent_change_90d'];
    _marketCap = json['market_cap'];
    _marketCapDominance = json['market_cap_dominance'];
    _fullyDilutedMarketCap = json['fully_diluted_market_cap'];
    _lastUpdated = json['last_updated'];
  }

  late num _price;
  late num _volume24h;
  late num _volumeChange24h;
  late num _percentChange1h;
  late num _percentChange24h;
  late num _percentChange7d;
  late num _percentChange30d;
  late num _percentChange60d;
  late num _percentChange90d;
  late num _marketCap;
  late num _marketCapDominance;
  late num _fullyDilutedMarketCap;
  String? _lastUpdated;

  num get price => _price;

  num get volume24h => _volume24h;

  num get volumeChange24h => _volumeChange24h;

  num get percentChange1h => _percentChange1h;

  num get percentChange24h => _percentChange24h;

  num get percentChange7d => _percentChange7d;

  num get percentChange30d => _percentChange30d;

  num get percentChange60d => _percentChange60d;

  num get percentChange90d => _percentChange90d;

  num get marketCap => _marketCap;

  num get marketCapDominance => _marketCapDominance;

  num get fullyDilutedMarketCap => _fullyDilutedMarketCap;

  String? get lastUpdated => _lastUpdated;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['price'] = _price;
    map['volume_24h'] = _volume24h;
    map['volume_change_24h'] = _volumeChange24h;
    map['percent_change_1h'] = _percentChange1h;
    map['percent_change_24h'] = _percentChange24h;
    map['percent_change_7d'] = _percentChange7d;
    map['percent_change_30d'] = _percentChange30d;
    map['percent_change_60d'] = _percentChange60d;
    map['percent_change_90d'] = _percentChange90d;
    map['market_cap'] = _marketCap;
    map['market_cap_dominance'] = _marketCapDominance;
    map['fully_diluted_market_cap'] = _fullyDilutedMarketCap;
    map['last_updated'] = _lastUpdated;
    return map;
  }
}

class Platform {
  Platform({
    int? id,
    String? name,
    String? symbol,
    String? slug,
    String? tokenAddress,
  }) {
    _id = id;
    _name = name;
    _symbol = symbol;
    _slug = slug;
    _tokenAddress = tokenAddress;
  }

  Platform.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _symbol = json['symbol'];
    _slug = json['slug'];
    _tokenAddress = json['token_address'];
  }

  int? _id;
  String? _name;
  String? _symbol;
  String? _slug;
  String? _tokenAddress;

  int? get id => _id;

  String? get name => _name;

  String? get symbol => _symbol;

  String? get slug => _slug;

  String? get tokenAddress => _tokenAddress;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['symbol'] = _symbol;
    map['slug'] = _slug;
    map['token_address'] = _tokenAddress;
    return map;
  }
}

class Status {
  Status({
    String? timestamp,
    int? errorCode,
    dynamic errorMessage,
    int? elapsed,
    int? creditCount,
    dynamic notice,
  }) {
    _timestamp = timestamp;
    _errorCode = errorCode;
    _errorMessage = errorMessage;
    _elapsed = elapsed;
    _creditCount = creditCount;
    _notice = notice;
  }

  Status.fromJson(dynamic json) {
    _timestamp = json['timestamp'];
    _errorCode = json['error_code'];
    _errorMessage = json['error_message'];
    _elapsed = json['elapsed'];
    _creditCount = json['credit_count'];
    _notice = json['notice'];
  }

  String? _timestamp;
  int? _errorCode;
  dynamic _errorMessage;
  int? _elapsed;
  int? _creditCount;
  dynamic _notice;

  String? get timestamp => _timestamp;

  int? get errorCode => _errorCode;

  dynamic get errorMessage => _errorMessage;

  int? get elapsed => _elapsed;

  int? get creditCount => _creditCount;

  dynamic get notice => _notice;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['timestamp'] = _timestamp;
    map['error_code'] = _errorCode;
    map['error_message'] = _errorMessage;
    map['elapsed'] = _elapsed;
    map['credit_count'] = _creditCount;
    map['notice'] = _notice;
    return map;
  }
}
