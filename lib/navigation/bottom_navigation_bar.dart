import 'package:flutter/material.dart';
import '../screens/homepage.dart';
import '../screens/randomise.dart';
import '../screens/capture.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BottomNavigationBarExample extends StatefulWidget {
  final String userName;
  final String userEmail;
  final int outfitCount;

  const BottomNavigationBarExample({
    Key? key,
    required this.userName,
    required this.userEmail,
    required this.outfitCount,
  }) : super(key: key);

  @override
  State<BottomNavigationBarExample> createState() =>
      _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState extends State<BottomNavigationBarExample> {
  int _selectedIndex = 0;
  late List<Widget> _pages;
  late String userName;
  late String userEmail;
  late int outfitCount;
  late String userId;

  @override
  void initState() {
    super.initState();
    // Initialize with widget values first
    userName = widget.userName;
    userEmail = widget.userEmail;
    outfitCount = widget.outfitCount;
    
    // Initialize pages immediately with current values
    _initializePages();
    
    // Then load user data from Firebase
    _loadUserData();
  }

  void _initializePages() {
    User? user = FirebaseAuth.instance.currentUser;
    userId = user?.uid ?? '';
    
    _pages = <Widget>[
      Homepage(
        userId: userId,
        userName: userName,
        outfitCount: outfitCount,
      ),
      CapturePage(),
      const Randomise(),
    ];
  }

  Future<void> _loadUserData() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        userId = user.uid;
        DocumentSnapshot userDoc = await FirebaseFirestore.instance
            .collection('users')
            .doc(userId)
            .get();

        if (userDoc.exists && mounted) {
          setState(() {
            userName = userDoc.get('name') ?? widget.userName;
            userEmail = user.email ?? widget.userEmail;
            outfitCount = userDoc.get('outfitCount') ?? widget.outfitCount;
            
            // Update pages with new data
            _initializePages();
          });
        }
      }
    } catch (e) {
      print('Error loading user data: $e');
      // Continue with widget default values if there's an error
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
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


      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera),
            label: 'Capture',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shuffle),
            label: 'Randomise',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.deepPurple,
        backgroundColor: Colors.grey[100],
        onTap: _onItemTapped,
      ),
    );
  }
}