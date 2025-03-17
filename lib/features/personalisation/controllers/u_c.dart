// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:get/get.dart';
// import 'package:tstore/data/repositories/user/user_repo.dart';

// import '../../../utils/snakBars/TLoders.dart';
// import '../../authentication/models/user_models.dart';

// class UserController extends GetxController {
//   static UserController get instance => Get.find();

//   final userRepository = Get.put(UserRepository());

//   /// save user Record from any Reistraion provider
//   Future<void> saveUserRecord(UserCredential? userCredentials) async {
//     try {
//       if (userCredentials != null) {
//         // Convert Name to First and Last Name
//         final nameParts =
//             UserModel.nameParts(userCredentials.user!.displayName ?? '');
//         final userName =
//             UserModel.generateUsername(userCredentials.user!.displayName ?? '');

//         // Map Data
//         final user = UserModel(
//           id: userCredentials.user!.uid,
//           firstName: nameParts[0],
//           lastName: nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
//           userName: userName,
//           email: userCredentials.user!.email ?? '',
//           phoneNumber: userCredentials.user!.phoneNumber ?? '',
//           profilePicture: userCredentials.user!.photoURL ?? '',
//         );

//         // Save user data
//         await userRepository.saveUserRecord(user);
//       }


//     } catch (e) {
//       TLoaders.warningSnackBar(
//           title: 'Data not saved',
//           message:
//               'Some thing went wrong while saving your information, you can re-save your datain your profile.');
//     }
//   }
// }
