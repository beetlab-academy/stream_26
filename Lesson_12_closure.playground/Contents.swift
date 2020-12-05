import UIKit



//Closure - Замыкания

//func colculateSomething(completion: @escaping (Int) -> Void) {
//
//    print("Показываем лоадер") //1. Мы идем на сервер
//    print("ждем респонс от сервера")
//
//    DispatchQueue.main.asyncAfter(deadline: .now() + 3) { //
//        print("пришел респонс") // 2. в какой то рандомный момент нам приходит респонс
//        let result: Int = 1488 + 228 //Очень долгая допустим
//        completion(result)
//    }
//}
//
//var completion: (Int) -> Void = { result in
//    print("Делаем что то с данными")
//    print(result) //3. Делаем что то с данными
//    print("Лоадер скрываем") //4. Cкрываем лоадер
//
//}
//
//colculateSomething(completion: completion)


//var a: () -> Void = {
//    print("замыкание а")
//}
//
//
//func someFunc(closure: () -> Void) {
//    closure()
//    print("делаем что то")
//}
//
//someFunc(closure: a)
//
//someFunc(closure: {
//    print("замыкание которое мы написали прямо в аргументе функции")
//})


//MARK: посчитать произведение первых двух аргументов, результат передать в замыкание, а в замыкании распечатать в консоль значение умноженное на 18


//func colcolateSomeNum(firstNum: Int, secondNum: Int, onComplete: (Int) -> Void) {
//    let result = firstNum * secondNum
//    onComplete(result)
//}
//
//colcolateSomeNum(firstNum: 16, secondNum: 17) { (xuy) in
//    let newResult = xuy * 18
//    print(newResult)
//}
//
//colcolateSomeNum(firstNum: 2, secondNum: 3) { (result) in
//    print(result * 5)
//}


//func colculateSomeFunc2(firstNum: Int,
//                        secondNum: Int,
//                        onOddComplete: (Int, Int) -> Void,
//                        onUnOddComplete: (Int, Int) -> Void) {
//    let sum = firstNum + secondNum
//    let mult = firstNum * secondNum
//
//    if sum % 2 == 0 {
//        onUnOddComplete(sum, mult)
//    } else {
//        onOddComplete(sum, mult)
//    }
//}
//
//var oddCompletion: (Int, Int) -> Void = { sum, mult in
//    print("Сумма получилась нечетная и пиздец и результат суммы у нас \(sum), а результат умножения \(mult)")
//}
//
//var unOddComplete: (Int, Int) -> Void = { sum, mult in
//    print("Сумма получилась четная и результат суммы у нас \(sum), а результат умножения \(mult)")
//}
//
//
//colculateSomeFunc2(firstNum: 16,
//                   secondNum: 6,
//                   onOddComplete: oddCompletion,
//                   onUnOddComplete: unOddComplete)




//var someNum: Int = 0
//
//var firstNum = 0
//var secondNum = 0
//
//enum CalcType {
//    case addition
//    case muliplication
//    case division
//    case substraction
//
//}
//
//func someFunc(colculate: (Int, Int) -> Int) {
//    someNum = colculate(firstNum, secondNum)
//}
//
//
////Эта функция должна разруливать что делать с числами.
//func colculateSomething(type: CalcType, firstNum: Int, secondNum: Int) {
//    switch type {
//    case .addition:
//
//    someFunc(colculate: {
//        return $0 + $1
//    })
//
//    case .division:
//        someFunc(colculate: { firstNum, secondNum in
//            return firstNum / secondNum
//        })
//    case .muliplication:
//        someFunc { (firstNum, secondNum) -> Int in
//            return firstNum * secondNum
//        }
//
//    case .substraction:
//        someFunc { (first, second) -> Int in
//            return first - second
//        }
//    }
//}




//class Prorab {
//
//    func goToBuild(completion: () -> Void) -> Void {
//        print("Пиздуйте строить дом")
//        completion()
//
//    }
//
//}
//
//class Woker {
//    func buildBuilding() {
//        print("Мы пошли строить дом")
//    }
//}
//
//let prorab = Prorab()
//let woker = Woker()
//
//prorab.goToBuild(completion: {
//    woker.buildBuilding()
//})



//let array = [1, 2, 3, 4]
//
//let array2 = ["dsfas", "sdfsdaf", "sdafadsf", "dsfasfa"]
//
//array2.forEach2 { (string) in
//    print("pizdec \(string)")
//}
//
//
//public extension Array {
//
//    func forEach2(completion: (Element) -> Void) {
//        for element in self {
//            completion(element)
//        }
//    }
//}


//MARK: - Написать функциюю которая принимает на вход словарь и замыкание из которого выбрасывает наружу значения в этом словаре. Вызвать функцию и в замыкании для каждого значения добавить "_fromClosure" и распечатать строку "\(value) _fromClosure"
