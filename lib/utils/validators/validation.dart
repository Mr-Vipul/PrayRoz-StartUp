class TValidator {
  ///Empty Text Validation
  static String? validateEmptyText(String? fieldName,String? value) {
    if (value == null || value.isEmpty) {
      return '$fieldName is required';
    }
    return "";
  }

  /// Validate Email
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required.';
    }

    // Regular expression for email validation
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegExp.hasMatch(value)) {
      return 'Invalid email address.';
    }

    return null;
  }

  /// Validate Password
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required.';
    }

    // Check for minimum password length
    if (value.length < 6) {
      return 'Password must be at least 6 characters long.';
    }

    // Check for uppercase letters
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'Password must contain at least one uppercase letter.';
    }

    // Check for numeric characters
    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Password must contain at least one numeric character.';
    }

    // Check for special characters
    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return 'Password must contain at least one special character.';
    }

    return null;
  }

  /// Validate Phone Number
  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required.';
    }

    // Regular expression for phone number validation (example: 10-digit numbers)
    final phoneRegExp = RegExp(r'^\d{10}$');
    if (!phoneRegExp.hasMatch(value)) {
      return 'Invalid phone number. It should be 10 digits long.';
    }

    return null;
  }

  /// Validate Username
  static String? validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return 'Username is required.';
    }

    // Check for minimum username length
    if (value.length < 3) {
      return 'Username must be at least 3 characters long.';
    }

    // Check for invalid characters
    if (!RegExp(r'^[a-zA-Z0-9_]+$').hasMatch(value)) {
      return 'Username can only contain letters, numbers, and underscores.';
    }

    return null;
  }
}
