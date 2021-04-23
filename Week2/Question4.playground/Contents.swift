//A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.
//Find the largest palindrome made from the product of two 3-digit numbers.


import UIKit

var result : Int = 0

func findPalindromeNumber() {
    for number1 in stride (from: 999, to: 100, by: -1){
        for number2 in stride(from: 999, to: 100, by: -1) {
            let multiplyNumber = number1 * number2
            let numberInStr = String(multiplyNumber)
            let reverseNoInStr = String(numberInStr.reversed())
            if (numberInStr == reverseNoInStr) {
                if (result < multiplyNumber) {
                    print(result)
                    result = multiplyNumber
                    break
                }
            }
        }
    }
    print("The largest palindrome number is \(result)")
}


findPalindromeNumber()
