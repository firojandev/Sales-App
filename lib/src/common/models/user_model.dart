class UserModel {
  final String empId;
  final String mobile;
  final String password;
  final String deviceInfo;
  final String deviceToken;

  UserModel(this.empId, this.mobile,this.password, this.deviceInfo, this.deviceToken);

  Map<String, String> toMap() {
    return {
      'empid': empId,
      'mobile': mobile,
      'pass': password,
      'deviceInfo': deviceInfo,
      'deviceToken': deviceToken,
    };
  }
}
