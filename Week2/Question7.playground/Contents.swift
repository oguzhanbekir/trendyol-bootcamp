//1Elimizde sadece harflerden oluşan (noktalama işareti veya sayılar yok) uzun stringler olsun. Bu stringlerin içinde bazı hafrflerin tekrar edeceğini düşünün. Mesela 'a ' harfi 20 farklı yerde geçiyor. Bir fonksiyon ile verilen parametre değerine eşit ve daha fazla bulunan harfler silinecektir. Sonra geriye kalan string ekrana yazdırılacaktır.
//Örnek string: "aaba kouq bux" Tekrar sayısı 2 verildiğinde : a,b,u silinmeli ve ekrana "koq x" yazmalı Tekrar sayısı 3 verildiğinde : a silinmeli ve ekrana "b kouq bux" tekrar sayısı 4 verildiğinde : hiç bir harf silinmemeli aynı stringi yazmalı
//String ve tekrar sayısını parametre olarak alsın

import UIKit

var characterCount = [String: Int]()

func findRepeatingCharacter(text: inout String, count: Int) -> String {
    for item in text {

        if characterCount[String(item)] != nil {

            characterCount[String(item)]! += 1

            if characterCount[String(item)]! >= count && item != " " {
                text = text.replacingOccurrences(of: String(item), with: "")
            }

        } else {
            characterCount[String(item)] = 1
        }
    }
    if text.first == " " {
        text.remove(at: text.startIndex)

    }
    return text
}

var sampleText = "aaba kouq bux"
print(findRepeatingCharacter(text: &sampleText, count: 3))
