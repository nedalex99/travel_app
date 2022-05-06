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
