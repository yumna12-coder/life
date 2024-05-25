import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  static Future<String?>mailRegister(String mail, String pwd) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: mail, password: pwd);
      return null;
    }
    on FirebaseAuthException catch (ex) {
      return "${ex.code}: ${ex.message}";
    }
  }


  // Add your sign-in related variables here
  String _email = "";
  String _password = "";
  bool _isLoading = false; // Flag to indicate sign-in progress

  // Add functions to handle user input and sign-in logic
  void _onEmailChanged(String email) {
    setState(() {
      _email = email;
    });
  }

  void _onPasswordChanged(String password) {
    setState(() {
      _password = password;
    });
  }

  void _onSignInPressed() async {
    // Implement your sign-in logic here (e.g., call an API)
    setState(() {
      _isLoading = true; // Show loading indicator
    });

    // Simulate a sign-in process (replace with actual logic)
    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      _isLoading = false; // Hide loading indicator
    });

    // Handle sign-in success or failure based on your logic
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
              onChanged: _onEmailChanged,
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
              onPressed: _isLoading ? null : _onSignInPressed,
              child: _isLoading ? const CircularProgressIndicator() : const Text('Sign In'),
            ),
          ],
        ),
      ),
    );
  }
}
