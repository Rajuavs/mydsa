/// Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.

void main() {
  List<int> nums = [3, 2, 4, 1, 8, 11, 15];
  int target = 5;

  // print(twoSum(nums, target));
  // print(twoSumBruteForce(nums, target));
  print(twoSumAll(nums, target));
}

/// time complexity: O(n)
/// space complexity: O(n)
List<int> twoSum(List<int> nums, int target) {
  Map<int, int> numMap = {};
  for (int i = 0; i < nums.length; i++) {
    int complement = target - nums[i];

    print("$i numMap: $numMap , complement: $complement");
    if (numMap.containsKey(complement)) {
      return [numMap[complement]!, i];
    }
    numMap[nums[i]] = i;
  }
  throw Exception("No two sum solution");
}

/// brute force approach
/// Time complexity: O(n^2)
/// Space complexity: O(1)
List<int> twoSumBruteForce(List<int> nums, int target) {
  for (int i = 0; i < nums.length; i++) {
    for (int j = i + 1; j < nums.length; j++) {
      print(" i: $i, j: $j ${nums[i]} + ${nums[j]}");
      if (nums[i] + nums[j] == target) {
        return [i, j];
      }
    }
  }
  throw Exception("No two sum solution");
}

/// give all numbers that two sum to target
/// Time complexity: O(n)
/// Space complexity: O(n)
List<List<int>> twoSumAll(List<int> nums, int target) {
  List<List<int>> result = [];
  Map<int, int> numMap = {};
  for (int i = 0; i < nums.length; i++) {
    int complement = target - nums[i];
    if (numMap.containsKey(complement)) {
      result.add([numMap[complement]!, i]);
    }
    print("$i numMap: $numMap , complement: $complement , result: $result");
    numMap[nums[i]] = i;
  }
  return result;
}
