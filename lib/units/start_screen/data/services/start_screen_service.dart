import 'package:expensive_tracker_app/constants/shared_pref_constants.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class StartScreenService {
  Future<bool> isFirstStart();

  Future<void> saveFirstStart();
}

class StartScreenServiceImpl implements StartScreenService {
  @override
  Future<bool> isFirstStart() async {
    final prefs = await SharedPreferences.getInstance();
    try {
      return prefs.getBool(isFirstStartConst);
    } catch (er, st) {
      debugPrint('$er\n$st');
      return false;
    }
  }

  @override
  Future<void> saveFirstStart() { 
    throw UnimplementedError();
  }
}
