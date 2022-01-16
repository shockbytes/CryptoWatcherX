import 'package:cached_network_image/cached_network_image.dart';
import 'package:cryptowatcherx/data/core/crypto_currency.dart';
import 'package:cryptowatcherx/data/investment/model/developed_investment.dart';
import 'package:cryptowatcherx/util/crypto_colors.dart';
import 'package:cryptowatcherx/util/crypto_text_style.dart';
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
        padding: const EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 8.0,
        ),
        child: Row(
          children: [
            CachedNetworkImage(
              imageUrl: _buildIconUrl(
                  investment.investment.currency, 48, CryptoColors.background),
              height: 48,
            ),
            const SizedBox(width: 4),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  investment.investment.currency.name,
                  style: CryptoTextStyle.investmentCardPrimary,
                ),
                const SizedBox(height: 4),
                Text(
                  '${investment.investment.amount} ${investment.investment.currency.code}',
                  style: CryptoTextStyle.investmentCardTertiary,
                ),
              ],
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  investment.currentPrice.toString(),
                  style: CryptoTextStyle.investmentCardSecondary,
                ),
                const SizedBox(height: 8),
                Text(
                  investment.investment.buyingPrice.toString(),
                  style: CryptoTextStyle.investmentCardTertiary,
                ),
              ],
            ),
            const Spacer(),
            Text(
              investment.development.toString(),
              style: CryptoTextStyle.balanceDevelopment(investment.isPositive),
            ),
            const SizedBox(width: 8)
          ],
        ),
      ),
    );
  }

  String _buildIconUrl(CryptoCurrency currency, int size, Color color) {
    return 'https://cryptoicons.org/api/color/${currency.code.toLowerCase()}/$size/${color.value.toRadixString(16).substring(2)}';
  }
}
