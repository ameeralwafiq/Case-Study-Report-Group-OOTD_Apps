import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:logger/logger.dart';
import '../navigation/bottom_navigation_bar.dart'; // Import the BottomNavigationBarExample widget

final FirebaseAuth auth = FirebaseAuth.instance; // Initialize FirebaseAuth instance
final Logger logger = Logger();

Future<User?> signIn(String email, String password) async {
  try {
    UserCredential userCredential = await auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return userCredential.user;
  } catch (e) {
    logger.e("Error: $e");
    return null;
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
 appBar: AppBar(
        toolbarHeight: 120.0,
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.purple.shade100.withOpacity(0.1),
                    Colors.purple.shade200.withOpacity(0.1),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
            Positioned(
              top: 50,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.3,
                height: 1,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.purple.shade300.withOpacity(0),
                      Colors.purple.shade300,
                      Colors.purple.shade300.withOpacity(0),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 60,
              child: Stack(
                children: [
                  Text(
                    'OOTD',
                    style: TextStyle(
                      fontSize: 80.0,
                      fontFamily: 'Italiana',
                      letterSpacing: 8.0,
                      color: Colors.purple.shade100.withOpacity(0.3),
                      height: 1,
                    ),
                  ),
                  ShaderMask(
                    shaderCallback: (bounds) => LinearGradient(
                      colors: [
                        Colors.purple.shade400,
                        Colors.purple.shade700,
                        Colors.purple.shade400,
                      ],
                      stops: [0.0, 0.5, 1.0],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ).createShader(bounds),
                    child: Text(
                      'OOTD',
                      style: TextStyle(
                        fontSize: 85.0,
                        fontFamily: 'Italiana',
                        letterSpacing: 8.0,
                        color: Colors.white,
                        height: 1,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 15,
              child: Text(
                'Outfit Manager',
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'Cormorant',
                  letterSpacing: 4,
                  color: Colors.purple.shade300,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),

      
      
      
      
      
      
      
      
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [

              // App logo or decorative image
              Image.asset(
                'assets/hanger.png',
                height: 80.0,
                width: 80.0,
              ),
              SizedBox(height: 16),




              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: _obscurePassword,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    User? user = await signIn(
                      _emailController.text,
                      _passwordController.text,
                    );
                    if (user != null && mounted) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BottomNavigationBarExample(
                            userName: user.displayName ?? 'User',
                            userEmail: user.email ?? 'user@example.com',
                            outfitCount: 0, // Initialize outfitCount
                          ),
                        ),
                      );
                    }
                  }
                },
                child: Text('Login'),
              ),

              // Sign Up redirection
                    TextButton(
                      onPressed: () => Navigator.pushNamed(context, '/signup'),
                      child: Text('Not a member? Sign up'),
                    ),



            ],
          ),
        ),
      ),
    );
  }
}