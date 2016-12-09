
"use strict";

/**
 * @param {string} s
 * @return {string}
 */
var longestPalindrome = function(s) {
    let processedStr = preprocess(s)
    let length = processedStr.length
    var pArray = Array(length)
    var c = 0 
    var r = 0
    for (var i = 1 ; i < length - 2; i++) {
        let mirror = c - (i-c)
        pArray[i] = (r > i) ? Math.min(r-i, pArray[mirror]) : 0
        while (processedStr[i+1+pArray[i]] == processedStr[i-1-pArray[i]]) {
            pArray[i]++
        }
        if (i+pArray[i] > r) {
            r = i + pArray[i]
            c = i
        }
    }
    var maxLen = 0
    var centerIndex = 0
    for (var i = 0 ; i < length - 2; i++) {
        if (pArray[i] > maxLen) {
            maxLen = pArray[i]
            centerIndex = i
        }
    }
    return s.substr((centerIndex - 1 - maxLen) / 2, maxLen)
};

function preprocess(s) {
    var result = "^#"
    for (var c of s) {
        result += c
        result += "#"
    }
    result += "$"
    return result
}

console.log(longestPalindrome("abba"))