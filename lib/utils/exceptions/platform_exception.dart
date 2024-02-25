
class TPlatformException implements Exception {
  final String code;

  TPlatformException(this.code);


  String get message {
    switch (code) {
      case 'INVALID_LOGIN_CREDENTIALS':
        return 'Invalid login credentials';
      case 'too-many-requests':
       return 'Too many requests';
      default:
        return 'An unexpected';  
    }
  }

}