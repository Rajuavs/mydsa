/// check given number or any string is polindrom or not
bool isPolindrom(dynamic input) {
  String str = input.toString();
  String reversedStr = str.split('').reversed.join('');
  return str == reversedStr;
}

void main() {
  int num = 121;
  print(isPolindrom(num)); // Output: true

  num = -121;
  print(isPolindrom(num)); // Output: false

  String str = "madam";
  print(isPolindrom(str)); // Output: true

  str = "hello";
  print(isPolindrom(str)); // Output: false
}
