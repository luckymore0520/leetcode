"use strict"
/**
 * @param {number[]} height
 * @return {number}
 */
var maxArea = function(height) {
    if (height.length < 1) {
        return 0
    }
    var answer = 0;
    var left = 0;
    var right = height.length - 1;
    while (left < right) {
        let area = Math.min(height[left],height[right]) * (right - left)
        answer = Math.max(answer,area)
        if (height[left] < height[right]) {
            left++
        } else {
            right--
        }
    }
    return answer
};