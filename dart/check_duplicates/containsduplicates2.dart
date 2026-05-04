/*Given an integer array nums and an integer k, 
return true if there are two distinct indices i and j in the array 
such that nums[i] == nums[j] and abs(i - j) <= k.

 

Example 1:

Input: nums = [1,2,3,1], k = 3
Output: true
Example 2:

Input: nums = [1,0,1,1], k = 1
Output: true
Example 3:

Input: nums = [1,2,3,1,2,3], k = 2
Output: false
*/

bool containsNearByDuplicate(List<int> nums, int k) {
  Map<int, int> indexMap = {};

  for (int i = 0; i < nums.length; i++) {
    if (indexMap.containsKey(nums[i]) && (i - indexMap[nums[i]]!) <= k) {
      return true; // Found a nearby duplicate
    }
    indexMap[nums[i]] = i; // Update the index of the current number
  }

  return false; // No nearby duplicates found
}

void main() {
  List<int> nums = [1, 2, 3, 1];
  int k = 3;
  print(containsNearByDuplicate(nums, k)); // Output: true

  nums = [1, 0, 1, 1];
  k = 1;
  print(containsNearByDuplicate(nums, k)); // Output: true

  nums = [1, 2, 3, 1, 2, 3];
  k = 2;
  print(containsNearByDuplicate(nums, k)); // Output: false
}
