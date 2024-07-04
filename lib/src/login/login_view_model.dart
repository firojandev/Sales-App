import 'package:flutter/material.dart';
import 'package:sales_kenya/src/common/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginViewModel extends ChangeNotifier {
  Future<bool> login(String empId, String password, bool isRememberMe) async {
    final prefs = await SharedPreferences.getInstance();

    if (prefs == null) {
      return false;
    }

    String? savedEmpId = prefs.getString('empId');
    String? savedMobile = prefs.getString('mobile');
    String? savedPassword = prefs.getString('password');
    String? savedRegNo = prefs.getString('regNo');

    if (savedEmpId != null && savedPassword != null) {
      if (empId == savedEmpId && password == savedPassword) {
        AppConstants.empId = savedEmpId;
        AppConstants.mobile = savedMobile!;
        AppConstants.regNo = savedRegNo!;

        await prefs.setBool('isRememberMe', isRememberMe);

        return true;
      }
    }
    return false;
  }

  Future<bool?> getRememberMe() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs == null) {
      return false;
    }
    return prefs.getBool('isRememberMe');
  }

  Future<Map<String, String>?> getSavedCredentials() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs == null) {
      return null;
    }
    String? savedEmpId = prefs.getString('empId');
    String? savedPassword = prefs.getString('password');
    if (savedEmpId != null && savedPassword != null) {
      return {
        'empId': savedEmpId,
        'password': savedPassword,
      };
    }
    return null;
  }
}
