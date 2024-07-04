import 'package:flutter/material.dart';
import 'package:sales_kenya/src/common/app_constants.dart';
import 'package:sales_kenya/src/utils/my_text_style.dart';

import '../common/widgets/CustomAppBar.dart';
import '../utils/my_colors.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(title: "Dashboard"),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: MyColors.primaryColor,
              ),
              child: Column(
                crossAxisAlignment:CrossAxisAlignment.start,
                children: [
                  const Text(
                    '${AppConstants.appName}',
                    style: MyTextStyle.titleStyleWhite,
                  ),
                  Text(
                    'Employee ID: ${AppConstants.empId}',
                    style: MyTextStyle.textButtonStyle,
                  ),
                  Text(
                    'Mobile No: ${AppConstants.mobile}',
                    style: MyTextStyle.textButtonStyle,
                  ),
                  Text(
                    'Reg No: ${AppConstants.regNo}',
                    style: MyTextStyle.textButtonStyle,
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Dashboard'),
              onTap: () {
                // Handle the navigation
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Profile'),
              onTap: () {
                // Handle the navigation
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                // Handle the navigation
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () {
                // Handle the navigation
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            color: MyColors.backgroundLight
        ),
        child: Center(
          child: Text("Welcome ${AppConstants.empId}"),
        ),
      ),
    );
  }
}
