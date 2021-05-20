import 'package:dscore_app/repository/user_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../domain/current_user.dart';

class IntroModel extends ChangeNotifier {
  IntroModel({required this.userRepository});
  final UserRepository userRepository;
  bool isIntroWatched = false;
  bool isLoading = false;

  CurrentUser? get currentUser => UserRepository.currentUser;

  Future<void> finishIntro() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('intro', true);
    isIntroWatched = prefs.getBool('intro') ?? false;
  }

  Future<void> checkIsIntroWatched() async {
    isLoading = true;
    notifyListeners();

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    isIntroWatched = prefs.getBool('intro') ?? false;

    if (isIntroWatched) await getUserData();

    isLoading = false;
    notifyListeners();
  }

  Future<void> signIn() async {
    isLoading = true;
    notifyListeners();

    await userRepository.signIn();
    await finishIntro();

    isLoading = false;
    notifyListeners();
  }

  Future<void> getUserData() async {
    isLoading = true;
    notifyListeners();
    try {
      await userRepository.getUserData();
      return;
    } catch (e) {
      print(e);
    }

    isLoading = false;
    notifyListeners();
  }
}
