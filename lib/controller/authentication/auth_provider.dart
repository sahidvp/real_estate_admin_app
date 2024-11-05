import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthProvider with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> login(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );

      DocumentSnapshot adminDoc = await _firestore
          .collection('admin')
          .doc(userCredential.user!.uid)
          .get();

      if (!adminDoc.exists) {
        // If not an admin, log out
        await _auth.signOut();
        throw Exception('Access denied. You are not an admin.');
      }
    } catch (e) {
      throw Exception(
          'Login failed. Please check your credentials and try again.');
    }
  }

  Future<void> logout() async {
    try {
      await _auth.signOut(); // Sign out the current user
      notifyListeners(); // Notify listeners to update the UI if necessary
    } catch (e) {
      print("log failed");
      throw Exception('Logout failed. Please try again.');
    }
  }
}
