import UIKit


//MARK: - just func
func loadData() {
    print("load data")
}

loadData()


//MARK: Функция с замыканием без переменных передаваемых в замыкание
func loadDataWithSomeClosure(completion: () -> Void) {
    print("loadData")
    completion()
}

loadDataWithSomeClosure(completion: {
    print("Данные загружены")
})


//MARK: - Пример функции с замыканием внутри которого пробрасывыается аргумент
struct SomeModel {
    let id: Int
    let name: String
}


func loadDataWithClosureVariable(completion: (_ model: SomeModel) -> Void) {
    print("loadData")
    let model = SomeModel(id: 12, name: "Andrei")
    completion(model)
}

loadDataWithClosureVariable { (model) in
    print(model.name)
}
