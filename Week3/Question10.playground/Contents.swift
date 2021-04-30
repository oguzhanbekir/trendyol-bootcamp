//By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.
//What is the 10 001st prime number?

import Foundation


func isPrimeNumber(number: Int) -> Bool {
   guard number > 1 else {
     return false
   }
   
   for i in 2..<number {
     if number % i == 0 {
       return false
     }
   }
   return true
}

func display10001stPrimeNumber() {
    var count = 0
    var n = 1
    var result = 0
    while n != 0
    {
        if count < 10001
        {
            if (isPrimeNumber(number: n))
            {
                count += 1;
                result = n;
            }
        }
        else
        {
            break;
        }
        n += 1
    }
    print(result)
}



display10001stPrimeNumber()
