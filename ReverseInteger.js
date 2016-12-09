"use strict";
/**
 * @param {number} x
 * @return {number}
 */
var reverse = function(x) {
    let INT_MAX = 2147483647

    let INT_MIN = -2147483648
    let isNegative = x < 0
    x = Math.abs(x)
    let xStr = x.toString()
    let result = ""
    for (var i = xStr.length - 1; i >= 0 ; i--) {
        if (result.length == 0 && xStr[i] == '0') {

        } else {
            result += xStr[i]
        }
    }
    var resultNum = Number(result)
    if (isNegative) {
        resultNum = -resultNum
    }
    if (resultNum > INT_MAX || resultNum < INT_MIN) {
        return 0
    }
    return resultNum
};



console.log(reverse(1534236469))