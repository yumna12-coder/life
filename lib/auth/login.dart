import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // Add your login related variables here
  String _username = "";
  String _password = "";
  bool _isLoading = false; // Flag to indicate login progress

  // Add functions to handle user input and login logic
  void _onUsernameChanged(String username) {
    setState(() {
      _username = username;
    });
  }

  void _onPasswordChanged(String password) {
    setState(() {
      _password = password;
    });
  }

  void _onLoginPressed() async {
    // Implement your login logic here (e.g., call an API)
    setState(() {
      _isLoading = true; // Show loading indicator
    });

    // Simulate a login process (replace with actual logic)
    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      _isLoading = false; // Hide loading indicator
    });

    // Handle login success or failure based on your logic
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                labelText: 'Username',
              ),
              onChanged: _onUsernameChanged,
            ),
            const SizedBox(height: 16.0),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true, // Hide password text
              onChanged: _onPasswordChanged,
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _isLoading ? null : _onLoginPressed,
              child: _isLoading ? const CircularProgressIndicator() : const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
