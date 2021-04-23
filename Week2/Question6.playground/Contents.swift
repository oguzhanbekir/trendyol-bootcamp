//The sum of the squares of the first ten natural numbers is,
//The square of the sum of the first ten natural numbers is,
//Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is
//Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.

import UIKit

var x = Double()
var y = Double()

func sumSquareDifference(number : Double) -> Double {
    x = (number*(number+1)*(2*number+1)) / 6
    y = pow((number*(number+1)) / 2 , 2)
    return y - x
}

print(sumSquareDifference(number: 100))
