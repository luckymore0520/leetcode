"use strict"
/**
 * @param {string} s
 * @param {string} p
 * @return {boolean}
 */
var isMatch = function(s, p) {
    var pIndex = 0;
    for (var i = 0 ; i < s.length; i++) {
        let c = s[i]
        //相等的情况下判断下一个是否为'*'或者'.'，如果是，则跳过一个
        if (p[pIndex] == c || p[pIndex] == '.') {
            if (p[pIndex+1] == '*') {
                pIndex += 2
            } else  {
                pIndex++
            }
        } else {
            //判断下一个是否为*, 如果是 pIndex 增加两个 并且 i 往前一个位置，重新匹配
            if (p[pIndex+1] == '*') {
                pIndex += 2
                i--
            } else {
                //往前回溯
                if (p[pIndex-1] == '*' && (p[pIndex-2] == c || p[pIndex-2] == '.')) {
                    pIndex -= 2
                    i--;
                } else if ((p[pIndex-1] == c || p[pIndex-1] == '.') && p[pIndex-2] == '*' &&
                (p[pIndex-3] == c || p[pIndex-3] == '.')){
                    pIndex --
                    i--;
                } else {
                    return false
                }
            }
        }
    }
    if (pIndex > p.length - 1) {
        return true
    } else {
        while (pIndex <= p.length) {
            if (p[pIndex+1] === '*') {
                pIndex += 2
            } else {
                return false
            }
        }
    }
    return false
};
console.log(isMatch("aaa","a*a"))

// console.log(isMatch("aa","a"))
// console.log(isMatch("aa","aa"))
// console.log(isMatch("aaa","aa"))
// console.log(isMatch("aa", "a*"))
// console.log(isMatch("aa", ".*"))
// console.log(isMatch("ab", ".*"))
// console.log(isMatch("aab", "c*a*b"))
