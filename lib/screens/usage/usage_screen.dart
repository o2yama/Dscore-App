import 'package:dscore_app/utilities.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import '../../ad_state.dart';

class UsageScreen extends StatefulWidget {
  @override
  _UsageScreenState createState() => _UsageScreenState();
}

class _UsageScreenState extends State<UsageScreen> {
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
        child: Container(
          color: Theme.of(context).backgroundColor,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                _ad(context),
                _backButton(context),
                _usageImages(),
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
      height: Utilities().isMobile() ? 50 : 80,
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
              '使い方',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: Utilities().isMobile() ? 16 : 24,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _usageImages() {
    return Expanded(
      child: ListView(
        children: [
          SizedBox(height: 50),
          Image.asset('images/tutorial_1.png'),
          Image.asset('images/tutorial_2.png'),
          Image.asset('images/tutorial_3.png'),
          Image.asset('images/tutorial_4.png'),
        ],
      ),
    );
  }
}
