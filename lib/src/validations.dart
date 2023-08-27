
mixin Validations {
  isHasArabicChar(String value) {
    if (value.isNotEmpty) {
      return !RegExp(r"^[a-zA-Z-0-9-.-_.@.\s\']*$").hasMatch(value);
    }
    return false;
  }

  /// Password strategy min 8 digits
  /// min 1 numeric
  /// min 1 lowercase character
  /// min 1 uppercase character
  /// min 1 special character
  bool isPassword(String password) => RegExp(
        r"^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@$!%*?&])([a-zA-Z0-9@$!%*?&]{8,})$",
        multiLine: false,
      ).hasMatch(password);

  String? validatePassword(String? value) {
    if (value==null || value.length < 8 || value.isEmpty) {
      return 'Enter Password Correctly';
    }
    return null;
  }

  String? validateEmail(String? value) {
    final RegExp emailRegEx = RegExp(
        r'^(([^<>()[\]\\.,;:!@#$%&^*\s@\"]+(\.[^<>()[\]\\.,;:!@#$%&^*\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    if (value==null ||
        !emailRegEx.hasMatch(value) ||
        value.isEmpty) {
      return 'Enter Email Correctly';
    }
    return null;
  }

  String? validateUserName(String? value) {
    if (value==null || value.length < 3 || value.isEmpty) {
      return 'Enter Username Correctly';
    }
    return null;
  }
  String? validateAddress(String? value) {
    if (value==null || value.length < 3 || value.isEmpty) {
      return 'Enter Address Correctly';
    }
    return null;
  }

}
