import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sales_kenya/src/common/app_constants.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dashboard')),
      body: Center(
        child: Text(AppConstants.empId),
      ),
    );
  }
}
