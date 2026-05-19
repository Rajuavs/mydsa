/*
Kth Largest Element in an Array
Medium
Topics
premium lock icon
Companies
Given an integer array nums and an integer k, return the kth largest element in the array.

Note that it is the kth largest element in the sorted order, not the kth distinct element.

Can you solve it without sorting?

 

Example 1:

Input: nums = [3,2,1,5,6,4], k = 2
Output: 5
Example 2:

Input: nums = [3,2,3,1,2,4,5,5,6], k = 4
Output: 4
*/
int findKthLargest(List<int> nums, int k) {
  nums.sort();
  return nums[nums.length - k];
}

/// without sorting
int findKthLargestWithoutSorting(List<int> nums, int k) {
  int left = 0;
  int right = nums.length - 1;

  while (true) {
    int pivotIndex = partition(nums, left, right);
    if (pivotIndex == k - 1) {
      return nums[pivotIndex];
    } else if (pivotIndex < k - 1) {
      left = pivotIndex + 1;
    } else {
      right = pivotIndex - 1;
    }
  }
}

int partition(List<int> nums, int left, int right) {
  int pivot = nums[right];
  int i = left;
  for (int j = left; j < right; j++) {
    if (nums[j] <= pivot) {
      int temp = nums[i];
      nums[i] = nums[j];
      nums[j] = temp;
      i++;
    }
  }
  int temp = nums[i];
  nums[i] = nums[right];
  nums[right] = temp;
  return i;
}

void main() {
  List<int> nums = [3, 2, 1, 5, 6, 4];

  int k = 2;
  print(findKthLargest(nums, k)); // Output: 5 // valid output

  nums = [3, 2, 3, 1, 2, 4, 5, 5, 6];
  k = 4;
  print(
    findKthLargestWithoutSorting(nums, k),
  ); // Output: 4 // not getting valid output
}
