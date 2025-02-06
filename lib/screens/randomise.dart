import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:math';

void main() {
  runApp(const OOTDApp());
}

class OOTDApp extends StatelessWidget {
  const OOTDApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'OOTD - Outfit of the Day',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const OOTDHomePage(),
    );
  }
}

class OOTDHomePage extends StatefulWidget {
  const OOTDHomePage({super.key});

  @override
  _OOTDHomePageState createState() => _OOTDHomePageState();
}

class _OOTDHomePageState extends State<OOTDHomePage> {
  // Lists to store image paths for each category
  List<String> tops = [
    'assets/tops/top1.jpg',
    'assets/tops/top2.jpg',
    'assets/tops/top3.jpg',
  ];

  List<String> bottoms = [
    'assets/bottoms/bottom1.jpg',
    'assets/bottoms/bottom2.jpg',
    'assets/bottoms/bottom3.jpg',
  ];

  List<String> shoes = [
    'assets/shoes/shoe1.jpg',
    'assets/shoes/shoe2.jpg',
    'assets/shoes/shoe3.jpg',
  ];

  // Variables to store the current outfit
  String currentTop = '';
  String currentBottom = '';
  String currentShoe = '';

  // List to store saved outfits
  List<Map<String, String>> savedOutfits = [];

  // Random number generator
  final Random _random = Random();

  @override
  void initState() {
    super.initState();
    generateOutfit();
  }

  // Function to generate a random outfit
  void generateOutfit() {
    setState(() {
      currentTop = tops[_random.nextInt(tops.length)];
      currentBottom = bottoms[_random.nextInt(bottoms.length)];
      currentShoe = shoes[_random.nextInt(shoes.length)];
    });
  }

  // Function to save the current outfit
  void saveOutfit() {
    setState(() {
      savedOutfits.add({
        'top': currentTop,
        'bottom': currentBottom,
        'shoe': currentShoe,
      });
    });

    // Show a SnackBar to indicate the outfit has been saved
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Outfit saved successfully!'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (currentTop.isNotEmpty)
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 2,
                  ),
                ),
                child: Image.asset(
                  currentTop,
                  height: 100,
                  width: 150,
                  fit: BoxFit.cover,
                ),
              ),
            const Text('Top', style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal)),
            const SizedBox(height: 10),

            if (currentBottom.isNotEmpty)
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 2,
                  ),
                ),
                child: Image.asset(
                  currentBottom,
                  height: 100,
                  width: 150,
                  fit: BoxFit.cover,
                ),
              ),
            const Text('Bottom', style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal)),
            const SizedBox(height: 10),

            if (currentShoe.isNotEmpty)
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 2,
                  ),
                ),
                child: Image.asset(
                  currentShoe,
                  height: 100,
                  width: 150,
                  fit: BoxFit.cover,
                ),
              ),
            const Text('Shoes', style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal)),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: generateOutfit,
              child: const Text('Generate New Outfit'),
            ),
            ElevatedButton(
              onPressed: saveOutfit,
              child: const Text('Save Outfit'),
            ),
          ],
        ),
      ),
    );
  }
}

class Randomise extends StatefulWidget {
  const Randomise({super.key});

  @override
  _RandomiseState createState() => _RandomiseState();
}

class _RandomiseState extends State<Randomise> {
  // Lists to store image paths for each category
  List<String> tops = [
    'assets/tops/top1.jpg',
    'assets/tops/top2.jpg',
    'assets/tops/top3.jpg',
  ];

  List<String> bottoms = [
    'assets/bottoms/bottom1.jpg',
    'assets/bottoms/bottom2.jpg',
    'assets/bottoms/bottom3.jpg',
  ];

  List<String> shoes = [
    'assets/shoes/shoe1.jpg',
    'assets/shoes/shoe2.jpg',
    'assets/shoes/shoe3.jpg',
  ];

  // Variables to store the current outfit
  String currentTop = '';
  String currentBottom = '';
  String currentShoe = '';

  // List to store saved outfits
  List<Map<String, String>> savedOutfits = [];

  // Random number generator
  final Random _random = Random();

  @override
  void initState() {
    super.initState();
    generateOutfit();
  }

