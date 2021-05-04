import 'dart:io';
import 'package:dscore_app/data/score_datas.dart';
import 'package:dscore_app/screens/score_list_screen/score_edit_screen/search_screen.dart';
import 'package:dscore_app/screens/score_list_screen/score_model.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import '../../../ad_state.dart';

class ScoreEditScreen extends StatefulWidget {
  ScoreEditScreen(this.event);
  final String event;
  final List<int> order = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  @override
  _ScoreEditScreenState createState() => _ScoreEditScreenState();
}

class _ScoreEditScreenState extends State<ScoreEditScreen> {
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
      body: Consumer<ScoreModel>(
        builder: (context, model, child) {
          final height = MediaQuery.of(context).size.height - 50;
          return SingleChildScrollView(
            child: SafeArea(
              child: Container(
                color: Theme.of(context).backgroundColor,
                child: Column(
                  children: [
                    //広告
                    ad(context),
                    //戻るボタン
                    Container(
                      height: height * 0.1,
                      child: _backButton(context, widget.event),
                    ),
                    //Dスコアの表示
                    Container(
                      height: height * 0.1,
                      child: _totalScore(),
                    ),
                    //スコアの詳細
                    Container(
                      height: height * 0.1,
                      child: _detailsScore(),
                    ),
                    //技名の表示
                    Container(
                      height: height * 0.7,
                      child: RefreshIndicator(
                        onRefresh: () async {
                          await model.getFXScores();
                        },
                        child: _techListView(context),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  //広告
  Widget ad(BuildContext context) {
    return banner == null
        ? Container(height: 50)
        : Container(
            height: 50,
            child: AdWidget(ad: banner!),
          );
  }

  //戻るボタン
  Widget _backButton(BuildContext context, String event) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Platform.isIOS
              ? Row(
                  children: [
                    Icon(
                      Icons.arrow_back_ios,
                      color: Theme.of(context).primaryColor,
                    ),
                    Text(
                      '$eventスコア一覧',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ],
                )
              : Icon(
                  Icons.clear,
                  color: Theme.of(context).primaryColor,
                ),
        ),
        TextButton(
          child: Text(
            '保存',
            style: TextStyle(
                color: Theme.of(context).primaryColor, fontSize: 15.0),
          ),
          onPressed: () {
            //試合などの名前をつける入力フォーム
            onStoreButtonPressed(context);
          },
        ),
      ],
    );
  }

  //Dスコアの表示
  Widget _totalScore() {
    final scoreModel = Provider.of<ScoreModel>(context, listen: false);
    return Container(
      padding: EdgeInsets.only(top: 10.0, bottom: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            padding: EdgeInsets.only(right: 15.0),
            child: FittedBox(
              child: Text(
                '${scoreModel.totalScore}',
                style: TextStyle(fontSize: 40.0),
              ),
            ),
          )
        ],
      ),
    );
  }

  //保存ボタン押された時の処理
  Future<void> onStoreButtonPressed(context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('保存しました'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
                child: Text(
                  '0K',
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
              ),
            ],
          );
        });
  }

  //スコアの詳細
  Widget _detailsScore() {
    final scoreModel = Provider.of<ScoreModel>(context, listen: false);
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Center(
                child: Text(
                  '難度点',
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Text(
                  '要求点',
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
            ),
            widget.event == '床' || widget.event == '鉄棒'
                ? Expanded(
                    child: Center(
                      child: Text(
                        '組み合わせ',
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
        SizedBox(
          height: 10.0,
        ),
        Row(
          children: [
            Expanded(
              child: Center(
                child: Text(
                  '${scoreModel.difficultyPoint}',
                  style: TextStyle(fontSize: 15.0),
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Text(
                  '${scoreModel.egr}',
                  style: TextStyle(fontSize: 15.0),
                ),
              ),
            ),
            widget.event == '床' || widget.event == '鉄棒'
                ? Expanded(
                    child: Center(
                      child: Text(
                        '${scoreModel.cv}',
                        style: TextStyle(fontSize: 15.0),
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
      ],
    );
  }

  Widget _techListView(BuildContext context) {
    final scoreModel = Provider.of<ScoreModel>(context, listen: false);
    return ListView(
      children: scoreModel.decidedTechList
          .map((tech) => _techTile(
              context, tech, scoreModel.decidedTechList.indexOf(tech) + 1))
          .toList(),
    );
  }

//技名の表示
  Widget _techTile(BuildContext context, String techName, int order) {
    final scoreModel = Provider.of<ScoreModel>(context, listen: false);
    return Column(
      children: [
        Card(
          child: ListTile(
            title: Text('$techName', style: TextStyle(fontSize: 14.0)),
            trailing: Container(
              width: 110,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    children: [
                      SizedBox(height: 8),
                      Expanded(
                        child: Text('難度', style: TextStyle(fontSize: 10)),
                      ),
                      Expanded(
                        child: Text(
                            '${scoreOfDifficulty[scoreModel.difficulty[techName]]}'),
                      ),
                    ],
                  ),
                  SizedBox(width: 24),
                  Column(
                    children: [
                      SizedBox(height: 8),
                      Expanded(
                        child: Text('グループ', style: TextStyle(fontSize: 10)),
                      ),
                      Expanded(
                        child:
                            Text('${groupDisplay[scoreModel.group[techName]]}'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            onTap: () {
              //todo:技の変更処理
              searchController.clear();
              scoreModel.searchResult.clear();
              scoreModel.selectEvent(widget.event);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SearchScreen(widget.event)));
            },
          ),
        ),
        scoreModel.decidedTechList.length == 0 ||
                scoreModel.decidedTechList.length == order &&
                    scoreModel.decidedTechList.length < 10
            ? IconButton(
                icon: Icon(Icons.add, color: Theme.of(context).primaryColor),
                onPressed: () {
                  searchController.clear();
                  scoreModel.searchResult.clear();
                  scoreModel.selectEvent(widget.event);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SearchScreen(widget.event)));
                },
              )
            : Container(),
      ],
    );
  }
}
