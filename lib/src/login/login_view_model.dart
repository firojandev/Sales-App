import 'package:flutter/material.dart';
import 'package:sales_kenya/src/common/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginViewModel extends ChangeNotifier {
  Future<bool> login(String empId, String password) async {
    final prefs = await SharedPreferences.getInstance();

    if(prefs == null){
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
        return true;
      }
    }
    return false;
  }
}
