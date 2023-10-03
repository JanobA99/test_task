extension EnumToString on Enum {
  String getName() {
    return toString().split('.')[1];
  }
}

extension StringCasingExtension on String {
  String toCapitalized() {
    if (isNotEmpty) {
      return '${this[0].toUpperCase()}${substring(1, length)}';
    } else {
      return this;
    }
  }

  String cleanNumbers() {
    var s = "";
    for (int i = 0; i < length; i++) {
      if (!RegExp(r'^[0-9]').hasMatch(this[i])) {
        s += this[i];
      }
    }
    return s;
  }
}
