//2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.
//What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?

//To find the Greatest Common Divisor (GCD):
//GCD(a, b) = GCD(b, a % b)

import UIKit

var total = 1

func gcd(_ num1: Int, _ num2: Int) -> Int {
    let r = num1 % num2
    if r != 0 {
        return gcd(num2, r)
    } else {
        return num2
    }
}


for num2 in 1...20 {
    total = (total * num2) / gcd(total, num2)
}


print(total)
