import UIKit


//1. На вход функции массив целых чисел. Напечатать количество чётных, нечётных, двузначных.

let numbers = [2, 3, 65, 5, 1, 14, 21]
func numberCount (numbers: [Int]) -> Void {
    var oddArray = [Int]()
    var unoddArray = [Int]()
    var twiceNumber = [Int]()
    
    for index in 0...numbers.count - 1 {
        let element = numbers[index] // element
        
        if element % 2 == 0 {
            oddArray.append(element)
        } else {
            unoddArray.append(element)
        }
        
        if element > 9 && element < 100 {
            twiceNumber.append(element)
        }
    }
    
    print("четные - \(oddArray), нечетные - \(unoddArray), двузначные - \(twiceNumber)")
}

numberCount(numbers: numbers)


//2. На вход функции массив чисел. Верните этот же массив, но с увеличенными на 10% элементами

func percent (percentNum: [Int]) -> [Double] {
    var array = [Double]()
    
    for element in percentNum {
        let num = Double(element) * 1.1
        array.append(num)
    }
    
    return array

}
let resultPerc = percent(percentNum: [1, 2, 3, 4, 1488])
print(resultPerc)

//3.Простое число - число, которое делится без остатка на само себя и на 1. Напишите функцию, принимающую на вход целое число и определяющее, простое оно или нет.  ( 7 - простое, 9 - не простое ) ++++

func easyNum (x: Int) -> Bool {
    for i in 1..<x {
        if x % i == 0 {
            return false
        }
    }
    return true
}
let easyNumResult = easyNum(x: 9)
print(easyNumResult)

func typeOfNumber2(x: Int) -> Bool {
    var value: Bool = true
    for number in 1..<x {
        if number >= 2 && x % number == 0 {
            value = false
        } else {
            value = true
        }// здесь был вопрос, спросить на занятии
    }
    return value
}

let resultTypeOfNumber2 = typeOfNumber2(x: 2)
print(resultTypeOfNumber2)

func simpleNumbers(from array: [Int]) -> [Int] {
    
    var simpleArray = [Int]()
    
    for number in array {
        if typeOfNumber2(x: number) {
            simpleArray.append(number)
        }
    }
    return simpleArray
}

let resultSimpleNumbers = simpleNumbers(from: [3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13])
print("Массив простых чисел = \(resultSimpleNumbers)")

//4.Напишите функцию, принимающую на вход массив целых чисел. Используя функцию из задачи 3 верните массив простых чисел из массива. Оценить сложность поиска простых чисел в массиве таким способом


func newNum (newArray: [Int]) -> [Int] {
    var easyArray = [Int]()
    
    
    for element in newArray {
        print("element is \(typeOfNumber2(x: element))")
        if typeOfNumber2(x: element) {
            easyArray.append(element)
        }
    }
    
    return easyArray
}
let numDone = newNum(newArray: [1, 2, 3, 7, 8, 13])
print(numDone)


//6.Напишите функцию, возвращающую среднее арифметическое элементов массива

var arrayAgain = [1, 2, 3, 4, 5]
func respect () -> Double {
    var sum: Double = 0
    for index in arrayAgain {
        sum += Double(index)
    }
    let arifm = sum / Double(arrayAgain.count)
    return arifm
}
let srednee = respect()
print(srednee)

//7.Есть дикшинари [String: Int] который функция принимает на вход, напишите функцию которая возвращает среднее арифметическое всех Int в словаре.
func sredniDict (superDict: [String: Int]) -> Double {
    var summ: Double = 0
    var arifm = [Int]()
    for value in superDict.values {
        arifm.append(value)
    }
    for index in arifm {
        summ += Double(index)
    }
    let allSum = summ / Double(arifm.count)
    return allSum
    
}
let newSrednee = sredniDict(superDict: ["a": 1, "b": 2, "c": 3, "d": 4])
print(newSrednee)


//8. Есть дикшинари [String: Int] написать функцию которая возвращает массив ключей и функцию которая возвращает массив значений


func keysFunc (dicti: [String: Int]) -> [String] {
    var keysArray = [String]()
    for key in dicti.keys  {
        keysArray.append(key)
    }
    return keysArray
}
let keyFuncDone = keysFunc(dicti: ["a": 1, "b": 2])
print(keyFuncDone)

