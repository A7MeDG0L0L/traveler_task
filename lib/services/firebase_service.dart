import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseService {
  // Firebase instances
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  // Auth getters
  FirebaseAuth get auth => _auth;
  FirebaseFirestore get firestore => _firestore;
  FirebaseStorage get storage => _storage;

  // Singleton pattern
  static final FirebaseService _instance = FirebaseService._internal();

  factory FirebaseService() {
    return _instance;
  }

  FirebaseService._internal();

  // Example method to get data from Firestore
  Future<Map<String, dynamic>?> getAppData() async {
    try {
      DocumentSnapshot snapshot =
          await _firestore.collection('app_data').doc('config').get();
      return snapshot.data() as Map<String, dynamic>?;
    } catch (e) {
      print('Error getting app data: $e');
      return null;
    }
  }

  // Example method to save user feedback
  Future<bool> saveUserFeedback(Map<String, dynamic> feedbackData) async {
    try {
      await _firestore.collection('feedback').add({
        ...feedbackData,
        'timestamp': FieldValue.serverTimestamp(),
      });
      return true;
    } catch (e) {
      print('Error saving feedback: $e');
      return false;
    }
  }

  // Example method to get image URL from storage
  Future<String?> getImageUrl(String imagePath) async {
    try {
      return await _storage.ref(imagePath).getDownloadURL();
    } catch (e) {
      print('Error getting image URL: $e');
      return null;
    }
  }
}
