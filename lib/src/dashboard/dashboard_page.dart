import 'package:flutter/material.dart';
import 'package:sales_kenya/src/common/app_constants.dart';

import '../common/widgets/CustomAppBar.dart';
import '../utils/my_colors.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(title: "Dashboard"),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            color: MyColors.backgroundLight
        ),
        child: Center(
          child: Text(AppConstants.empId),
        ),
      ),
    );
  }
}