func valuesFunc (dicti: [String: Int]) -> [Int] {
    var valuesArray = [Int]()
    for value in dicti.values  {
        valuesArray.append(value)
    }
    return valuesArray
}
let valueFuncDone = valuesFunc(dicti: ["a": 1, "b": 2])
print(valueFuncDone)


//9. На вход функции 2 массива. Первый - имена [“Петя”, “Гриша”, “Никола”]. Второй - соответствующие времена пробежки дистанции. [10, 6, 25] (Петя - за 10 минут, Гриша - 6 минут, Никола - 25 минут) . Написать функцию, возвращающую самого медленного и самого быстрого.
//
//let namesArray = ["Петя", "Гриша", "Николай"]
//let timeArray = [10, 6, 25]
////
//func getFullNameTime(names: [String], time: [Int]) -> [Int: String] {
//    var dict = [String: Int]()
//
//    let indexСамогоБы
//
//    return dict
// }
//
//let result1488 = getFullNameTime(names: ["Андрей"], time: [228])

//10. На вход функции 2 аргумента - искомое число и массив целых чисел. Вернуть true, если искомое число находится на первом или на последнем месте в массиве

func task10 (x: Int, zArray: [Int]) -> Bool {
    if x == zArray.last || x == zArray.first {
        return true
    } else {
        return false
    }
}
let task10Done = task10(x: 4, zArray: [4, 2, 6, 3, 1])
print(task10Done)


//11. На вход функции массив целых чисел. Вернуть true, если массив длины 1 или у него равны последний и первый элементы
func task11 (lost: [Int]) -> Bool {
    if  lost.first == lost.last && lost.count == 0 {
        return true
    } else {
        return false
    }
}
let taslDIne11 = task11(lost: [1, 2, 3, 4, 5, 6, 7])
print(taslDIne11)

//12.На вход функции 2 массива целых чисел. Вернуть true, если у них одинаковые последние ИЛИ первые элементы. Длина массивов произвольная и не обязательно одинаковая
func task12 (xArray: [Int], yArray: [Int]) -> Bool {
    if xArray.last == yArray.last || xArray.first == yArray.first {
        return true
    } else {
        return false
    }
}
let xyArrays = task12(xArray: [2, 9, 3], yArray: [1, 7, 5])
print(xyArrays)

 
//13. На вход функции массив целых чисел. Вернуть целое число - разницу между максимальным и минимальным элементом массива

func minmax(arrayMinMax: [Int]) -> Int {
    let difference = (arrayMinMax.max() ?? 0) - (arrayMinMax.min() ?? 0)
    return difference
}

func minmax1(arrayMinMax: [Int]) -> Int? {
    if let max = arrayMinMax.max(), let min = arrayMinMax.min() {
        return max - min
    } else {
        return nil
    }
}

func minmax2(arrayMinMax: [Int]) -> Int? {
    guard let max = arrayMinMax.max(), let min = arrayMinMax.min() else {
        return nil
    }
    
    return max - min
}


let differenceDone = minmax2(arrayMinMax: [1,10])
print(differenceDone)

//14. Написать функцию которая принимает на вход 2 массива: первый имен, второй фамилий. Массивы могут быть разной длины, но мы точно знаем что под одинаковыми индексами мы имеем соответствующие имя/фамилию. Вернуть словарь где ключ индекс, значение полное имя. Добавлять в словарь только если есть и имя и фамилия

var arrayName = ["Donald", "Vladimir", "George", "Andrei"]
var arraySecondName = ["Trump", "Putin", "Bush"]

func task44(arrayNames: [String], arraySurname: [String]) -> [Int: String] {
    var dict: [Int: String] = [:]
    //1. Выясняем какой массив длиннее
    //2. Идем в цикле по индексам этого массива
    for index in 0...самый длинный массив {
        let value = arrayName[index] + " " + arraySecondName[index]
        dict[index] = value
    }
    return dict
}
let fff1 = task44(arrayNames: arrayName, arraySurname: arraySecondName)
print(fff1)
