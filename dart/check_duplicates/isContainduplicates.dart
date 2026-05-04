/* Given an integer array nums, return true if any value appears at least twice in the array,
 and return false if every element is distinct.

Example 1:
Input: nums = [1,2,3,1]
Output: true
Explanation:
The element 1 occurs at the indices 0 and 3.
*/
bool containsDuplicate(List<int> nums) {
  Set<int> seen = {};
  for (int num in nums) {
    if (seen.contains(num)) {
      return true; // Duplicate found
    }
    seen.add(num); // Add the number to the set
  }
  return false; // No duplicates found
}

void main() {
  List<int> nums = [1, 2, 3, 1];
  print(containsDuplicate(nums)); // Output: true

  nums = [1, 2, 3, 4];
  print(containsDuplicate(nums)); // Output: false

  nums = [1, 1, 1, 3, 3, 4, 3, 2, 4, 2];
  print(containsDuplicate(nums)); // Output: true
}
