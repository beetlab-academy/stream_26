import UIKit

//1. обьеденить два массива [1,2,3,4,5] и ["Привет", "ЧТо делаешь?", как дела?], распечатать все четные елементы получившегося массива.
//2. Сделать из массивов в задаче 1 cловарь где ключами сделать числа, написать функцию которая принимает на вход массив интов и получившийся словарь и в цикле проверяет наличие по ключам(элементами массива) наличие значений в словаре. Если их нету то выводит строку в консоль "Элемент по ключу {Ключ} ничего не найдено"
//3. Полиморфизм - написать определение и написать код с помощью которого можно показать полиморфизм
//4. Написать код, демонстрирующий наследования и дать определение.
//5. Продемонстрировать инкапсуляцию
//6. Что такое статические переменные и для чего они нужны?
//7. Привести 5 примеров Value Type и 1 Reference Type. Написать чем они отличаются и как хроняться в памяти.














func revers(int: Int) -> Int {
    let minus = int >= 0
    let str = String(int)
    let charecters = str.reversed()
    var reversedInt = Int(String(charecters)) ?? 0
    if minus {
        reversedInt = reversedInt * -1
    }
    return reversedInt
}

print(revers(int: -1233243234544))