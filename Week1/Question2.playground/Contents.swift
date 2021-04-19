import UIKit

func evenFibonacciNumbers(max: Int) -> Int {
    var num1 = 0
    var num2 = 1
    var temp = 0
    var sum = 0
    
    while num2 < 4000000 {
        if num2 % 2 == 0 {
            sum = sum + num2
        }
        
        temp = num1 + num2;
        num1 = num2;
        num2 = temp;
    }
    return sum
}


print(evenFibonacciNumbers(max: 4000000))
