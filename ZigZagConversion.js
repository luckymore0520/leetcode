"use stricts"

/**
 * @param {string} s
 * @param {number} numRows
 * @return {string}
 */
var convert = function(s, numRows) {
    let len = s.length
    if (len == 0 || numRows <= 1) {
        return s
    }
    var ans = Array(numRows) 
    for (var i = 0 ; i < numRows ; i++) {
        ans[i] = ""
    }
    var row = 0;
    var delta = 1;
    for (var i = 0 ; i < len ; i ++) {
        ans[row] += s[i]
        row += delta
        if (row >= numRows) {
            row = numRows - 2;
            delta = -1;
        }
        if (row < 0) {
            row = 1;
            delta = 1
        }
    }
    var ret = ""
    for (var i = 0 ; i < numRows; i++) {
        ret += ans[i]
    }
    return ret
};