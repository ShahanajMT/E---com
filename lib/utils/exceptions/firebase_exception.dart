class TFirebaseException implements Exception {
 final String code;


 TFirebaseException(this.code);


 String get message {
   switch(code) {
     case 'email-already-in-use':
     return'The email address is already in use by another account.';
    
   case 'user-not-found':
     return'No user found for that email.';
    
   case 'wrong-password':
     return'Wrong password provided for that user.';
    
   case 'user-disabled':
     return'The user account has been disabled by an administrator.';
    
   case 'invalid-email':
     return'The email address is badly formatted.';
    
   case 'too-many-requests':
     return'Too many unsuccessful login attempts. Please try again later.';
    
   case 'operation-not-allowed':
     return'Operation not allowed. Enable email/password sign-in in the Firebase Console.';
    
   case 'network-request-failed':
     return'A network error occurred. Check your internet connection.';
    
   default:
     return'An error occurred: ';
   }
 }
}
