import UIKit

let firstValue = 10
let secondValue = 20
let thirdValue = 10


var x: Bool = false // или  true // 0 - false // 1 - true
x = firstValue == secondValue

if !x {
    
} else {
    
}

//MARK: - == -  равно (Сравниваем два значения)

if firstValue == secondValue {
    print("Правда")
} else {
    print("Неправда")
}

//MARK:-  != не равно (Сравниваем значения)
if !(firstValue == secondValue) {
    print("Правда")
} else {
    print("неправда")
}

if x != true {
    print()
}

//MARK: - Оператор ИЛИ - ||
            //x                         //y
if firstValue == thirdValue || firstValue == secondValue {
    print(true)
} else {
    print(false)
}

//Таблица истинности для оператора ||
//x y result
//0 1   1
//0 0   0
//1 1   1
//1 0   1


//MARK: - Оператор И - &&
print("Оператор &&")
    //         x                        y
if firstValue == thirdValue && firstValue == secondValue {
    print(true)
} else {
    print(false)
}

//Таблица истинности для оператора &&
//x y result
//0 1   0
//0 0   0
//1 1   1
//1 0   0

//MARK: - Операторы которые возвращают Bool >, <, >=, <=, !=, ==
//MARL: - форматирование кода //ctrl + i
//MARK: - Задача 1: Написать функцию которая принимает на вход число типа Int, и возвращает true если число четное, false если не четное
func isOdd(arg: Int) -> Bool {
    return arg % 2 == 0
}



if "Кошка" == "Собака" {
    print("Кошка это Собака")
} else if "Кошка" == "Рыба" {
    print("Кошка это рыба")
} else {
    print("Кошка это не понятно что")
}

//MARK: - Задача 2: Написать функцию которая принимает на вход число типа Int, и возвращает true если число четное и делится на 3 без остатка, false если не четное или не делится на 3
func isOdd3(arg: Int) -> Bool {
    return arg % 2 == 0 && arg % 3 == 0

}

let isOdd3Result = isOdd(arg: 6)
print(isOdd3Result)

//MARK: - Структуры данных: Arrray, Dictionary, Set
// Array
// | | | | | | | | | | | | | | | | | |

//MARK: - Статическая инициализация
let staticArray = [1, 3, 5, 6, 6] //- Индексы начинаются с 0

//MARK: - Добавление элементов в массив в конец с помощью  append (Динамическая инициализация)
var array: [Int] = [] // let array = [Int]()
array.append(3)
print(array)
// |3| | | | | | | | | | | | | | | | |
array.append(6)
print(array)

//MARK: - Обращение к элементу массива
print(array[0])
print(array[1])

let arrayF = [3, 6, 14, 9]
// |3|6|14|9| | | | | | | | | | | | | | - массив
// |0|1|2 |3| | | | | | | | | | | | | | - индексы
print("Длина массива - \(arrayF.count)")


// |3|6|14|9| | | | | | | | | | | | | | - массив
// |0|1|2 |3| | | | | | | | | | | | | | - индексы
array.insert(99, at: 0)
array.forEach { (element) in
    print(element * 2)
}

array.forEach { (xuy) in
    print()
}

//Как записать матрицу в массив
var matrix: [[Int]] = [[5, 3, 1, 3],
                       [3, -3, 1, 2],
                       [1, 2, 4, 8],
                       [3, -1, 1, 2]]
// |[5, 3, 1, 3]|[3, -3, 1, 2]|[1, 2, 4, 8]|[3, -1, 1, 2] | | | | | | | | | | | | | |

let row = [3, 4, 14, 99]
// |[5, 3, 1, 3]|[3, -3, 1, 2]|[1, 2, 4, 8]|[3, -1, 1, 2]|[3, 4, 14, 99] | | | | | | | | | | | | |

matrix.append(row)

let exampleArray = [1, 2, 10, 99, 384, 938, 2, 3, 4, 6]

//MARK: - Варианты написания аргументов функции func theHighestInt(_ array: [Int]) -> Int { - вызов без имени аргумент: theHighestInt(exampleArray)
//MARK: - Варианты написания аргументов функции func theHighestInt(with array: [Int]) -> Int { - вызов без имени аргумент: theHighestInt(with: exampleArray)

