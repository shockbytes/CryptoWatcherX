import 'package:cryptowatcherx/data/core/money.dart';
import 'package:cryptowatcherx/data/investment/investment_mapper.dart';

import 'package:cryptowatcherx/data/investment/model/investment.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

import 'investment_repository.dart';

class FirebaseInvestmentRepository implements InvestmentRepository {
  final _databaseUrl =
      'https://cryptowatcherx-default-rtdb.europe-west1.firebasedatabase.app';

  final InvestmentMapper mapper = InvestmentMapper();

  @override
  Stream<Money> getInvestedMoney() {
    return getInvestments().map(
      (investments) {
        if (investments.isEmpty) {
          return Money.empty();
        }

        FiatCurrency currency = investments[0].buyingPrice.currency;
        double sum = investments.fold(
          0,
          (sum, investment) => sum + investment.buyingPrice.amount,
        );

        return Money(
          amount: sum,
          currency: currency,
        );
      },
    );
  }

  @override
  Stream<List<Investment>> getInvestments() {
    return _buildBaseReference().onValue.map(
          (event) => _extractDataFromSnapshot(event.snapshot),
        );
  }

  List<Investment> _extractDataFromSnapshot(DataSnapshot dataSnapshot) {
    var data = dataSnapshot.value as Map<Object?, Object?>;

    List<Investment> investments = [];
    data.forEach(
      (key, value) {
        var investment = mapper.mapFrom(value as Map<Object?, Object?>);

        if (investment != null) {
          investments.add(investment);
        }
      },
    );

    investments.sort((e1, e2) => e1.buyingTime.compareTo(e2.buyingTime));

    return investments;
  }

  @override
  Future placeInvestment(Investment investment) async {
    DatabaseReference newRef = _buildBaseReference().push();
    await newRef.set(mapper.mapTo(investment));
  }

  DatabaseReference _buildBaseReference() {
    User? user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      throw Exception('User must not be null!');
    }

    return FirebaseDatabase.instanceFor(
      app: Firebase.apps.first,
      databaseURL: _databaseUrl,
    ).ref('data/${user.uid}');
  }
}
