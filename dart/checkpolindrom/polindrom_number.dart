/// write a program to check the given number is polindrom or not
/// A palindromic number is a number that remains the same when its digits are reversed. For example, 121 is a palindromic number, while 123 is not.
/// Input: 121
/// Output: true
/// Input: -121
/// Output: false
void main() {
  int num = 12121;
  bool isPalindrome = checkPalindrome(num);
  print(isPalindrome); // Output: true

  // num = -121;
  // isPalindrome = checkPalindrome(num);
  // print(isPalindrome); // Output: false
}

bool checkPalindrome(int num) {
  // Negative numbers are not palindromes
  if (num < 0) {
    return false;
  }

  int original = num;
  int reversed = 0;
  int i = 0;
  while (num > 0) {
    print("i:$i num: $num, reversed: $reversed");
    print("num % 10: ${num % 10}");
    print("num ~/ 10: ${num ~/ 10}");
    reversed = (reversed * 10) + num % 10;
    num ~/= 10;
    i++;
    print("After iteration i: $i: num: $num, reversed: $reversed");
  }

  return original == reversed;
}
