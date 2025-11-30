String inputFieldValidation(String? value, String hint) {
  if (value == null || value.isEmpty) {
    return 'This field is required';
  }
  if (hint.toLowerCase().contains('E-mail') &&
      !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
    return 'Please enter a valid email';
  }
  if (hint.toLowerCase().contains('password') && value.length < 6) {
    return 'Password must be at least 6 characters';
  }
  return '';
}
