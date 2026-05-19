/*
Given two integer arrays nums1 and nums2, sorted in non-decreasing order, return the minimum integer common to both arrays. If there is no common integer amongst nums1 and nums2, return -1.

Note that an integer is said to be common to nums1 and nums2 if both arrays have at least one occurrence of that integer.

 

Example 1:

Input: nums1 = [1,2,3], nums2 = [2,4]
Output: 2
Explanation: The smallest element common to both arrays is 2, so we return 2.
Example 2:

Input: nums1 = [1,2,3,6], nums2 = [2,3,4,5]
Output: 2
Explanation: There are two common elements in the array 2 and 3 out of which 2 is the smallest, so 2 is returned.
 

*/

int getCommon(List<int> num1, List<int> num2) {
  int i = 0;
  int j = 0;

  while (i < num1.length && j < num2.length) {
    if (num1[i] == num2[j]) {
      return num1[i];
    } else if (num1[i] < num2[j]) {
      i++;
    } else {
      j++;
    }
  }

  return -1; // No common integer found
}

void main() {
  List<int> nums1 = [1, 2, 3];
  List<int> nums2 = [2, 4];
  print(getCommon(nums1, nums2)); // Output: 2

  nums1 = [1, 2, 3, 6];
  nums2 = [2, 3, 4, 5];
  print(getCommon(nums1, nums2)); // Output: 2
}
