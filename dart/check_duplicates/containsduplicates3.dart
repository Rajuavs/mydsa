/*
You are given an integer array nums and two integers indexDiff and valueDiff.

Find a pair of indices (i, j) such that:

i != j,
abs(i - j) <= indexDiff.
abs(nums[i] - nums[j]) <= valueDiff, and
Return true if such pair exists or false otherwise.

 

Example 1:

Input: nums = [1,2,3,1], indexDiff = 3, valueDiff = 0
Output: true
Explanation: We can choose (i, j) = (0, 3).
We satisfy the three conditions:
i != j --> 0 != 3
abs(i - j) <= indexDiff --> abs(0 - 3) <= 3
abs(nums[i] - nums[j]) <= valueDiff --> abs(1 - 1) <= 0
Example 2:

Input: nums = [1,5,9,1,5,9], indexDiff = 2, valueDiff = 3
Output: false
Explanation: After trying all the possible pairs (i, j), we cannot satisfy the three conditions, so we return false.
 

Constraints:

2 <= nums.length <= 105
-109 <= nums[i] <= 109
1 <= indexDiff <= nums.length
0 <= valueDiff <= 109
*/

bool containsNearbyAlmostDuplicate(
  List<int> nums,
  int indexDiff,
  int valueDiff,
) {
  if (valueDiff < 0 || indexDiff <= 0) {
    return false; // Invalid input, valueDiff must be non-negative and indexDiff must be positive
  }

  Map<int, int> buckets = {};
  int bucketSize = valueDiff + 1; // Size of each bucket
  print("bucketSize: $bucketSize, nums: $nums");
  for (int i = 0; i < nums.length; i++) {
    int numb = nums[i];
    int bucketId =
        numb ~/ bucketSize; // Determine the bucket ID for the current number
    print(" i: $i, numb: $numb, bucketId: $bucketId");

    if (buckets.containsKey(bucketId)) {
      return true; // Found a nearby duplicate in the same bucket
    }

    // left neighbor bucket
    if (buckets.containsKey(bucketId - 1) &&
        (numb - buckets[bucketId - 1]!).abs() <= valueDiff) {
      return true; // Found a nearby duplicate in the left neighbor bucket
    }

    // right neighbor bucket
    if (buckets.containsKey(bucketId + 1) &&
        (numb - buckets[bucketId + 1]!).abs() <= valueDiff) {
      return true; // Found a nearby duplicate in the right neighbor bucket
    }
    buckets[bucketId] = numb; // Add the current number to its bucket
    // maintain the sliding window of size indexDiff
    if (i >= indexDiff) {
      int oldBucketId =
          nums[i - indexDiff] ~/
          bucketSize; // Determine the bucket ID for the number that is sliding out of the window
      buckets.remove(
        oldBucketId,
      ); // Remove the number that is sliding out of the window from its bucket
    }
  }
  return false; // No nearby almost duplicates found
}

void main() {
  List<int> nums = [1, 2, 3, 1];
  int indexDiff = 3;
  int valueDiff = 0;
  print(
    containsNearbyAlmostDuplicate(nums, indexDiff, valueDiff),
  ); // Output: true

  nums = [1, 0, 1, 1];
  indexDiff = 1;
  valueDiff = 0;
  print(
    containsNearbyAlmostDuplicate(nums, indexDiff, valueDiff),
  ); // Output: true

  nums = [1, 2, 3, 1, 2, 3];
  indexDiff = 2;
  valueDiff = 0;
  print(
    containsNearbyAlmostDuplicate(nums, indexDiff, valueDiff),
  ); // Output: false

  nums = [3, -3];
  indexDiff = 2;
  valueDiff = 4;
  print(
    containsNearbyAlmostDuplicate(nums, indexDiff, valueDiff),
  ); // Output: true
}

// bool containsNearbyAlmostDuplicate(
//   List<int> nums,
//   int indexDiff,
//   int valueDiff,
// ) {
//   if (valueDiff < 0 || indexDiff <= 0) {
//     return false; // Invalid input, valueDiff must be non-negative and indexDiff must be positive
//   }

//   Map<int, int> buckets = {};
//   int bucketSize = valueDiff + 1; // Size of each bucket
//   int size = valueDiff + 1; // Size of each bucket
//   for (int i = 0; i < nums.length; i++) {
//     int numb = nums[i];
//     int bucketId =
//         numb ~/ bucketSize; // Determine the bucket ID for the current number

//     if (buckets.containsKey(bucketId)) {
//       return true; // Found a nearby duplicate in the same bucket
//     }

//     // left neighbor bucket
//     if (buckets.containsKey(bucketId - 1) &&
//         (numb - buckets[bucketId - 1]!).abs() <= valueDiff) {
//       return true; // Found a nearby duplicate in the left neighbor bucket
//     }

//     // right neighbor bucket
//     if (buckets.containsKey(bucketId + 1) &&
//         (numb - buckets[bucketId + 1]!).abs() <= valueDiff) {
//       return true; // Found a nearby duplicate in the right neighbor bucket
//     }
//     buckets[bucketId] = numb; // Add the current number to its bucket
//     // maintain the sliding window of size indexDiff
//     if (i >= indexDiff) {
//       int oldBucketId =
//           nums[i - indexDiff] ~/
//           bucketSize; // Determine the bucket ID for the number that is sliding out of the window
//       buckets.remove(
//         oldBucketId,
//       ); // Remove the number that is sliding out of the window from its bucket
//     }
//   }
//   return false; // No nearby almost duplicates found
// }

// void main() {
//   List<int> nums = [1, 2, 3, 1];
//   int indexDiff = 3;
//   int valueDiff = 0;
//   print(
//     containsNearbyAlmostDuplicate(nums, indexDiff, valueDiff),
//   ); // Output: true

//   nums = [1, 0, 1, 1];
//   indexDiff = 1;
//   valueDiff = 0;
//   print(
//     containsNearbyAlmostDuplicate(nums, indexDiff, valueDiff),
//   ); // Output: true

//   nums = [1, 2, 3, 1, 2, 3];
//   indexDiff = 2;
//   valueDiff = 0;
//   print(
//     containsNearbyAlmostDuplicate(nums, indexDiff, valueDiff),
//   ); // Output: false
// }
