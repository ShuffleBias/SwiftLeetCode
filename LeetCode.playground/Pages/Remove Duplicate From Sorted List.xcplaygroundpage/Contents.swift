
 public class ListNode {
      public var val: Int
      public var next: ListNode?
      public init(_ val: Int) {
          self.val = val
          self.next = nil
      }
  }

class Solution {
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        if head == nil {return nil}
        if head!.next == nil {return head}
        
        if head!.val == head!.next!.val {
            head!.next = head!.next!.next
            return deleteDuplicates(head)
        } else {
            head!.next = deleteDuplicates(head!.next)
        }
        
        return head
    }
}
