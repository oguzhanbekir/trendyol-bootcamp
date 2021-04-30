//By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.
//What is the 10 001st prime number?

import Foundation

extension Int {
    public var isPrimeNumber: Bool {
       guard self > 1 else {
         return false
       }
       
       for i in 2..<self {
         if self % i == 0 {
           return false
         }
       }
       return true
     }
}

func findOrderPrimeNumber(orderOfNumber: Int) {
    var count = 0
    var primeNumber = 1
    var result = 0
    while primeNumber != 0 {
        if count < orderOfNumber {
            if (primeNumber.isPrimeNumber) {
                count += 1;
                result = primeNumber;
            }
        } else {
            break;
        }
        primeNumber += 1
    }
    print(result)
}

findOrderPrimeNumber(orderOfNumber: 10001)
