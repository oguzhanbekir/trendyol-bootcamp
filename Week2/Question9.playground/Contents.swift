import Foundation

//Guard Let and If Let Difference
//Guard let
//Early exist process from the scope
//Require scope existing like return, throw etc.
//Create a new variable that can be accessed outside the scope.
//*******************
//if let
//Can not access outside the scope.
//no need for return statement. But we can write
//NOTE: Both are used to unwrap the Optional variable.

//Oyun için dönme açıları ile ilgili bir switch case yapısı deneyiniz

enum Rotation {
    case quarterRotate
    case halfRotate
    case fullRotate
}
let direction = Rotation.quarterRotate

switch direction {
case .quarterRotate:
    print("Rotate 90 degrees")
case .halfRotate:
    print("Rotate 180 degrees")
case .fullRotate:
    print("Rotate 360 degrees")
}


//MARK: ODEV: Girilen sayının asal olup olmadığını bulan bir extension yazınız.

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


5.isPrimeNumber

//MARK: ODEV: İki Parametreli ve Farklı Tipli bir generic örneği yapınız (T,U)

func isSameType<T,U>(one: T, two: U) -> Void {
    if(type(of: one) == type(of: two)) {
        print("same type")
    }
    else {
        print("not same type")
    }
}

isSameType(one: "apple", two: 2)
