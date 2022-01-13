import 'package:dscore_app/data/vt.dart';
import 'package:dscore_app/repository/score_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final vtScoreModelProvider = ChangeNotifierProvider((ref) => VtScoreModel());

class VtScoreModel extends ChangeNotifier {
  final scoreRepository = ScoreRepository();

  String techName = '';
  num difficulty = 0.0;

  Future<void> getVTScore() async {
    final vtScore = await scoreRepository.getVTScore();
    if (vtScore != null) {
      techName = vtScore.techName;
      difficulty = vtTech[techName]!;
    }
  }

  void onVTTechSelected(int index) {
    final vtTechList = vtTech.keys.map((tech) => tech.toString()).toList();
    techName = vtTechList[index];
    difficulty = vtTech[techName]!;
    notifyListeners();
  }

  Future<void> setVTScore() async {
    await scoreRepository.setVTScore(techName, difficulty);
  }
}
