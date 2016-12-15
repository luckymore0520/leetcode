"use strict"
/**
 * @param {string} s
 * @return {number}
 */
var romanToInt = function(s) {
    let romanCharacters = [["", "I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX"],  
            ["", "X", "XX", "XXX", "XL", "L", "LX", "LXX", "LXXX", "XC"],  
            ["", "C", "CC", "CCC", "CD", "D", "DC", "DCC", "DCCC", "CM"],  
            ["", "M", "MM", "MMM"] ];    
    var result = 0;
    for (var i = 3; i >= 0 ; i --) {
        var array = romanCharacters[i];
        for (var j = array.length-1; j>=0; j--) {
            if (s.startsWith(array[j])) {
                s = s.substr(array[j].length,s.length-array[j].length)
                result = result + (j) * Math.pow(10,i)
                break;
            }
        }
    }
    return result
};

console.log(romanToInt("MMMI"))