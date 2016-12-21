"use strict"

/**
 * @param {number[]} nums
 * @return {number[][]}
 */
var threeSum = function(nums) {
    
    var result = []
    if (nums.length < 3) {
        return result;
    }
    let sortedNums = nums.sort(compare);
    console.log(sortedNums)
    for (var i = 0 ; i < sortedNums.length - 2; i++) {
        let targetValue = sortedNums[i];
        if (i > 0 && targetValue == sortedNums[i-1]) {
            continue
        } else {
            findTouples(targetValue,i+1,sortedNums.length-1);
        }
    }
    return result;
    
    function compare(a,b) {
         if (a < b) {
             return -1;
         }else if(a > b) {
             return 1;
         }else{
             return 0;
         }
     }
    
    function findTouples(target,start,end) {
        while (start < end) {
            if (sortedNums[start] + sortedNums[end] + target == 0) {
                result.push([target,sortedNums[start],sortedNums[end]])
                while (start < end && sortedNums[start] == sortedNums[start+1]) {
                    start++
                }
                while (start < end && sortedNums[end] == sortedNums[end-1]) {
                    end--
                }
                start++
                end--
            } else if (sortedNums[start] + sortedNums[end] + target > 0) {
                end--
            } else {
                start++
            }
        }
    }

    
}; 



console.log(threeSum([-4,-2,-2,-2,0,1,2,2,2,3,3,4,4,6,6]))