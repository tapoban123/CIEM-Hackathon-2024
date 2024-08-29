import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

StateNotifierProvider<LocalDatabaseService, bool> localDatabaseServiceProvider =
    StateNotifierProvider(
  (ref) => LocalDatabaseService(),
);

class LocalDatabaseService extends StateNotifier<bool> {
  LocalDatabaseService() : super(false) {
    getData();
  }

  late SharedPreferences _sharedPreferences;

  Future<void> initDatabase() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  void storeData(bool isAuthenticated) async {
    await initDatabase();

    _sharedPreferences.setBool("isAuthenticated", isAuthenticated);
  }

  Future<bool?> getData() async {
    await initDatabase();

    bool? isAuthenticated = await _sharedPreferences.getBool("isAuthenticated");
    return isAuthenticated;
  }
}
