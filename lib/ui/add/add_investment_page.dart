import 'package:cryptowatcherx/bloc/add/add_bloc.dart';
import 'package:cryptowatcherx/data/core/crypto_currency.dart';
import 'package:cryptowatcherx/data/core/money.dart';
import 'package:cryptowatcherx/data/crypto/image/crypto_currency_image_path_service.dart';
import 'package:cryptowatcherx/data/injection/dependency_injector.dart';
import 'package:cryptowatcherx/data/investment/model/investment.dart';
import 'package:cryptowatcherx/ui/core/platform_components.dart';
import 'package:cryptowatcherx/util/crypto_colors.dart';
import 'package:cryptowatcherx/util/crypto_text_style.dart';
import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';

class AddInvestmentPage extends StatefulWidget {
  const AddInvestmentPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AddInvestmentPageState();
}

class _AddInvestmentPageState extends State<AddInvestmentPage> {

  final AddBloc _bloc = DependencyInjector.get<AddBloc>();

  final CryptoCurrencyImagePathService _imagePathService =
      DependencyInjector.get<CryptoCurrencyImagePathService>();

  final TextEditingController _cryptoInputController = TextEditingController();
  final TextEditingController _fiatInputController = TextEditingController();

  CryptoCurrency _selectedCryptoCurrency = CryptoCurrency.values.first;
  FiatCurrency _selectedFiatCurrency = FiatCurrency.values.first;
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CryptoColors.background,
      appBar: AppBar(
        backgroundColor: CryptoColors.backgroundDark,
        elevation: 0,
        title: const Text('Add new Crypto'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(height: 46),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 100,
                    child: PlatformComponents.textInput(
                      _cryptoInputController,
                      inputType: const TextInputType.numberWithOptions(
                        decimal: true,
                      ),
                    ),
                  ),
                  const SizedBox(width: 32),
                  DropdownButton<CryptoCurrency>(
                    dropdownColor: CryptoColors.backgroundDark,
                    items: CryptoCurrency.values
                        .map(
                          (cc) => DropdownMenuItem(
                            value: cc,
                            child: Row(
                              children: [
                                _imagePathService.buildCryptoCurrencyImage(
                                  cc,
                                  size: 24,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  cc.coinName,
                                  style: CryptoTextStyle.textDropdown,
                                )
                              ],
                            ),
                          ),
                        )
                        .toList(),
                    value: _selectedCryptoCurrency,
                    onChanged: (CryptoCurrency? newValue) {
                      setState(() {
                        if (newValue != null) {
                          _selectedCryptoCurrency = newValue;
                        }
                      });
                    },
                  )
                ],
              ),
              const SizedBox(height: 24),
              const Icon(
                Icons.keyboard_arrow_down_rounded,
                color: CryptoColors.text,
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 100,
                    child: PlatformComponents.textInput(
                      _fiatInputController,
                      inputType: const TextInputType.numberWithOptions(
                        decimal: true,
                      ),
                    ),
                  ),
                  const SizedBox(width: 32),
                  DropdownButton<FiatCurrency>(
                    dropdownColor: CryptoColors.backgroundDark,
                    items: FiatCurrency.values
                        .map(
                          (fc) => DropdownMenuItem(
                            value: fc,
                            child: Row(
                              children: [
                                Text(
                                  fc.symbol,
                                  style: CryptoTextStyle.textDropdown,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  fc.code,
                                  style: CryptoTextStyle.textDropdown,
                                )
                              ],
                            ),
                          ),
                        )
                        .toList(),
                    value: _selectedFiatCurrency,
                    onChanged: (FiatCurrency? newValue) {
                      setState(() {
                        if (newValue != null) {
                          _selectedFiatCurrency = newValue;
                        }
                      });
                    },
                  )
                ],
              ),
              const SizedBox(height: 72),
              Text(
                'Bought on:',
                style: CryptoTextStyle.textDefault,
              ),
              const SizedBox(height: 24),
              DatePicker(
                DateTime.now(),
                // DateTime.parse('2022-01-01'),
                initialSelectedDate: _selectedDate,
                monthTextStyle: CryptoTextStyle.dateMonthTextStyle,
                dateTextStyle: CryptoTextStyle.dateDateTextStyle,
                dayTextStyle: CryptoTextStyle.dateDayTextStyle,
                selectionColor: CryptoColors.accentDark,
                selectedTextColor: Colors.white,
                onDateChange: (date) {
                  // New date selected
                  setState(() {
                    _selectedDate = date;
                  });
                },
              ),
              const Spacer(),
              OutlinedButton(
                onPressed: () => _validateAndProceed(context),
                child: Text(
                  'Add investment',
                  style: CryptoTextStyle.textDefault
                      .copyWith(color: CryptoColors.accent),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _validateAndProceed(BuildContext context) async {
    if (!_validate()) {
      // TODO Show error dialog
      return;
    }

    Investment investment = Investment(
      currency: _selectedCryptoCurrency,
      buyingPrice: Money(
        double.parse(_fiatInputController.text),
        _selectedFiatCurrency
      ),
      buyingTime: _selectedDate,
      amount: double.parse(_cryptoInputController.text),
    );

    await _bloc.addInvestment(investment);

    Navigator.pop(context);
  }

  bool _validate() {
    return _cryptoInputController.text.isNotEmpty &&
        _fiatInputController.text.isNotEmpty;
  }
}
