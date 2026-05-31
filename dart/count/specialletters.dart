/**
 * You are given a string word. A letter is called special if it appears both in lowercase and uppercase in word.

Return the number of special letters in word.

 

Example 1:

Input: word = "aaAbcBC"

Output: 3

Explanation:

The special characters in word are 'a', 'b', and 'c'.

Example 2:

Input: word = "abc"

Output: 0

Explanation:

No character in word appears in uppercase.

Example 3:

Input: word = "abBCab"

Output: 1

Explanation:

The only special character in word is 'b'.

 

Constraints:

1 <= word.length <= 50
word consists of only lowercase and uppercase English letters.
 */
class Solution {
  int numberOfSpecialCharacters(String word) {
    Set<String> lower = {};
    Set<String> upper = {};

    for (int i = 0; i < word.length; i++) {
      String char = word[i];
      if (char == char.toLowerCase()) {
        lower.add(char);
      } else {
        upper.add(char.toLowerCase());
      }
    }

    int count = 0;
    for (String char in lower) {
      if (upper.contains(char)) {
        count++;
      }
    }

    return count;
  }
}

void main() {
  Solution solution = Solution();

  String word1 = "aaAbcBC";
  print(solution.numberOfSpecialCharacters(word1)); // Output: 3

  String word2 = "abc";
  print(solution.numberOfSpecialCharacters(word2)); // Output: 0

  String word3 = "abBCab";
  print(solution.numberOfSpecialCharacters(word3)); // Output: 1
}
