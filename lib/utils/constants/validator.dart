String? isValidName(String? value) {
  if (value != null) {
    if (value.isEmpty) {
      return "Name cannot be empty";
    } else if (value.length < 3) {
      return "Name should be higher then 3";
    } else {
      return null;
    }
  } else {
    return null;
  }
}

String? isValidEmail(String? value) {
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = RegExp(pattern as String);
  if (value != null) {
    if (value.isEmpty) {
      return "E-mail cannot be empty";
    } else if (value.length < 3) {
      return "E-mail should be higher then 3";
    } else if (!regex.hasMatch(value)) {
      return 'E-mail invalid';
    }
  } else {
    return null;
  }

}

String? isValidPassword(String? value) {
  if (value != null) {
    if (value.isEmpty) {
      return "Password cannot be empty";
    } else if (value.length < 3) {
      return "Password should be higher then 3";
    } else {
      return null;
    }
  } else {
    return null;
  }
}
