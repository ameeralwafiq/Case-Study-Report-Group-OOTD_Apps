import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../navigation/bottom_navigation_bar.dart';
import 'homepage.dart'; // Import the Homepage widget

FirebaseAuth auth = FirebaseAuth.instance;

Future<User?> signUp(String name, String email, String password) async {
  try {
    UserCredential userCredential = await auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    User? user = userCredential.user;

    if (user != null) {
      await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
        'name': name,
        'email': email,
      });
    }

    return user;
  } catch (e) {
    print("Error: $e");
    return null;
  }
}

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
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
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
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
                obscureText: true,
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
                    User? user = await signUp(
                      _nameController.text,
                      _emailController.text,
                      _passwordController.text,
                    );
                    if (user != null) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Homepage(
                            userId: user.uid, // Pass the userId parameter
                            userName: _nameController.text,
                            outfitCount: 0, // Initialize outfitCount
                          ),
                        ),
                      );
                    }
                  }
                },
                child: Text('Sign Up'),
              ),

              // Login redirection
                    TextButton(
                      onPressed: () => Navigator.pushNamed(context, '/login'),
                      child: Text('Already have an account? Login'),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}