"use strict"
/**
 * @param {string} s
 * @param {string} p
 * @return {boolean}
 */
var isMatch = function(s, p) {
    return match(s,0,p,0)
};

function match(s,sIndex,p,pIndex) {
    if (pIndex >= p.length) {
        return sIndex >= s.length
    }
    if (p[pIndex+1] === '*') {
        while (s[sIndex] === p[pIndex] || (p[pIndex] === '.' && sIndex < s.length)) {
            if (match(s,sIndex,p,pIndex+2)) {
                return true
            }
            sIndex++
        }
        return match(s,sIndex,p,pIndex+2);
    } else {
        if (s[sIndex] == p[pIndex] || (p[pIndex] == '.' && sIndex < s.length)) {
            return match(s,sIndex+1,p,pIndex+1)
        } else {
            return false;
        }
    }
}
console.log(isMatch("ab",".*.."))

console.log(isMatch("",".*"))
 console.log(isMatch("ab",".*c"))

console.log(isMatch("bbbba",".*a*a"))

console.log(isMatch("abcd","d*"))

console.log(isMatch("bbbba",".*a*a"))

console.log(isMatch("aa","a"))
console.log(isMatch("aa","aa"))
console.log(isMatch("aaa","aa"))
console.log(isMatch("aa", "a*"))
console.log(isMatch("aa", ".*"))
console.log(isMatch("ab", ".*"))
console.log(isMatch("aab", "c*a*b"))
