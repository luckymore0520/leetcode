"use strict"
/**
 * @param {number} num
 * @return {string}
 */
var intToRoman = function(num) {
    let romanCharacters = [["", "I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX"],  
            ["", "X", "XX", "XXX", "XL", "L", "LX", "LXX", "LXXX", "XC"],  
            ["", "C", "CC", "CCC", "CD", "D", "DC", "DCC", "DCCC", "CM"],  
            ["", "M", "MM", "MMM"] ];    
    let thousand = parseInt(num / 1000)
    num -= thousand * 1000
    let hundred = parseInt(num / 100)
    num -= hundred * 100
    let ten = parseInt(num / 10)
    num -= ten * 10
    let one = num 
    return romanCharacters[3][thousand] + romanCharacters[2][hundred] + romanCharacters[1][ten] + romanCharacters[0][one]  
};

console.log(intToRoman(1))