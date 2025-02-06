import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CapturePage extends StatefulWidget {


  @override
  _CapturePageState createState() => _CapturePageState();
}

class _CapturePageState extends State<CapturePage> {
  final ImagePicker _picker = ImagePicker();
  File? _image;
  String _selectedCategory = 'tops';
  bool _isUploading = false;
  
  // Predefined categories
  final List<String> categories = [
    'tops',
    'bottoms',
    'shoes',
  ];

  List<String> _selectedColors = [];

  Future<void> _pickImage(ImageSource source) async {
    try {
      final XFile? pickedFile = await _picker.pickImage(
        source: source,
        maxWidth: 1080,
        maxHeight: 1080,
        imageQuality: 85,
      );
      if (pickedFile != null) {
        setState(() {
          _image = File(pickedFile.path);
        });
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error picking image: $e')),
      );
    }
  }

  Future<void> _uploadItem() async {
  if (_image == null) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Please select an image first')),
    );
    return;
  }

  setState(() {
    _isUploading = true;
  });

  try {
    // Get current user
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) throw Exception('User not logged in');

    // Create a unique filename
    String fileName = 'item_${DateTime.now().millisecondsSinceEpoch}.jpg';
    
    // Create the full path
    String filePath = 'users/${user.uid}/${_selectedCategory}/$fileName';

    // Create storage reference
    final storageRef = FirebaseStorage.instance.ref().child(filePath);
    
    // Upload the file with metadata
    final metadata = SettableMetadata(
      contentType: 'image/jpeg',
      customMetadata: {
        'category': _selectedCategory,
        'uploadedBy': user.uid,
      },
    );
    
    // Perform the upload
    await storageRef.putFile(_image!, metadata);
    
    // Get the download URL
    final imageUrl = await storageRef.getDownloadURL();

    // Save to Firestore
    await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .collection('wardrobe')
        .add({
      'category': _selectedCategory,
      'imageUrl': imageUrl,
      'dateAdded': FieldValue.serverTimestamp(),
    });

    // Clear form and show success
    setState(() {
      _image = null;
      _isUploading = false;
    });

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Item successfully added to wardrobe!')),
      );
    }
  } catch (e) {
    print('Error details: $e'); // Add this for debugging
    setState(() {
      _isUploading = false;
    });
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error uploading item: $e')),
      );
    }
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add to Wardrobe'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Image Preview
            Container(
              height: 300,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: _image == null
                  ? Center(child: Text('No image selected'))
                  : Image.file(_image!, fit: BoxFit.cover),
            ),
            const SizedBox(height: 16),

            // Image Source Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () => _pickImage(ImageSource.camera),
                  icon: const Icon(Icons.camera_alt),
                  label: const Text('Camera'),
                ),
                ElevatedButton.icon(
                  onPressed: () => _pickImage(ImageSource.gallery),
                  icon: const Icon(Icons.photo_library),
                  label: const Text('Gallery'),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Category Dropdown
            DropdownButtonFormField<String>(
              value: _selectedCategory,
              decoration: const InputDecoration(
                labelText: 'Category',
                border: OutlineInputBorder(),
              ),
              items: categories.map((String category) {
                return DropdownMenuItem(
                  value: category,
                  child: Text(category.toUpperCase()),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedCategory = newValue!;
                });
              },
            ),
            const SizedBox(height: 16),

            // Upload Button
            ElevatedButton(
              onPressed: _isUploading ? null : _uploadItem,
              child: _isUploading
                  ? const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(color: Colors.white),
                        SizedBox(width: 16),
                        Text('Uploading...'),
                      ],
                    )
                  : const Text('Add to Wardrobe'),
            ),
          ],
        ),
      ),
    );
  }

  
}