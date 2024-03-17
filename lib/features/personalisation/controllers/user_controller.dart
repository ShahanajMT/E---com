import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:tstore/data/repositories/user/user_repo.dart';
import 'package:tstore/features/authentication/models/user_models.dart';
import 'package:tstore/utils/snakBars/TLoders.dart';

class UserController extends GetxController {

  static UserController get instance => Get.find();


  final profileLoading = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;
  //Rx<User> user = Rx<User>();
  final userRepository = Get.put(UserRepository());

  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  //! fetch userRecord
 Future<void> fetchUserRecord() async {
  try {
    print('Fetching user details...');
    profileLoading.value = true;
    final user = await userRepository.fetchUserDetails();
    print('User details fetched: $user');

    // Update user observable with fetched user data
    this.user(user);
    //this.user.value = user;
  } catch (e) {
    print('Error fetching user details: $e');
    // Handle error appropriately, e.g., showing an error message
    user(UserModel.empty());
  } finally {
    // Set profile loading state back to false
    profileLoading.value = false;
    print('Profile loading state set to false...');
  }
}





// Future<void> fetchUserRecord() async {
//   try {
//     print('Fetching user details...');
//     profileLoading.value = true;
//     final user = await userRepository.fetchUserDetails(); // Use userRepository instead of UserRepository.instance
//     print('User details fetched: $user');

//     // Update user observable with fetched user data
//     if (user != null) {
//       this.user.value = user;
//     } else {
//       throw Exception('User data is null');
//     }
//   } catch (e) {
//     print('Error fetching user details: $e');
//     // Handle error appropriately, e.g., showing an error message
//     user(UserModel.empty());
//   } finally {
//     // Set profile loading state back to false
//     profileLoading.value = false;
//     print('Profile loading state set to false...');
//   }
// }




  //! save UserRecord from any registration provider
  Future<void> saveUserRecord(UserCredential? userCredential) async {
    try {
      if (userCredential != null) {
        // convert name to First and Last name
        final nameParts =
            UserModel.nameParts(userCredential.user!.displayName ?? '');
        final userName =
            UserModel.generateUsername(userCredential.user!.displayName ?? '');

        // map Data
        final user = UserModel(
          id: userCredential.user!.uid,
          firstName: nameParts[0],
          lastName: nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
          userName: userName,
          email: userCredential.user!.email ?? '',
          phoneNumber: userCredential.user!.phoneNumber ?? '',
          profilePicture: userCredential.user!.photoURL ?? '',
        );

        // Save user data
        await userRepository.saveUserRecord(user);
      }


    } catch (e) {
      TLoaders.warningSnackBar(
          title: 'Data not found!',
          message:
              'Something went wrong while saving your information. You can re save your data in your profile');
    }
  }
}
