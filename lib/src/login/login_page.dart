import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sales_kenya/src/common/app_constants.dart';
import 'package:sales_kenya/src/dashboard/dashboard_page.dart';
import 'package:sales_kenya/src/login/login_view_model.dart';
import 'package:sales_kenya/src/register/register_page.dart';
import 'package:sales_kenya/src/utils/my_colors.dart';
import 'package:sales_kenya/src/utils/my_text_style.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _empIdController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool? _rememberMe = false;
  bool _isCardVisible = false;

  @override
  void initState()  {
    super.initState();
    _initializeRememberMe();
    // Start the animation after the initial build
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _isCardVisible = true;
      });
    });
  }

  Future<void> _initializeRememberMe() async {
    _rememberMe = await Provider.of<LoginViewModel>(context, listen: false).getRememberMe();
    if (_rememberMe != null && _rememberMe!) {
      Map<String, String>? savedCredentials = await Provider.of<LoginViewModel>(context, listen: false).getSavedCredentials();
      if (savedCredentials != null) {
        _empIdController.text = savedCredentials['empId']!;
        _passwordController.text = savedCredentials['password']!;
        setState(() {
          _rememberMe = true;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: MyColors.backgroundLight, // Your background color
        ),
        child: Center(
          child: AnimatedContainer(
            duration: const Duration(seconds: 1),
            curve: Curves.easeInOut,
            alignment: _isCardVisible ? Alignment.center : Alignment.bottomCenter,
            child: AnimatedOpacity(
              duration: const Duration(seconds: 1),
              opacity: _isCardVisible ? 1.0 : 0.0,
              child: Card(
                color: MyColors.whiteColor,
                elevation: 8.0,
                margin: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(AppConstants.appName,style:MyTextStyle.titleStyle),
                      const SizedBox(height: 10.0),
                      Text(AppConstants.loginToYourAccount,style: MyTextStyle.textStyle,),
                      const SizedBox(height: 30.0),
                      TextField(
                        controller: _empIdController,
                        decoration: InputDecoration(
                          labelText: 'Employee ID',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                              color: Colors.green,
                              width: 2.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                              color: Colors.green,
                              width: 2.0,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      TextField(
                        controller: _passwordController,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                              color: Colors.green,
                              width: 2.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                              color: Colors.green,
                              width: 2.0,
                            ),
                          ),
                        ),
                        obscureText: true,
                      ),
                      const SizedBox(height: 6.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Checkbox(
                            value: _rememberMe,
                            onChanged: (bool? value) {
                              setState(() {
                                _rememberMe = value!;
                              });
                            },
                          ),
                          const Text('Remember Me'),
                        ],
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () async {
                          bool success = await Provider.of<LoginViewModel>(context,
                                  listen: false)
                              .login(
                            _empIdController.text,
                            _passwordController.text,
                              _rememberMe!,
                          );
                          if (success) {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const DashboardPage()),
                              (route) => false,
                            );
                          } else {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text('Login Failed'),
                                content:
                                    const Text('Invalid Employee ID or Password'),
                                actions: [
                                  TextButton(
                                    child: const Text('OK'),
                                    onPressed: () => Navigator.pop(context),
                                  ),
                                ],
                              ),
                            );
                          }
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.green),
                          minimumSize: MaterialStateProperty.all<Size>(
                              const Size(double.infinity, 48)),
                        ),
                        child: const Text(
                          'Login',
                          style: TextStyle(color: MyColors.whiteColor),
                        ),
                      ),
                      const SizedBox(height: 30),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const RegisterPage()),
                          );
                        },
                        child: const Text(
                          'Don\'t have an account? Register here',
                          style: MyTextStyle.textLinkStyle,
                        ),
                      ),
                      const SizedBox(height: 10.0),

                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
