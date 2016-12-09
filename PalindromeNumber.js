"use strict"

/**
 * @param {number} x
 * @return {boolean}
 */
var isPalindrome = function(x) {
    if (x < 0) {
        return false
    }
    if (x < 10) {
        return true
    }
    let result = getHighestUnit(x)
    if (result.unit == x % 10) {
        x = parseInt((x - result.unit * result.base) / 10)
        if (x < result.base / 100) {
            x += result.base / 100;
            x++
        }
        return isPalindrome(x)
    } else {
        return false
    }
    
};

function getHighestUnit(x) {
    var i = 0
    while (x > 10) {
        x /= 10
        i++
    }
    return {"unit":parseInt(x),"base":Math.pow(10,i)}
}


console.log(isPalindrome(121))