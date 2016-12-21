"use strict"

// /**
//  * @param {string[]} strs
//  * @return {string}
//  */
// var longestCommonPrefix = function(strs) {
//     if (strs.length === 0) {
//         return ""
//     }
//     if (strs.length == 1) {
//         return strs[0]
//     }
//     var result = ""
//     for (var c of strs[0]) {
//         let tmpResult = result + c
//         console.log(result)
//         for (var i = 1; i < strs.length; i++) {
//             if (!strs[i].startsWith(tmpResult)) {
//                 return result
//             }            
//         }
//         result+=c
//     }
//     return result;
// };

//Good Answer
//直接排序，然后比第一个和最后一个
/**
 * @param {string[]} strs
 * @return {string}
 */
var longestCommonPrefix = function(strs) {
    if (strs.length === 0) {
        return ""
    }
    if (strs.length == 1) {
        return strs[0]
    }
    let array = strs.sort()
    let firstStr = array[0]
    let lastStr = array[array.length-1]
    var result = ""
    for (var i = 0 ; i < firstStr.length; i++) {
        if (firstStr[i] == lastStr[i]) {
            result+=firstStr[i]
        } else {
            return result
        }
    }
    return result
}
console.log(longestCommonPrefix(["a","ab"]));