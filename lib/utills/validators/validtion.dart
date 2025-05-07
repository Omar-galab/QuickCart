class TValidator {
  ///Empty text Validation
  static String? validateEmptyText(String? fieldName , String? value){
    if(value == null || value.isEmpty){
      return '$fieldName is required';
    }
    return null;
  }
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required.';
    }
    final emailRegExp =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$');

    if (!emailRegExp.hasMatch(value)) {
      return 'Invalid email addres';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'password is reqired.';
    }
    if (value.length < 6) {
      return 'Password must be at leeast 6 charactres letter.';
    }
    if (!value.contains(RegExp(r'[A-z]'))) {
      return 'Password must contain at least one upercase letter.';
    }
    // Contains at least one special character
    if (!value.contains(RegExp(r'[!@#%^&*(),.?":{}|<>]'))) {
      return '• Special character is missing.\n';
    }
    // Contains at least one digit
    if (!value.contains(RegExp(r'[0-9]'))) {
      return '• Digit is missing.\n';
    }
    return null;
  }

  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'phone number is required.';
    }
    final phoneRegExp = RegExp(r'^\d{10}$');
    if (!phoneRegExp.hasMatch(value)) {
      return ' invalid Phone number (10 digits required).';
    }
    return null;
  }
}
