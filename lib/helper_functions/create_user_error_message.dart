String getFirebaseAuthErrorMessage(String errorCode) {
  switch (errorCode) {
    case 'email-already-in-use':
      return 'This email is already associated with an account.';
    case 'invalid-email':
      return 'The email address is not valid.';
    case 'operation-not-allowed':
      return 'Email/password registration is currently disabled.';
    case 'weak-password':
      return 'The password is too weak. Please choose a stronger one.';
    case 'wrong-password':
      return 'The password is invalid or the account has no password set.';
    case 'user-disabled':
      return 'This user account has been disabled.';
    case 'user-not-found':
      return 'No user found with this email address.';
    case 'invalid-credential':
      return 'Wrong Email/password.';
    default:
      return 'An unknown error occurred. Please try again. $errorCode';
  }
}
