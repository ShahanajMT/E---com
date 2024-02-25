// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tstore/utils/formatters/formatters.dart';

class UserModel {
  final String id;
  String firstName;
  String lastName;
  final String username;
  final String email;
  String phoneNumber;
  String profilePicture;

  //! constructor
  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.email,
    required this.phoneNumber,
    required this.profilePicture,
  });

  //! Helper fn to get the full name
  String get fullName => '$firstName $lastName';

  //! Helper fn to format phone no.
  String get formatPhoneNumber => TFormatter.formatPhoneNumber(phoneNumber);

  //! static fn to split fullname into first and last
  static List<String> nameParts(fullName) => fullName.split(" ");

  //! static fn to generate a username from the full name
  static String generateUsername(fullName) {
    List<String> nameParts = fullName.split(" ");
    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : ""; 


    String camelCaseUsername = '$firstName$lastName';
    String usernameWithPrefix = "cwt_$camelCaseUsername";

    return usernameWithPrefix;
  }

  //! static fn to create empty user model
  static UserModel empty() => UserModel(id: '', firstName: '', lastName: '', username: '', email: '', phoneNumber: '', profilePicture: '');

  //! convert model to Json Structure for store data in Firebase
  Map<String, dynamic> toJson() {
    return {
      'FirstName': firstName,
      'LastName' : lastName,
      'UserName' : username,
      'Email' : email,
      'PhoneNumber' : phoneNumber,
      'ProfilePicture' : profilePicture,

    };
  }

  //! factory method to create a user model from a firebase documents

  factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.exists) {
      final data = document.data()!;
      return UserModel(
        id: document.id,
        firstName: data['FirstName'] ?? '',
        lastName: data['LastName'] ?? '', // Fixed typo in key
        username: data['UserName'] ?? '', // Fixed typo in key
        email: data['Email'] ?? '', // Fixed typo in key
        phoneNumber: data['PhoneNumber'] ?? '', // Fixed typo in key
        profilePicture: data['ProfilePicture'] ?? '', // Fixed typo in key
      );
    } else {
      throw Exception('Document does not exist'); // Handle case where document doesn't exist
    }
  }
}
