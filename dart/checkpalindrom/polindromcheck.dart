/// check given number or any string is polindrom or not
bool isPolindrom(dynamic input) {
  String str = input.toString();
  String reversedStr = str.split('').reversed.join('');
  return str == reversedStr;
}

/// without using built in function
bool isPolindromWithoutBuiltIn(dynamic input) {
  String str = input.toString();
  int left = 0;
  int right = str.length - 1;

  while (left < right) {
    if (str[left] != str[right]) {
      return false;
    }
    left++;
    right--;
  }
  return true;
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
