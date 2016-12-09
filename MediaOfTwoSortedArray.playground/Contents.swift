//: Playground - noun: a place where people can play

import UIKit

class Solution {
    
}

func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
    let totalCount = nums1.count + nums2.count
    if (totalCount % 2 != 0) {
        let targetIndex = (totalCount + 1 ) / 2
        return Double(findKthElement(nums1, nums2, targetIndex))
    } else {
        let targetFirstIndex = totalCount / 2
        let targetSecondIndex = targetFirstIndex + 1
        return (Double(findKthElement(nums1, nums2, targetFirstIndex)) + Double(findKthElement(nums1, nums2, targetSecondIndex))) / 2.0
        
    }
}

func findKthElement(_ nums1: [Int], _ nums2: [Int],  _ k:Int) -> Int{
    if (nums1.count > nums2.count) {
        return findKthElement(nums2, nums1, k)
    }
    if (nums1.count == 0){
        return nums2[k-1]
    }
    if (k == 1) {
        return min(nums1[0],nums2[0])
    }
    let pa = min(k/2,nums1.count)
    let pb = k - pa
    if (nums1[pa-1] < nums2[pb-1]) {
        var tmpNums1 = nums1
        tmpNums1.removeFirst(pa)
        return findKthElement(tmpNums1, nums2, k-pa)
    } else if (nums1[pa-1] > nums2[pb-1]) {
        var tmpNums2 = nums2
        tmpNums2.removeFirst(pb)
        return findKthElement(tmpNums2, nums1, k-pb)
        
    } else {
        return nums1[pa-1]
    }
}

findMedianSortedArrays([1,2], [3,4])