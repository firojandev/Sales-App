
import 'package:http/http.dart' as http;
import 'package:sales_kenya/src/common/app_constants.dart';
import 'package:sales_kenya/src/common/models/user_model.dart';

class ApiServices {
  Future<String> register(UserModel userModel) async {
    final response = await http.post(
      Uri.parse('${AppConstants.QA_BASE_API_URL}/registrationSFBL'),
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: userModel.toMap(),
    );

    if (response.statusCode == 200) {
      return response.body;
    } else {
      return "Error";
    }
  }


}