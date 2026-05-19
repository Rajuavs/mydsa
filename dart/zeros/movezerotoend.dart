/// move all zeros to the end of the array while maintaining the relative order of the non-zero elements
List<int> moveZerosToEnd(List<int> arr) {
  List<int> result = [];
  int zeroCount = 0;

  for (int num in arr) {
    if (num == 0) {
      zeroCount++;
    } else {
      result.add(num);
    }
  }

  for (int i = 0; i < zeroCount; i++) {
    result.add(0);
  }

  return result;
}

void main() {
  List<int> arr = [0, 1, 0, 3, 12];
  List<int> result = moveZerosToEnd(arr);
  print(result); // Output: [1, 3, 12, 0, 0]
}
