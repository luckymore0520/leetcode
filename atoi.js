"use strict"
/**
 * @param {string} str
 * @return {number}
 */
var myAtoi = function(str) {
    let INT_MAX = 2147483647
    let INT_MIN = -2147483648
    str = str.replace(/(^\s*)|(\s*$)/g, "")
    var index = 0
    var isNegative = false
    if (str[0] == '-')  {
        isNegative = true
        index++
    }  else if (str[0] == '+') {
        index++
    }
    var result = ""
    for (;index < str.length; index++) {
        let c = str[index]
        if (c > '9' || c < '0') {
            break
        } else {
            result += c
        }
    }
    var resultInt = 0
    for (var i = 0 ; i < result.length ; i++) {
        let c = result[i]
        resultInt += (c-'0') * Math.pow(10, (result.length - i - 1))
    }
    if (isNegative) {
        resultInt = -resultInt
    }
    if (resultInt > INT_MAX) {
        return INT_MAX
    }
    if (resultInt < INT_MIN) {
        return INT_MIN
    }
    return resultInt
};

console.log(myAtoi("  -0012a42"))