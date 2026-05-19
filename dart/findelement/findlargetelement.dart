/// find largest element in list
void main() {
  List<int> numbers = [3, 5, 7, 2, 8];
  int largest = findLargest(numbers);
  print("The largest element is: $largest");
}

int findLargest(List<int> numbers) {
  if (numbers.isEmpty) {
    throw ArgumentError("The list cannot be empty.");
  }

  int largest = numbers[0];
  for (int i = 1; i < numbers.length; i++) {
    if (numbers[i] > largest) {
      largest = numbers[i];
    }
  }

  return largest;
}