  // Function to generate a random outfit
  void generateOutfit() {
    setState(() {
      currentTop = tops[_random.nextInt(tops.length)];
      currentBottom = bottoms[_random.nextInt(bottoms.length)];
      currentShoe = shoes[_random.nextInt(shoes.length)];
    });
  }

  // Function to save the current outfit
  void saveOutfit() {
    setState(() {
      savedOutfits.add({
        'top': currentTop,
        'bottom': currentBottom,
        'shoe': currentShoe,
      });
    });

    // Show a SnackBar to indicate the outfit has been saved
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Outfit saved successfully!'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Randomise Uploaded Outfit'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (currentTop.isNotEmpty)
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 2,
                  ),
                ),
                child: Image.asset(
                  currentTop,
                  height: 100,
                  width: 150,
                  fit: BoxFit.cover,
                ),
              ),
            const Text('Top', style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal)),
            const SizedBox(height: 10),

            if (currentBottom.isNotEmpty)
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 2,
                  ),
                ),
                child: Image.asset(
                  currentBottom,
                  height: 100,
                  width: 150,
                  fit: BoxFit.cover,
                ),
              ),
            const Text('Bottom', style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal)),
            const SizedBox(height: 10),

            if (currentShoe.isNotEmpty)
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 2,
                  ),
                ),
                child: Image.asset(
                  currentShoe,
                  height: 100,
                  width: 150,
                  fit: BoxFit.cover,
                ),
              ),
            const Text('Shoes', style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal)),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: generateOutfit,
              child: const Text('Generate New Outfit'),
            ),
            ElevatedButton(
              onPressed: saveOutfit,
              child: const Text('Save Outfit'),
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> saveOutfit(String top, String bottom, String shoes) async {
  await FirebaseFirestore.instance.collection('outfits').add({
    'top': top,
    'bottom': bottom,
    'shoes': shoes,
  });
}

Future<Map<String, String>> getRandomOutfit() async {
  QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('outfits').get();
  if (snapshot.docs.isNotEmpty) {
    Random random = Random();
    DocumentSnapshot randomDoc = snapshot.docs[random.nextInt(snapshot.docs.length)];
    return {
      'top': randomDoc['top'],
      'bottom': randomDoc['bottom'],
      'shoes': randomDoc['shoes'],
    };
  } else {
    return {
      'top': 'No top available',
      'bottom': 'No bottom available',
      'shoes': 'No shoes available',
    };
  }
}

class RandomisePage extends StatefulWidget {
  @override
  _RandomisePageState createState() => _RandomisePageState();
}

class _RandomisePageState extends State<RandomisePage> {
  String _selectedTop = 'Top A';
  String _selectedBottom = 'Bottom B';
  String _selectedShoes = 'Shoes C';
  Map<String, String>? _randomOutfit;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Clothing Matching Assistance'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Select your outfit:'),
            DropdownButton<String>(
              value: _selectedTop,
              items: <String>['Top A', 'Top B', 'Top C'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  _selectedTop = newValue!;
                });
              },
            ),
            DropdownButton<String>(
              value: _selectedBottom,
              items: <String>['Bottom A', 'Bottom B', 'Bottom C'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  _selectedBottom = newValue!;
                });
              },
            ),
            DropdownButton<String>(
              value: _selectedShoes,
              items: <String>['Shoes A', 'Shoes B', 'Shoes C'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  _selectedShoes = newValue!;
                });
              },
            ),
            ElevatedButton(
              onPressed: () async {
                await saveOutfit(_selectedTop, _selectedBottom, _selectedShoes);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Outfit saved!')),
                );
              },
              child: Text('Save Outfit'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                Map<String, String> randomOutfit = await getRandomOutfit();
                setState(() {
                  _randomOutfit = randomOutfit;
                });
              },
              child: Text('Get Random Outfit'),
            ),
            SizedBox(height: 20),
            _randomOutfit != null
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Random Outfit:'),
                      Text('Top: ${_randomOutfit!['top']}'),
                      Text('Bottom: ${_randomOutfit!['bottom']}'),
                      Text('Shoes: ${_randomOutfit!['shoes']}'),
                    ],
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}