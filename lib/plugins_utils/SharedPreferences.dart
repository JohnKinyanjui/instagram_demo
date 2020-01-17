import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
class Preferences {
  static final login_status_key = "login_status_key";
  static final first_launch_key = "first_launch_key";
  static final username_key = "username_key";
  static final user_id = "user_id_key";
  static final password_key = "password_key";
  static final first_name_key = "first_name_key";
  static final last_name_key = "last_name_key";
  static final phone_number_key = "phone_number_key";
  static final avatar_key = "avatar_key";

  static Future<bool> setLoginStatus(bool status) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setBool(login_status_key, status);
  }

  static Future<bool> isLoggedIn() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var status = prefs.getBool(login_status_key);
    if (status != null) {
      return status;
    } else {
      return false;
    }
  }

  static Future<bool> setFirstLaunch(bool status) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setBool(first_launch_key, status);
  }

  static Future<bool> isFirstLaunch() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var status = prefs.getBool(first_launch_key);
    if (status != null) {
      return status;
    } else {
      return false;
    }
  }

  static Future<bool> saveFirstName(String userName) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(first_name_key, userName);
  }

  static Future<String> getFirstName() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(first_name_key);
  }

  static Future<bool> saveLastName(String userName) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(last_name_key, userName);
  }

  static Future<String> getLastName() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(last_name_key);
  }

  static Future<bool> savePhoneNumber(String userName) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(phone_number_key, userName);
  }

  static Future<String> getPhoneNumber() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(phone_number_key);
  }

  static Future<bool> saveAvatar(String userName) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(avatar_key, userName);
  }

  static Future<String> getAvatar() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(avatar_key);
  }

  static Future<bool> savePassword(String password) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(password_key, password );
  }

  static Future<String> getPassword() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(password_key);
  }

  static Future<bool> saveUserId(String userName) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(user_id, userName);
  }

  static Future<String> getUserId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(user_id);
  }

  static Future<bool> saveEmail(String email) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(username_key, email);
  }

  static Future<String> getEmail() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(username_key);
  }

  static Future<bool> clearPreference() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(username_key);
    prefs.remove(password_key);
    prefs.setBool(login_status_key, false);
    prefs.remove(avatar_key);
    return true;
  }
}