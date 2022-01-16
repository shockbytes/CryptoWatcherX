import 'package:cryptowatcherx/bloc/balance/balance.dart';
import 'package:cryptowatcherx/bloc/balance/balance_bloc.dart';
import 'package:cryptowatcherx/util/crypto_colors.dart';
import 'package:cryptowatcherx/util/crypto_text_style.dart';
import 'package:flutter/material.dart';

class BalanceBar extends StatelessWidget implements PreferredSizeWidget {
  final BalanceBloc _bloc = BalanceBloc();

  BalanceBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CryptoColors.backgroundDark,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: StreamBuilder<Balance>(
              stream: _bloc.balance,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  Balance balance = snapshot.data!;
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        balance.current.toString(),
                        style: CryptoTextStyle.balanceCurrent,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        balance.invested.toString(),
                        style: CryptoTextStyle.balanceInitial,
                      ),
                      const Spacer(),
                      Text(
                        '${balance.development.percentage}%',
                        style: CryptoTextStyle.balanceDevelopment(
                          balance.isPositive
                        ),
                      ),
                    ],
                  );
                } else {
                  return Center(
                    child: Text('Fetching data'),
                  );
                }
              }),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(164);
}
