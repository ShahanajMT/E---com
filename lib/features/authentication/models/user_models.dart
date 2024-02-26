// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tstore/utils/formatters/formatters.dart';

class UserModel {
  //! keep those values which you don't wanted to update
  final String id;
  String firstName;
  String lastName;
  final String userName;
  final String email;
  String phoneNumber;
  String profilePicture;

  //! constructor for UserModel
  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.userName,
    required this.email,
    required this.phoneNumber,
    required this.profilePicture,
  });

  //! Helper Fn to get the fullName
  String get fullName => '$firstName $lastName';

  //! Helper Fn to format PhoneNo.
  String get formattedPhoneNumber => TFormatter.formatPhoneNumber(phoneNumber);

  //! static Fn to split fullName into first and last
  static List<String> nameParts(fullName) => fullName.split(" ");

  //! static Fn to generate Username from the full name;
  static String generateUsername(fullName) {
    List<String> nameParts = fullName.split(" ");
    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : "";

    String camelCaseUsername = "$firstName$lastName";
    String usernameWithPrefix = "cwt_$camelCaseUsername";
    return usernameWithPrefix;
  }

  //! static Fn to create an empty userModel
  static UserModel empty() => UserModel(
        id: '',
        firstName: '',
        lastName: '',
        userName: '',
        email: '',
        phoneNumber: '',
        profilePicture: '',
      );

  //! convert model to Json Structure
  Map<String, dynamic> toJson() {
    return {
      'FirstName': firstName,
      'LastName': lastName,
      'UserName': userName,
      'Email': email,
      'PhoneNumber': phoneNumber,
      'ProfilePicture': profilePicture,
    };
  }

  //! factory method to create a user model from firebase doc snapshot
  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return UserModel(
        id: document.id,
        firstName: data['FirstName'] ?? '',
        lastName: data['LastName'] ?? '',
        userName: data['UserName'] ?? '',
        email: data['Email'] ?? '',
        phoneNumber: data['PhoneNumber'] ?? '',
        profilePicture: data['ProfilePicture'] ?? '',
      );
    } else {
      return UserModel.empty();
    }
  }
}
