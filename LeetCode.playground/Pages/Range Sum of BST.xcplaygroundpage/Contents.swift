R//: [Previous](@previous)

import Foundation

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

class Solution {
    func rangeSumBST(_ root: TreeNode?, _ L: Int, _ R: Int) -> Int {
        guard let node = root else {
            return 0
        }
        
        guard node.val >= L else {
            return rangeSumBST(node.right, L, R)
        }
        
        guard node.val <= R else {
            return rangeSumBST(node.left, L, R)
        }
        
        return node.val + rangeSumBST(node.left, L, R) + rangeSumBST(node.right, L, R)
    }
}
