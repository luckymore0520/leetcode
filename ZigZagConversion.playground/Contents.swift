//: Playground - noun: a place where people can play

import UIKit


extension String{
    func charAt(_ i:Int) -> Character?{
        if i >= self.characters.count || i < 0{
            return nil
        }
        let index = self.characters.index(self.startIndex, offsetBy: i)
        return self[index]
    }
}


class Solution {
    
    func convert(_ s: String, _ numRows: Int) -> String {
        let len = s.characters.count;
        if (len == 0 || numRows <= 1) {
            return s
        }
        var ans = Array<String>(repeatElement("", count: numRows))
        var row = 0
        var delta = 1;
        for i in 0...len-1 {
            ans[row].append(s.charAt(i)!)
            row = row + delta;
            if (row >= numRows) {
                row = numRows - 2;
                delta = -1;
            }
            if (row < 0) {
                row = 1;
                delta = 1;
            }
        }
        
        var ret = ""
        for i in 0...numRows - 1 {
            ret.append(ans[i])
        }
        return ret;
    }
}

let solution = Solution()
solution.convert("orfefwofihmozumjkgeilldtosfnorocltisrxxbelrdhdormtaxeftuxyhosxsdtbxkyuoehfkolyfxthwympskqcaibsnutkhtevylciznigkcohccywooaoychlycvfwbcuofepuowfqmouoordfttdvapudkbzmgvclzsfpomiaccqtvvyppdmrsiufkvtqqvdrnkjbzrddtwwrtwiiaucsdwzpushmomgdyphxgmdbibucycmyxoscnutjmcvcqdgoupocbremuaqsdcsctneihzrvboyrsghmvvpyovkjvadadwcylggshzninnbhvjusglrvibgdejgjfihqrpkyoajdpkllvhfeswzaahfeqlnyuwqnlblbdwesjpdewjiohjqjqynjlchhyxulagmdcrwlgbsfmcvwomfgmtpxxyfywzjyhycmpyxxbrcowakkmpqakixkgciectdjrhvghvgiokykkkuycnymvwydagicanorwladiilxsmhfwedytenocltcsdfusvnognrrvfoqrxvpdyowedmgoijilqeelsstfmkdtatkaobforctuqbjyktmayqnqkhxytarwvdyjfdawhvrywcyhxkjvcxnpglnbnfxjkxspbuoiphimjhvgteewbrnhcajqhibugtjjqzrfgctploygteewvrgaupsbztxhohqegkmpmfezuefpiklgbrgviazktwrjfiooucdihjhdqosayegcxozgoaqjzjtgtjunlzvuleydvqdtwkxuazcpzuaafthzedorfmmqqktlcyhbigvjfzahvahawozcsouxaipsukgwipztvuebvgiqgpregqhagdzilobfajdiyddtzhwvpgnwyecexlgfofozvrgvamfarlvsuspkydiyjkegwkokpcmkvuhvipvzaquwkjglmojyzogxyuhqwvctsmoadlcfewbqfibuwnuxdaudvevtbyntmdup",
    620)

