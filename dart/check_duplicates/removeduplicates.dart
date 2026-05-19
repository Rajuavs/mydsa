/* Given a string s, remove duplicate letters so that every letter appears once and only once. You must make sure your result is the smallest in lexicographical order among all possible results.

 

Example 1:

Input: s = "bcabc"
Output: "abc"
Example 2:

Input: s = "cbacdcbc"
Output: "acdb"
*/
String removeDuplicateLetters(String s) {
  List<int> lastIndex = List.filled(26, -1);
  // print("lastIndex: $lastIndex");
  for (int i = 0; i < s.length; i++) {
    lastIndex[s.codeUnitAt(i) - 'a'.codeUnitAt(0)] = i;
  }
  print(" lastIndex: $lastIndex");
  List<String> stack = [];
  Set<String> seen = {};

  for (int i = 0; i < s.length; i++) {
    String c = s[i];
    if (!seen.contains(c)) {
      while (stack.isNotEmpty &&
          stack.last.compareTo(c) > 0 &&
          lastIndex[stack.last.codeUnitAt(0) - 'a'.codeUnitAt(0)] > i) {
        seen.remove(stack.removeLast());
      }
      stack.add(c);
      seen.add(c);
    }
  }

  return stack.join();
}

void main() {
  String s = "cbacdcbc";
  print(removeDuplicateLetters(s)); // Output: "acdb"
}
