/**
 * You are given a string word. A letter c is called special if it appears both in lowercase and uppercase in word, and every lowercase occurrence of c appears before the first uppercase occurrence of c.

Return the number of special letters in word.

 
 Example 3:

Input: word = "AbBCab"

Output: 0

 */

class Solution {
  int numberOfSpecialCharacters(String word) {
    List<int> lastLower = List.filled(26, -1);
    List<int> firstUpper = List.filled(26, -1);

    for (int i = 0; i < word.length; i++) {
      String ch = word[i];

      if (ch.codeUnitAt(0) >= 'a'.codeUnitAt(0) &&
          ch.codeUnitAt(0) <= 'z'.codeUnitAt(0)) {
        int index = ch.codeUnitAt(0) - 'a'.codeUnitAt(0);
        lastLower[index] = i;
      } else {
        int index = ch.codeUnitAt(0) - 'A'.codeUnitAt(0);

        if (firstUpper[index] == -1) {
          firstUpper[index] = i;
        }
      }
    }

    int count = 0;

    for (int i = 0; i < 26; i++) {
      if (lastLower[i] != -1 &&
          firstUpper[i] != -1 &&
          lastLower[i] < firstUpper[i]) {
        count++;
      }
    }

    return count;
  }
}

void main() {
  Solution solution = Solution();

  print(solution.numberOfSpecialCharacters("aaAbcBC")); // Output: 3
  print(solution.numberOfSpecialCharacters("abc")); // Output: 0
  print(solution.numberOfSpecialCharacters("abBCab")); // Output: 0
}
