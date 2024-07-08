import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:app_online_booking/src/domain/entities/user.dart';
import 'package:app_online_booking/src/data/local/constants_shared_preferences.dart';

class LocalData {
  LocalData._privateConstructor();
  static final LocalData _instance = LocalData._privateConstructor();
  static LocalData get instance => _instance;

  //User  data persistence
  static Future<CustomUser?> getDataUser() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    if (pref.getString(ConstantsSharedPreferences.dataUser) != null) {
      final json =
          jsonDecode(pref.getString(ConstantsSharedPreferences.dataUser) ?? "");
      return CustomUser.fromJson(json);
    } else {
      return null;
    }
  }

  static setDataUser(CustomUser user) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString(ConstantsSharedPreferences.dataUser, jsonEncode(user));
  }

  static removePreferences() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.remove(ConstantsSharedPreferences.dataUser);
  }
}
