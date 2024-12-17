/// Custom exception class to handle various Firebase Authentication errors.
class TFirebaseAuthException implements Exception {
  /// The error code associated with the exception.
  final String code;

  /// Constructor for the exception handler.
  TFirebaseAuthException(this.code);

  /// Returns the error message based on the error code.
  String get message {
    switch (code) {
      case 'email-already-in-use':
        return 'The email address is already registered. Please use a different email.';
      case 'invalid-email':
        return 'The email address provided is invalid. Please enter a valid email.';
      case 'weak-password':
        return 'The password is too weak. Please choose a stronger password.';
      case 'user-disabled':
        return 'This user account has been disabled. Please contact support.';
      case 'user-not-found':
        return 'Invalid login details. User not found.';
      case 'wrong-password':
        return 'Incorrect password. Please try again.';
      case 'invalid-verification-code':
        return 'Invalid verification code. Please enter a valid code.';
      case 'quota-exceeded':
        return 'Quota exceeded. Please try again later.';
      default:
        return 'An unexpected error occurred. Please try again.';
    }
  }
}
