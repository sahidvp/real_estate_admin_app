import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PropertyProvider with ChangeNotifier {
  int _selectedIndex = -1; // No category selected initially
  int get selectedIndex => _selectedIndex;

  int _totalUsers = 0;
  int _totalProperties = 0;
  int _rentProperties = 0;
  int _saleProperties = 0;

  int get totalUsers => _totalUsers;
  int get totalProperties => _totalProperties;
  int get rentProperties => _rentProperties;
  int get saleProperties => _saleProperties;

  List<Map<String, dynamic>> _users = [];
  List<Map<String, dynamic>> get users => _users;

  List<Map<String, dynamic>> _properties = [];
  List<Map<String, dynamic>> get properties => _properties;
  //search
  List<Map<String, dynamic>> _filteredProperties = [];
  String _searchQuery = '';
  List<Map<String, dynamic>> get allproperties =>
      _searchQuery.isEmpty ? _properties : _filteredProperties;
  ////

  ///search
  void searchProperties(String query) {
    _searchQuery = query.toLowerCase();
    if (_searchQuery.isEmpty) {
      _filteredProperties = []; // Reset filtered properties
    } else {
      _filteredProperties = _properties.where((property) {
        return property['title'].toLowerCase().contains(_searchQuery);
      }).toList();
    }
    notifyListeners(); // Notify listeners to update the UI
  }

  /////
  void updateSelectedIndex(int index) {
    _selectedIndex = index;
    notifyListeners(); // Notify listeners to update the UI
  }

  // Fetch user data from Firestore
  Future<void> fetchUsers() async {
    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .orderBy('timestamp', descending: true)
          .get();

      _users = querySnapshot.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();

      _totalUsers = _users.length;
      notifyListeners();
    } catch (e) {
      print("Error fetching users: $e");
    }
  }

  // Fetch property data from Firestore
  Future<void> fetchProperties() async {
    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection('properties')
          .orderBy('timestamp', descending: true)
          .get();

      _properties = querySnapshot.docs
          .map((doc) => {
                'id': doc.id, // Store document ID
                ...doc.data() as Map<String, dynamic>
              })
          .toList();

      _totalProperties = properties.length;
      _rentProperties = properties
          .where((property) => property['transactionType'] == 'Rent')
          .length;
      _saleProperties = properties
          .where((property) => property['transactionType'] == 'Sale')
          .length;

      notifyListeners();
    } catch (e) {
      print("Error fetching properties: $e");
    }
  }

  // Method to delete a property
  Future<void> deleteProperty(String propertyId) async {
    try {
      // // Delete from Firestore
      // await FirebaseFirestore.instance
      //     .collection('properties')
      //     .doc(propertyId)
      //     .delete();

      var querySnapshot = await FirebaseFirestore.instance
          .collection('properties')
          .where('id', isEqualTo: propertyId)
          .get();

      // Loop through each document found and delete
      for (var doc in querySnapshot.docs) {
        await doc.reference.delete();
      }
      // Remove the property from the local list
      _properties.removeWhere((property) => property['id'] == propertyId);

      // Update the counts
      _totalProperties = properties.length;
      _rentProperties = properties
          .where((property) => property['transactionType'] == 'Rent')
          .length;
      _saleProperties = properties
          .where((property) => property['transactionType'] == 'Sale')
          .length;

      notifyListeners(); // Update UI after deletion
    } catch (e) {
      print("Error deleting property: $e");
    }
  }
}
