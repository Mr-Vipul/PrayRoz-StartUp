import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:prayroz/utils/formatters/formatter.dart';

class UserModel {
  // Keep those values final which you do not want to update.
  final String id;
  String firstName;
  String lastName;
  final String username;
  final String email;
  String phoneNumber;
  String profilePicture;

  /// Constructor for UserModel.
  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.email,
    required this.phoneNumber,
    required this.profilePicture,
  });

  /// Helper function to get the full name.
  String get fullName => '$firstName $lastName';

  /// Helper function to format phone number.
  String get formattedPhoneNo => TFormatter.formatPhoneNumber(phoneNumber);

  /// Static function to split full name into first and last name.
  static List<String> nameParts(fullName) => fullName.split("");

  static String generateUsername(String fullName) {
    // Split the full name into a list of parts
    List<String> nameParts = fullName.split(" ");
    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : "";
    String camelCaseUsername = "$firstName$lastName";
    String usernameWithPrefix = "cwt_$camelCaseUsername";
    return usernameWithPrefix; // Return the final username with the prefix
  }

  static UserModel empty() =>
      UserModel(id: '',
          firstName: ' ',
          lastName: ' ',
          username: '',
          email: ' ',
          phoneNumber: ' ',
          profilePicture: ' ');

  /// Converts the UserModel to a Map for storage (e.g., Firestore).
  Map<String, dynamic> toJson() {
    return {
      'FirstName': firstName,
      'LastName': lastName,
      'Username': username,
      'Email': email,
      'PhoneNumber': phoneNumber,
      'ProfilePicture': profilePicture,
    };
  }

  /// Creates a UserModel instance from a Map.
  factory UserModel.fromSnapShot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return UserModel(
        id: document.id,
        // Use document.id instead of 'document['id']' to get the document ID
        firstName: data['firstName'] ?? '',
        // Default to empty string if 'firstName' is null
        lastName: data['lastName'] ?? '',
        // Default to empty string if 'lastName' is null
        username: data['username'] ?? '',
        // Default to empty string if 'username' is null
        email: data['email'] ?? '',
        // Default to empty string if 'email' is null
        phoneNumber: data['phoneNumber'] ?? '',
        // Default to empty string if 'phoneNumber' is null
        profilePicture: data['profilePicture'] ??
            '', // Default to empty string if 'profilePicture' is null
      );
    } else {
      throw Exception("Document data is null");
    }
  }
}
