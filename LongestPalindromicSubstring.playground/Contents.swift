//: Playground - noun: a place where people can play

import UIKit


extension String{
    subscript (i: Int) -> Character? {
        if i >= self.characters.count || i < 0{
            return nil
        }
        let index = self.characters.index(self.startIndex, offsetBy: i)
        return self[index]
    }


    func subString(_ start:Int, _ length:Int) -> String {
        let startIndex = self.characters.index(self.startIndex, offsetBy: start)
        let endIndex = self.characters.index(self.startIndex, offsetBy: start + length)
        let range = Range<String.Index>(startIndex..<endIndex)
        return self.substring(with: range)
    }
    
}


func preprocess(_ s:String) -> String {
    var result = "^#"
    for character in s.characters {
        
        result.append(character)
        result.append("#")
    }
    result.append("$")
    return result;
}
func longestPalindrome(_ s: String) -> String {
    let processedStr = preprocess(s)
    let length = processedStr.characters.count
    var pArray = Array(repeating: 0, count: length) //数组中存放这个对应位置数字的回文值
    var c = 0  //中心点
    var r = 0  //最右位置
    for i in 1...length-2 {
        let mirror = c - (i-c)  //对于c位置的镜像点
        //如果r>i的话 那么i的镜像点是已经被处理过的，这个时候若果 r-1 > 该镜像点的回文数直接取，否则只能取 r-i
        pArray[i] = (r > i) ? min(r-i, pArray[mirror]) : 0;
        //再向两边扩展
        while (processedStr[i + 1 + pArray[i]] == processedStr[i - 1 - pArray[i]]) {
            pArray[i] = pArray[i] + 1
        }
        //如果i+p[i]大于R，更新R和C
        if (i + pArray[i] > r) {
            c = i
            r = i + pArray[i]
        }
    }
    var maxLen = 0
    var centerIndex = 0
    for i in 0...length-2 {
        if (pArray[i] > maxLen) {
            maxLen = pArray[i]
            centerIndex = i
        }
    }
    return s.subString((centerIndex - 1 - maxLen) / 2, maxLen)
}

longestPalindrome("zudfweormatjycujjirzjpyrmaxurectxrtqedmmgergwdvjmjtstdhcihacqnothgttgqfywcpgnuvwglvfiuxteopoyizgehkwuvvkqxbnufkcbodlhdmbqyghkojrgokpwdhtdrwmvdegwycecrgjvuexlguayzcammupgeskrvpthrmwqaqsdcgycdupykppiyhwzwcplivjnnvwhqkkxildtyjltklcokcrgqnnwzzeuqioyahqpuskkpbxhvzvqyhlegmoviogzwuiqahiouhnecjwysmtarjjdjqdrkljawzasriouuiqkcwwqsxifbndjmyprdozhwaoibpqrthpcjphgsfbeqrqqoqiqqdicvybzxhklehzzapbvcyleljawowluqgxxwlrymzojshlwkmzwpixgfjljkmwdtjeabgyrpbqyyykmoaqdambpkyyvukalbrzoyoufjqeftniddsfqnilxlplselqatdgjziphvrbokofvuerpsvqmzakbyzxtxvyanvjpfyvyiivqusfrsufjanmfibgrkwtiuoykiavpbqeyfsuteuxxjiyxvlvgmehycdvxdorpepmsinvmyzeqeiikajopqedyopirmhymozernxzaueljjrhcsofwyddkpnvcvzixdjknikyhzmstvbducjcoyoeoaqruuewclzqqqxzpgykrkygxnmlsrjudoaejxkipkgmcoqtxhelvsizgdwdyjwuumazxfstoaxeqqxoqezakdqjwpkrbldpcbbxexquqrznavcrprnydufsidakvrpuzgfisdxreldbqfizngtrilnbqboxwmwienlkmmiuifrvytukcqcpeqdwwucymgvyrektsnfijdcdoawbcwkkjkqwzffnuqituihjaklvthulmcjrhqcyzvekzqlxgddjoir")

class Solution {
    
    
   

}

