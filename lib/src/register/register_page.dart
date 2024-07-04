import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sales_kenya/src/register/register_view_model.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final TextEditingController _empIdController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Register')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _empIdController,
              decoration: InputDecoration(labelText: 'Employee ID'),
            ),
            TextField(
              controller: _mobileController,
              decoration: InputDecoration(labelText: 'Mobile'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                String regId = await Provider.of<RegistrationViewModel>(context, listen: false).register(
                  _empIdController.text,
                  _mobileController.text,
                  _passwordController.text,
                  "device_info",
                  "device_token",
                );
                print(regId);
                if (regId.isNotEmpty && regId != "0") {
                  print("Registration successful");
                  Navigator.pop(context);
                } else {
                  // Show error message
                  print("Registration failed");
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Registration Failed'),
                      content: const Text('Failed to register. Please try again.'),
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
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
