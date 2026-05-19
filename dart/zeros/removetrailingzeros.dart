/*Remove Trailing Zeros From a String

Given a positive integer num represented as a string, return the integer num without trailing zeros as a string.

*/

String removeTrailingZeros(String num) {
  int i = num.length - 1;

  while (i >= 0 && num[i] == '0') {
    i--;
  }

  return num.substring(0, i + 1);
}

void main() {
  String num = "51230100";
  print(removeTrailingZeros(num)); // Output: "512301"

  num = "123";
  print(removeTrailingZeros(num)); // Output: "123"

  num = "1000";
  print(removeTrailingZeros(num)); // Output: "1"
}