//MARK: - На вход функции был дан массив Int, вернуть самое большое Int из массива
func theHighestInt(with array: [Int]) -> Int {
    var highestNum = 0 // обьявляем переменную
    
    for index in 0...array.count - 1 { //(array.count - 1) -  самый большой индекс в массиве
        if array[index] > highestNum {
            highestNum = array[index]
        }
    }
    return highestNum
}

let result = theHighestInt(with: exampleArray)
print(result)

//MARK: - Задача: На вход функции поступает массив [Int], вернуть массив его индексов [Int].
func getIndexes(array: [Int]) -> [Int] {
    var indexes: [Int] = []

    for index in 0...array.count - 1 {
        indexes.append(index)
    }
    return indexes
}

let indexes = getIndexes(array: exampleArray)
print("Индексы: \(indexes)")

var string = "asdfasfsdafsadfasf" // - Массив Character
let charecter: Character = "A"
string.append(charecter)
print("Строка после добавления \(charecter) стала \(string) и ее длина теперь \(string.count)")


//MARK: - Задача: На вход поступает массив [Int], и число upperBound - Int, вернуть массив с индексами чисел которые: 1) Денис: - превышают - upperBound 2) Влад: - меньше или равны upperBound.


let newArray = [1, 2, 3]  // 1

func getIndexesUpperIndexes(_ array: [Int], upper: Int) -> [Int] { // 2
    var indexes = [Int]()
    
    for index in 0...array.count - 1 {
        if array[index] > upper {
            indexes.append(index)
        }
    }
    return indexes
}

let upperIndexes = getIndexesUpperIndexes(newArray, upper: 148) // 3
print("Upper indexex - \(upperIndexes)") // 4

//MARK: - Задача: На вход поступает массив [Int], и число upperBound - Int, вернуть массив значениями которые: 1) Влад: - превышают - upperBound 2) Денис: - меньше или равны upperBound.
func getIndexesUpper(_ array: [Int], upper: Int) -> [Int] { // 2
    var indexes = [Int]()
    
    for index in 0...array.count - 1 {
        if array[index] > upper {
            indexes.append(array[index])
        }
    }
    return indexes
}


let names = ["Андрей", "Денис", "Влад"]

for (index, value) in names.enumerated() {
    print("index - \(index), value - \(value)")
}


for name in names {
    print(name)
}

["Андрей", "Денис", "Влад"].forEach { (element) in
    print(element)
}



//MARK: - Домашняя работа
//1. Написать функцию с 2 целочисленными аргументы. Вернуть true, если первое делится без остатка на второе и false иначе
//2. Написать функцию с 2 целочисленными аргументами. Вернуть наименьшее число из функции
//3. Написать функцию с 2 целочисленными аргументами. Вернуть нечётный аргумент
//4. Написать функцию с 3 целочисленными аргументами. Вернуть наибольший аргумент
//5. На вход функции 3 числа - стороны требудеугольника. Во-первых, используя функцию существования треугольника, определить, существует ли он. Если существует - определить, какой он - равносторонний, равнобедренный или прост треугольник. Если он не существует из функции вернуть строчку “не существует”. А если да - один из типов “равносторонний”, “равнобедренный”, “прост треугольник”
// 6. Написать функцию по её математическому описанию: y = f(x), где y = 2x -10, если x > 0, y = 0, если x == 0, y = x*x - 4x +14, если x < 0
//7. Написать функцию, вычисляющую длину окружности. Радиус на вход в качестве аргумента ( Double ). На выходе - длина окружности. Число пи так писать Double.pi.
//8. Написать функцию, принимающую на вход аргумент - длина стороны квадрата. Найти радиус вписанной окружности ( радиус вписанной в квадрат окружности - половина его стороны - нарисуйте и проверьте на бумажке) и вызвать функцию из п.8. Результат длины окружности вернуть из функции.
//9. Написать функцию, определяющую площадь круга по его радиусу ( то же, что в зад7, но площадь - загуглите формулу)
//10. Используем встроенную sqrt(). Написать функцию, по двум катетам прямоугольного треугольника возвращающую гипотенузу ( теорему пифагора гугланите )
//11. На вход функции 1 целочисленный аргумент. Напечатать в консоль все НЕЧЕТНЫЕ числа, не превосходящие это число
//12. На вход функции 2 целочисленных аргумента. Напечатать квадраты чисел, находящиеся между 1 и 2 аргументом. ( внимание! 1 аргумент должен быть больше 2-го )

//Перед следующим уроком можно подготовиться Dictionary, Set, Optional

