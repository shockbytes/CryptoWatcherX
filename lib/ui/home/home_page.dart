import 'package:cryptowatcherx/bloc/home/home_bloc.dart';
import 'package:cryptowatcherx/data/injection/dependency_injector.dart';
import 'package:cryptowatcherx/data/investment/model/developed_investment.dart';
import 'package:cryptowatcherx/ui/add/add_investment_page.dart';
import 'package:cryptowatcherx/ui/core/balance_bar.dart';
import 'package:cryptowatcherx/ui/core/developed_investment_card.dart';
import 'package:cryptowatcherx/ui/settings/settings_page.dart';
import 'package:cryptowatcherx/util/crypto_colors.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final HomeBloc _bloc = DependencyInjector.get<HomeBloc>();

  HomePage({Key? key}) : super(key: key) {
    _bloc.fetch();
  }

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
            return Container(
              child: Center(
                child: Text(
                  snapshot.error.toString(),
                ),
              ),
            );
          } else {
            return Center(
                child: CircularProgressIndicator(
                  color: CryptoColors.text,
                )
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddInvestmentPage(),
            ),
          );
        },
        backgroundColor: CryptoColors.accent,
        child: Icon(
          Icons.add_outlined,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: BottomAppBar(
        color: CryptoColors.backgroundDark,
        shape: CircularNotchedRectangle(),
        notchMargin: 5.0,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SettingsPage(),
                  ),
                );
              },
              icon: Icon(
                Icons.settings_outlined,
                color: CryptoColors.text,
              ),
            ),
            SizedBox(width: 12),
            IconButton(
              onPressed: () => _bloc.logout(),
              icon: Icon(
                Icons.logout,
                color: CryptoColors.text,
              ),
            ),
            Spacer(),
            Visibility(
              visible: false,
              child: Padding(
                padding: const EdgeInsets.only(right: 90),
                child: IconButton(
                  onPressed: () => _bloc.refresh(),
                  icon: Icon(
                    Icons.refresh_outlined,
                    color: CryptoColors.text,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
