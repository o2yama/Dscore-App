import 'dart:io';
import 'package:dscore_app/screens/edit_info_screen/edit_mail_screen.dart';
import 'package:dscore_app/screens/edit_info_screen/edit_password_screen.dart';
import 'package:dscore_app/screens/login_sign_up/login/login_model.dart';
import 'package:dscore_app/screens/theme_color/theme_color_screen.dart';
import 'package:dscore_app/screens/usage/usage_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import '../../ad_state.dart';
import '../../utilities.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  BannerAd? banner;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final adState = Provider.of<AdState>(context);
    adState.initialization.then((status) {
      setState(() {
        banner = BannerAd(
          adUnitId: adState.bannerAdUnitId,
          size: AdSize.banner,
          request: AdRequest(),
          listener: adState.adListener,
        )..load();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                _ad(context),
                _backButton(context),
                SizedBox(height: 24),
                _settingsListView(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _ad(BuildContext context) {
    return banner == null
        ? Container(height: 50)
        : Container(
            height: 50,
            child: AdWidget(ad: banner!),
          );
  }

  Widget _backButton(BuildContext context) {
    return Container(
      height: Utilities().isMobile() ? 70 : 90,
      child: InkWell(
        onTap: () => Navigator.pop(context),
        child: Row(
          children: [
            Icon(
              Icons.clear,
              color: Theme.of(context).primaryColor,
              size: Utilities().isMobile() ? 20 : 30,
            ),
            SizedBox(width: 24),
            Text(
              '設定',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: Utilities().isMobile() ? 18 : 24,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _settingsListView(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Container(
      height: Utilities().isMobile() ? height - 144 : height - 164,
      child: ListView(
        children: [
          _settingTile(context, 'テーマカラー', ThemeColorScreen(), Icons.color_lens),
          _settingTile(context, '使い方', UsageScreen(), Icons.info),
          _settingTile(context, 'メール変更', EditMailScreen(), Icons.mail),
          _settingTile(context, 'パスワード変更', EditPasswordScreen(), Icons.vpn_key),
          _settingTile(context, 'ログアウト', Container(), Icons.logout),
        ],
      ),
    );
  }

  Widget _settingTile(
      BuildContext context, String setting, Widget screen, IconData icon) {
    final loginModel = Provider.of<LoginModel>(context, listen: false);
    return InkWell(
      onTap: () {
        if (setting == 'ログアウト') {
          showDialog(
              context: context,
              builder: (context) {
                return Platform.isIOS
                    ? CupertinoAlertDialog(
                        title: Text('ログアウトしてもよろしいですか？'),
                        content: Text('メールアドレスとパスワードを入力すると再度ログインできます。'),
                        actions: [
                          TextButton(
                            child: Text('キャンセル'),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                          TextButton(
                            child: Text('OK'),
                            onPressed: () async {
                              //todo: ログアウト
                              await loginModel.logOut();
                            },
                          ),
                        ],
                      )
                    : AlertDialog();
              });
        } else {
          Navigator.push(context, MaterialPageRoute(builder: (_) => screen));
        }
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 80,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(
                  icon,
                  color: Theme.of(context).primaryColor,
                ),
                SizedBox(width: 24),
                Text(
                  '$setting',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
