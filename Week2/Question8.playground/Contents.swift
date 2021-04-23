//Elimizde uzun bir cümle olsun, Bazı kelimeler tekrar edecek bir cümle düşünün. İstediğimiz ise, hangi kelimeden kaç tane kullanıldığını bulmanız. string = "merhaba nasılsınız . iyiyim siz nasılsınız . bende iyiyim. "

import UIKit

let text = "merhaba nasılsınız . iyiyim siz nasılsınız . bende iyiyim."
var wordCountDict = [String: Int]()
var arrayText = text.components(separatedBy: " ")

for i in 0..<arrayText.count {
    if wordCountDict[arrayText[i]] == nil {
        wordCountDict[arrayText[i]] = 1
    }
    for a in 0..<arrayText.count {
        if a != i {
            if arrayText[i] == arrayText[a] {
                wordCountDict[arrayText[i]]! += 1
            }
        }
    }
}

print(wordCountDict)
