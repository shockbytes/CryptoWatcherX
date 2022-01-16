import 'package:cryptowatcherx/bloc/home/home_bloc.dart';
import 'package:cryptowatcherx/data/injection/dependency_injector.dart';
import 'package:cryptowatcherx/data/investment/model/developed_investment.dart';
import 'package:cryptowatcherx/ui/core/balance_bar.dart';
import 'package:cryptowatcherx/ui/core/developed_investment_card.dart';
import 'package:cryptowatcherx/util/crypto_colors.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final HomeBloc _bloc = DependencyInjector.get<HomeBloc>();

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CryptoColors.background,
      appBar: BalanceBar(),
      body: StreamBuilder<List<DevelopedInvestment>>(
        stream: _bloc.investments,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<DevelopedInvestment> investments = snapshot.data!;
            return ListView.separated(
              itemCount: investments.length,
              physics: const BouncingScrollPhysics(),
              separatorBuilder: (context, index) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                return DevelopedInvestmentCard(investments[index]);
              },
            );
          } else if (snapshot.hasError) {
            return Container(color: Colors.red);
          } else {
            return Center(child: Text('Loading'));
          }
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        backgroundColor: CryptoColors.accent,
        label: Text('New crypto'),
      ),
    );
  }
}
