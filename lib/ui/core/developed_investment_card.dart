import 'package:cryptowatcherx/data/investment/model/developed_investment.dart';
import 'package:cryptowatcherx/util/crypto_colors.dart';
import 'package:flutter/material.dart';

class DevelopedInvestmentCard extends StatelessWidget {
  final DevelopedInvestment investment;

  const DevelopedInvestmentCard(this.investment, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: CryptoColors.background,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8), // if you need this
        side: const BorderSide(
          color: Colors.grey,
          width: 1,
        ),
      ),
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Image.network(
              investment.investment.currency.icon,
              height: 32,
            ),
            Text(investment.investment.currency.name),
            Text(investment.investment.buyingPrice.toString()),
          ],
        ),
      ),
    );
  }
}
