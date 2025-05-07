import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shop_app/utills/formatters/formatter.dart';

class UserModel {
  final String id;
   String firstName;
   String lastName;
  final String username;
  final String email;
  final String phoneNumber;
   String profilePicture;

  UserModel(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.username,
      required this.email,
      required this.phoneNumber,
      required this.profilePicture});

  /// Helper Function to get full name

  String get fullName => "$firstName $lastName";

  /// Helper Function to format Phone Number
  String get formattedPhoneNo => TFormatter.formatPhoneNumber(phoneNumber);

  /// Helper Function to split full name into first and last name
  static List<String> nameParse(fullName) => fullName.split("");

  // static String generateUserName (fullName) {
  //   List<String> nameParse =fullName.split(" ");
  //   String firstName = nameParse[0].toLowerCase();
  //   String lastName =  nameParse.length >1 ? nameParse[1].toLowerCase() : "";
  //
  // }
  static String generateUsername(String? firstName, String? lastName) {
    final random = Random();
    final first = (firstName?.trim() ?? '').toLowerCase();
    final last = (lastName?.trim() ?? '').toLowerCase();

    // Create base username
    String baseUsername;
    if (first.isNotEmpty && last.isNotEmpty) {
      baseUsername = '$first.${last.substring(0, min(3, last.length))}';
    } else if (first.isNotEmpty) {
      baseUsername = first;
    } else if (last.isNotEmpty) {
      baseUsername = last;
    } else {
      baseUsername = 'user';
    }

    // Remove any non-alphanumeric characters
    baseUsername = baseUsername.replaceAll(RegExp(r'[^a-z0-9]'), '');

    // Add random numbers if needed
    if (baseUsername.length < 4) {
      baseUsername += random.nextInt(9999).toString().padLeft(4, '0');
    } else {
      baseUsername += random.nextInt(999).toString().padLeft(3, '0');
    }

    return baseUsername;
  }

  /// Static function to create Empty User model
  static UserModel empty() => UserModel(
      id: '',
      firstName: '',
      lastName: '',
      username: '',
      email: '',
      phoneNumber: '',
      profilePicture: '');

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'username': username,
      'email': email,
      'phoneNumber': phoneNumber,
      'profilePicture': profilePicture,
    };
  }

  factory UserModel.fromSnapshot(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>? ?? {};
    return UserModel(
      id: doc.id,
      // Using the document ID from the snapshot
      firstName: data['firstName'],
      lastName: data['lastName'],
      username: data['username'],
      email: data['email'],
      phoneNumber: data['phoneNumber'],
      profilePicture: data['profilePicture'],
    );
  }
}
