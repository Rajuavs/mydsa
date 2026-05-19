// find the smallest element in list
void main() {
  List<int> numbers = [3, 5, 7, 2, 8];
  int smallest = findSmallest(numbers);
  print("The smallest element is: $smallest");
}

int findSmallest(List<int> list) {
  int smallest = list[0];
  for (int i = 1; i < list.length; i++) {
    if (list[i] < smallest) {
      smallest = list[i];
    }
  }
  return smallest;
}
