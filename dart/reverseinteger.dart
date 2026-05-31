/* Reverse Integer
Medium
Topics
premium lock icon
Companies
Given a signed 32-bit integer x, return x with its digits reversed. If reversing x causes the value to go outside the signed 32-bit integer range [-231, 231 - 1], then return 0.

Assume the environment does not allow you to store 64-bit integers (signed or unsigned).

 

Example 1:

Input: x = 123
Output: 321
Example 2:

Input: x = -123
Output: -321
Example 3:

Input: x = 120
Output: 21
*/
import 'dart:math' as Math;

int reverse(int x) {
  int reversed = 0;
  if (x < 0) {
    reversed = -reverse(-x);
    return reversed;
  }

  while (x != 0) {
    int digit = x % 10;
    reversed = reversed * 10 + digit;
    x ~/= 10;
  }
  // 32-bit signed integer range check
  if (reversed < -2147483648 || reversed > 2147483647) {
    return 0;
  }

  return reversed;
}

void main() {
  int x = 123;
  print(reverse(x)); // Output: 321

  print("-------------");
  x = -123;
  print(reverse(x)); // Output: -321
  print("-------------");
  x = 120;
  print(reverse(x)); // Output: 21

  print("------------- ${Math.pow(2, 31) - 1}");
  x = 1534236469;
  print(reverse(x)); // Output: 0
}
