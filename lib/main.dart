import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sales_kenya/src/dashboard/dashboard_page.dart';
import 'package:sales_kenya/src/dashboard/dashboard_view_model.dart';
import 'package:sales_kenya/src/login/login_page.dart';
import 'package:sales_kenya/src/login/login_view_model.dart';
import 'package:sales_kenya/src/register/register_page.dart';
import 'package:sales_kenya/src/register/register_view_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginViewModel()),
        ChangeNotifierProvider(create: (_) => RegistrationViewModel()),
        ChangeNotifierProvider(create: (_) => DashboardViewModel()),
      ],
      child: MaterialApp(
        title: 'Flutter MVVM Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: LoginPage(),
        routes: {
          '/register': (context) => RegisterPage(),
          '/dashboard': (context) => DashboardPage(),
        },
      ),
    );
  }
}
