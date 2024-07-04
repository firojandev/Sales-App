import 'package:flutter/cupertino.dart';
import 'package:sales_kenya/src/common/models/user_model.dart';
import 'package:sales_kenya/src/common/networking/api_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegistrationViewModel extends ChangeNotifier {
  final ApiServices _apiService = ApiServices();

  Future<String> register(String empId, String mobile, String password,
      String deviceInfo, String deviceToken) async {
    UserModel userModel =
        UserModel(empId, mobile, password, deviceInfo, deviceToken);

    String regNo =  await _apiService.register(userModel);

    if (regNo.isNotEmpty && regNo != "0") {
      await _saveRegistrationDetails(empId, mobile, password, regNo);
    }
    return regNo;
  }

  Future<void> _saveRegistrationDetails(
      String empId, String mobile, String password, String regNo) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('empId', empId);
    await prefs.setString('mobile', mobile);
    await prefs.setString('password', password);
    await prefs.setString('regNo', regNo);
  }
}
