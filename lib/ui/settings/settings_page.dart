import 'package:cached_network_image/cached_network_image.dart';
import 'package:cryptowatcherx/bloc/settings/settings_bloc.dart';
import 'package:cryptowatcherx/data/injection/dependency_injector.dart';
import 'package:cryptowatcherx/util/crypto_colors.dart';
import 'package:cryptowatcherx/util/crypto_text_style.dart';
import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';

class SettingsPage extends StatelessWidget {

  final SettingsBloc _bloc = DependencyInjector.get<SettingsBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CryptoColors.background,
      appBar: AppBar(
        backgroundColor: CryptoColors.backgroundDark,
        elevation: 0,
        title: const Text('Settings'),
      ),
      body: SafeArea(
        child: SettingsList(
          physics: BouncingScrollPhysics(),
          lightTheme: SettingsThemeData(
            settingsListBackground: CryptoColors.background,
            settingsSectionBackground: CryptoColors.accentDark,
          ),
          sections: [
            SettingsSection(
              title: Text(
                'Sources',
                style: CryptoTextStyle.textSettingsHeader,
              ),
              tiles: [
                SettingsTile(
                  title: Text(
                    'Crypto Price Source',
                    style: CryptoTextStyle.textDefault,
                  ),
                  description: Row(
                    children: [
                      ColorFiltered(
                        colorFilter: ColorFilter.mode(
                          CryptoColors.background,
                          BlendMode.color,
                        ),
                        child: CachedNetworkImage(
                          imageUrl: _bloc.priceSource.icon,
                          width: 32,
                        ),
                      ),
                      SizedBox(width: 16),
                      Text(
                        _bloc.priceSource.name,
                        style: CryptoTextStyle.textDefault,
                      )
                    ],
                  ),
                ),
                SettingsTile(
                  title: Text(
                    'Currency Conversion Source',
                    style: CryptoTextStyle.textDefault,
                  ),
                  description: Row(
                    children: [
                      Text(
                        _bloc.conversionSource.name,
                        style: CryptoTextStyle.textDefault,
                      )
                    ],
                  ),
                ),
              ],
            ),
            SettingsSection(
              title: Text(
                'About',
                style: CryptoTextStyle.textSettingsHeader,
              ),
              tiles: [
                SettingsTile(
                  title: Text(
                    'Version',
                    style: CryptoTextStyle.textDefault,
                  ),
                  description: Text(
                    'v1.0',
                    style: CryptoTextStyle.textDefault,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
