class TFormatException implements Exception {
  final String message;

  TFormatException([ this.message = 'An unexcept format error occured. Please check your input']);

  factory TFormatException.formMessage(String message) {
    return TFormatException(message);
  }

  String get formattedMessage => message;

  factory TFormatException.fromCode(String code) {
    switch(code) {
      case 'invalid-email-format':
        return  TFormatException( 'The email address format is in valid');

      default:
        return TFormatException( 'Jaopp');  
    }
  }

}