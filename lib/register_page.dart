import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _emailTextController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  final _usernameKey = GlobalKey<FormState>();
  final _emailKey = GlobalKey<FormState>();
  final _passwordKey = GlobalKey<FormState>();
  final _passwordConfirmKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[325],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Logo
                const Icon(
                  Icons.equalizer,
                  size: 100,
                ),

                // Make an account
                Text(
                  "Create an account",
                  style: GoogleFonts.roboto(fontSize: 36),
                ),

                const SizedBox(height: 60),

                // Username
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 60.0),
                  child: Form(
                    key: _usernameKey,
                    child: TextFormField(
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            value.length < 8) {
                          return 'Your username must be atleast 8 characters';
                        }
                      },
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        hintText: 'Username',
                        filled: true,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                // Email
                Form(
                  key: _emailKey,
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 60.0),
                    child: TextFormField(
                      validator: ((value) {
                        bool emailValid = RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value!.trim());
                        if (value.isEmpty ||
                            !value.contains("@") ||
                            !emailValid) {
                          return "Please enter a valid email address";
                        }
                      }),
                      controller: _emailTextController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.mail),
                        hintText: 'Email',
                        filled: true,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                // Password
                Form(
                  key: _passwordKey,
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 60.0),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter a password over 8 characters";
                        }
                        if (value.contains(" ")) {
                          return "No spaces allowed in password";
                        }
                      },
                      controller: _passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.key),
                        hintText: 'Password',
                        filled: true,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                // Confirm password
                Form(
                  key: _passwordConfirmKey,
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 60.0),
                    child: TextFormField(
                      validator: (value) {
                        if (_confirmPasswordController.text.trim() !=
                            _passwordController.text.trim()) {
                          return "These passwords do not match";
                        }
                      },
                      controller: _confirmPasswordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.key),
                        hintText: 'Confirm password',
                        filled: true,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // Create Account button
                SizedBox(
                  width: 240,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_usernameKey.currentState!.validate() &&
                          _emailKey.currentState!.validate() &&
                          _passwordKey.currentState!.validate() &&
                          _passwordConfirmKey.currentState!.validate()) {
                        // Create the account in the database
                        FirebaseAuth.instance.createUserWithEmailAndPassword(
                          email: _emailTextController.text.trim(),
                          password: _passwordController.text.trim(),
                        );

                        // Then move them back to the login screen
                        Navigator.of(context).pop();
                      }
                    },
                    child: const Text(
                      "Create Account",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already a user? "),
                    GestureDetector(
                      onTap: () {},
                      child: const Text(
                        "Login",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
