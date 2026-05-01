///You are given two non-empty linked lists representing two non-negative integers.
/// The digits are stored in reverse order, and each of their nodes contains a single digit.
/// Add the two numbers and return the sum as a linked list.
/// You may assume the two numbers do not contain any leading zero, except the number 0 itself.

void main() {
  ListNode l1 = ListNode(2, ListNode(4, ListNode(3)));
  ListNode l2 = ListNode(5, ListNode(2, ListNode(4)));

  ListNode? result = addTwoNumbers(l1, l2);
  // Print the result
  while (result != null) {
    print(result.val);
    result = result.next;
  }
}

class ListNode {
  int val;
  ListNode? next;
  ListNode(this.val, [this.next]);
}

ListNode? addTwoNumbers(ListNode? l1, ListNode? l2) {
  ListNode dummy = ListNode(0);
  ListNode? current = dummy;
  int carry = 0;

  while (l1 != null || l2 != null || carry != 0) {
    int sum = carry;
    if (l1 != null) {
      sum += l1.val;
      l1 = l1.next;
    }
    if (l2 != null) {
      sum += l2.val;
      l2 = l2.next;
    }

    carry = sum ~/ 10;
    // print('Sum: $sum, Carry: $carry');
    current?.next = ListNode(sum % 10);
    current = current?.next;
    print('Current Node Value: ${current?.val}, Next Node: ${current?.next}');
    // print("dummy Node Value: ${dummy.val}, Next Node: ${dummy.next}");
  }
  ListNode? d = dummy;
  while (d != null) {
    print('Dummy Node Value: ${d.val}, Next Node: ${d.next?.val}');
    d = d.next;
  }
  return dummy.next;
}
