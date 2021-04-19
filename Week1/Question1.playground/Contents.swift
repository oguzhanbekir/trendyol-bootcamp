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
