import UIKit

func findLargestPrimeFactor(number: Int) -> Int {
    var result = 2
    var number2 = number
    while number2 > result {
        if number2 % result == 0 {
            number2 = number2 / result
        } else {
            result = result + 1
        }
    }
    return result
}

print(findLargestPrimeFactor(number: 600851475143))
