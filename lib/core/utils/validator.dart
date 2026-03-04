class Validator {
  static String? validateEmail(String? email) {
    if (email == null) {
      return 'Enter email';
    }
    RegExp emailRegExp = RegExp(
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$",
    );
    if (email.isEmpty) {
      return 'Email can\'t be empty';
    } else if (!emailRegExp.hasMatch(email)) {
      return 'Enter a correct email';
    }
    return null;
  }

  static String? validatePassword(String? password) {
    if (password == null) {
      return "Enter password";
    }
    if (password.isEmpty) {
      return 'Password can\'t be empty';
    } else if (password.length < 6) {
      return 'Enter a password of 6 characters';
    }
    return null;
  }

  static String? validateName(String? name) {
    if (name == null) {
      return "Enter name";
    } else if (name.isEmpty) {
      return "Name can't be empty";
    } else if (name.length < 4) {
      return 'Enter a password of 4 characters';
    }
    return null;
  }
}
