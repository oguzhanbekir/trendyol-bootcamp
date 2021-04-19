
//If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
//Find the sum of all the multiples of 3 or 5 below 1000.

import UIKit

func multiplesOf3and5(max: Int) -> Int {
    var total = 0
    for item in 1..<max {
        if item % 3 == 0 || item % 5 == 0 {
            total = total + item
        }
    }
    return total
}

print(multiplesOf3and5(max : 1000))
