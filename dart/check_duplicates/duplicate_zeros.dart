/*
*Given a fixed-length integer array arr,
 duplicate each occurrence of zero, shifting the remaining elements to the right.
 * Note that elements beyond the length of the original array are not written. Do the above modifications to the input array in place and do not return anything.
*/

void duplicateZeros(List<int> array) {
  int n = array.length;
  int i = 0;

  while (i < n) {
    if (array[i] == 0) {
      // Shift elements to the right
      print("Shifting elements to the right from index $i");
      for (int j = n - 1; j > i; j--) {
        print("Moving element at index ${j - 1} (${array[j - 1]}) to index $j");
        array[j] = array[j - 1];
      }
      // Duplicate the zero
      print("Duplicating zero at index $i");
      if (i + 1 < n) {
        array[i + 1] = 0;
      }
      i += 2; // Move past the duplicated zero
    } else {
      i++;
    }
  }
}

void main() {
  List<int> arr = [1, 0, 2, 3, 0, 4, 5, 0];
  duplicateZeros(arr);
  print(arr); // Output: [1, 0, 0, 2, 3, 0, 0, 4]

  // arr = [1, 2, 3];
  // duplicateZeros(arr);
  // print(arr); // Output: [1, 2, 3]
}
