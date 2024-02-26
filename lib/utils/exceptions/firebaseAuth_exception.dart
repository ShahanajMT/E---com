// ignore: file_names
class TFirebaseAuthException implements Exception {
 final String code;


 TFirebaseAuthException(this.code);


 String get message {
   switch (code) {
     case 'email-already-in-use':
       return 'This email address is already registerd. please use a differnt email';


     case 'invalid-email':
       return 'This email address provide is in valid. please enter a valid email';


     case 'weak-password':
       return 'This email address is already registerd. please use a differnt email';


     case 'user-disable':
       return 'This user account has been disabled. Please contact support for assistence.';


     case 'user-not-found':
       return 'Invalid logIn details. user not found.';


     case 'wrong-password':
       return 'In correct password. Please check your password agein.';


     case 'invalid-verification-code':
       return 'Invalid verification code.';


     case 'invalid-verification-id':
       return 'Invalid verification id';


     case 'quota-exceeded':
       return 'Quata exceeded. ';


     case 'email-already-exist':
       return 'Email already exists';


     default:
       return 'An unexcept firebase exception';
   }
 }
}
